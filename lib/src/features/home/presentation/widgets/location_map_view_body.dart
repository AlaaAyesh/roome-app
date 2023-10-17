import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reusable_components/reusable_components.dart';
import 'package:roome/src/core/utils/app_colors.dart';
import 'package:roome/src/core/utils/app_navigator.dart';
import 'package:roome/src/core/utils/app_text_styles.dart';

import '../../../../config/routes/routes.dart';

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
    return Stack(
      alignment: Alignment.bottomRight,
      children: <Widget>[
        OSMFlutter(
          controller: _mapController,
          mapIsLoading: CustomCircularProgressIndicator(
            color: AppColors.primaryColor,
            backgroundColor: Colors.white,
          ),
          osmOption: OSMOption(
            markerOption: MarkerOption(
              defaultMarker: MarkerIcon(
                icon: Icon(
                  Icons.person_pin_circle,
                  color: Colors.black,
                  size: 48.w,
                ),
              ),
            ),
            roadConfiguration: const RoadOption(roadColor: Colors.lightBlue),
            showZoomController: true,
            zoomOption: ZoomOption(
              initZoom: 12.w,
              minZoomLevel: 4.w,
              maxZoomLevel: 14.w,
              stepZoom: 1.0.w,
            ),
            userLocationMarker: UserLocationMaker(
              personMarker: MarkerIcon(
                icon: Icon(
                  Icons.person_pin_circle,
                  color: AppColors.primaryColor,
                  size: 48.w,
                ),
              ),
              directionArrowMarker: MarkerIcon(
                icon: Icon(
                  Icons.location_on,
                  color: Colors.purple,
                  size: 48.w,
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
          padding: EdgeInsets.only(right: 8.w, bottom: 16.h),
          child: MyCustomButton(
            backgroundColor: AppColors.primaryColor,
            height: 30.h,
            width: SizeConfig.screenWidth! * 0.3,
            borderRadius: BorderRadius.circular(16.r),
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
