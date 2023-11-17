import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:roome/src/config/routes/routes.dart';
import 'package:roome/src/core/utils/app_colors.dart';
import 'package:roome/src/core/utils/app_navigator.dart';
import 'package:roome/src/core/utils/app_text_styles.dart';
import 'package:roome/src/core/widgets/my_custom_button.dart';

class LocationViewBody extends StatefulWidget {
  const LocationViewBody({super.key});

  @override
  State<LocationViewBody> createState() => _LocationViewBodyState();
}

class _LocationViewBodyState extends State<LocationViewBody> {
  final MapController _mapController = MapController(
    initMapWithUserPosition: const UserTrackingOption(
      enableTracking: true,
      unFollowUser: false,
    ),
  );

  @override
  void dispose() {
    _mapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Stack(
      alignment: Alignment.bottomRight,
      children: <Widget>[
        OSMFlutter(
          controller: _mapController,
          mapIsLoading: const CircularProgressIndicator(
            color: AppColors.primaryColor,
            backgroundColor: Colors.white,
          ),
          osmOption: OSMOption(
            markerOption: MarkerOption(
              defaultMarker: const MarkerIcon(
                icon: Icon(
                  Icons.person_pin_circle,
                  color: Colors.black,
                  size: 48,
                ),
              ),
            ),
            roadConfiguration: const RoadOption(roadColor: Colors.lightBlue),
            showZoomController: true,
            zoomOption: const ZoomOption(
              initZoom: 12,
              minZoomLevel: 4,
              maxZoomLevel: 14,
              stepZoom: 1.0,
            ),
            userLocationMarker: UserLocationMaker(
              personMarker: const MarkerIcon(
                icon: Icon(
                  Icons.person_pin_circle,
                  color: AppColors.primaryColor,
                  size: 48,
                ),
              ),
              directionArrowMarker: const MarkerIcon(
                icon: Icon(
                  Icons.location_on,
                  color: Colors.purple,
                  size: 48,
                ),
              ),
            ),
          ),
          onMapIsReady: (isReady) async {
            if (isReady) {
              await Future.delayed(const Duration(seconds: 1), () async {
                await _mapController.currentLocation();
              });
            }
          },
        ),
        Padding(
          padding: const EdgeInsets.only(right: 8, bottom: 16),
          child: MyCustomButton(
            backgroundColor: AppColors.primaryColor,
            height: 30,
            width: size.width * 0.3,
            borderRadius: BorderRadius.circular(16),
            onPressed: () =>
                context.navigateTo(routeName: Routes.searchLocationViewRoute),
            hasPrefix: false,
            child: Center(
              child: Text(
                'Search',
                style: AppTextStyles.textStyle12.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
