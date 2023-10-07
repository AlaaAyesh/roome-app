import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reusable_components/reusable_components.dart';
import 'package:roome/src/core/utils/app_colors.dart';
import 'package:roome/src/core/utils/app_navigator.dart';
import 'package:roome/src/core/utils/app_text_styles.dart';
import 'package:roome/src/features/roome/presentation/cubit/roome/roome_cubit.dart';
import 'package:roome/src/features/roome/presentation/widgets/favorite_card.dart';

import '../models/hotel.dart';

class RemoveFromFavBottomSheet {
  static void show({
    required BuildContext context,
    required Hotel hotel,
    required RoomeCubit cubit,
  }) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => MyCustomBottomSheet(hotel: hotel, cubit: cubit),
    );
  }
}

class MyCustomBottomSheet extends StatefulWidget {
  const MyCustomBottomSheet({
    super.key,
    required this.hotel,
    required this.cubit,
  });

  final Hotel hotel;
  final RoomeCubit cubit;

  @override
  State<MyCustomBottomSheet> createState() => _MyCustomBottomSheetState();
}

class _MyCustomBottomSheetState extends State<MyCustomBottomSheet>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _initController();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _initController() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      showDragHandle: true,
      enableDrag: true,
      animationController: _animationController,
      onDragStart: (_) {
        _animationController.forward();
      },
      shape: RoundedRectangleBorder(
        // <-- SEE HERE
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(50.0.r),
        ),
      ),
      backgroundColor: Colors.white,
      dragHandleColor: AppColors.darkGrey.withOpacity(0.49),
      dragHandleSize: Size(50.w, 3.h),
      onClosing: () => context.getBack(),
      builder: (context) => ListView(
        shrinkWrap: true,
        padding: EdgeInsets.only(
          right: 15.w,
          left: 15.w,
          bottom: 30.h,
        ),
        children: <Widget>[
          Text(
            'Remove from favorite?',
            style: AppTextStyles.appBarTextStyle.copyWith(
              color: Colors.black.withOpacity(0.71),
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: SizeConfig.screenHeight! * 0.046),
          FavoriteCard(
            cubit: widget.cubit,
            hotel: widget.hotel,
          ),
          SizedBox(height: SizeConfig.screenHeight! * 0.033),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              MyCustomButton(
                height: 50.h,
                width: 148.w,
                borderRadius: BorderRadius.all(Radius.circular(12.r)),
                backgroundColor: AppColors.primaryColor.withOpacity(0.24),
                onPressed: () => context.getBack(),
                hasPrefix: false,
                child: Center(
                  child: Text(
                    'Cancel',
                    style: AppTextStyles.textStyle15.copyWith(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              MyCustomButton(
                onPressed: () {
                  widget.cubit.removeFromFav(
                    hotelId: widget.hotel.id!,
                  );
                  context.getBack();
                },
                height: 50.h,
                width: 148.w,
                borderRadius: BorderRadius.all(Radius.circular(12.r)),
                backgroundColor: AppColors.primaryColor,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 4.93.w),
                    blurRadius: 18.49.w,
                    color: AppColors.primaryColor.withOpacity(0.56),
                  ),
                ],
                hasPrefix: false,
                child: Center(
                  child: Text(
                    'Yes, remove',
                    style: AppTextStyles.textStyle15.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
