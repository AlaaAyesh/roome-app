import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:open_street_map_search_and_pick/open_street_map_search_and_pick.dart';
import 'package:roome/src/core/utils/app_colors.dart';
import 'package:roome/src/core/utils/app_text_styles.dart';

class SearchLocationViewBody extends StatefulWidget {
  const SearchLocationViewBody({super.key});

  @override
  State<SearchLocationViewBody> createState() => _SearchLocationViewBodyState();
}

class _SearchLocationViewBodyState extends State<SearchLocationViewBody> {
  late double _currentLat;
  late double _currentLong;

  @override
  void initState() {
    Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      setState(() {
        _currentLat = position.latitude;
        _currentLong = position.longitude;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return OpenStreetMapSearchAndPick(
      center: LatLong(_currentLat, _currentLong),
      buttonColor: AppColors.primaryColor,
      locationPinIconColor: AppColors.primaryColor,
      locationPinTextStyle: AppTextStyles.textStyle15.copyWith(
        color: AppColors.primaryColor,
        fontWeight: FontWeight.bold,
      ),
      hintText: 'Search',
      buttonHeight: 40,
      buttonWidth: double.infinity,
      buttonTextStyle: AppTextStyles.textStyle15.copyWith(
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      locationPinText: 'My Location',
      onPicked: (pickedData) {
        setState(() {
          _currentLat = pickedData.latLong.latitude;
          _currentLong = pickedData.latLong.longitude;
        });
      },
    );
  }
}
