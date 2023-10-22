import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reusable_components/reusable_components.dart';

import '../../../../core/models/hotel.dart';
import '../../../../core/widgets/glowing_custom_button.dart';
import '../cubit/favorite_cubit.dart';
import '/src/config/themes/cubit/themes_cubit.dart';
import '/src/core/utils/app_colors.dart';
import '/src/core/utils/app_navigator.dart';
import '/src/core/utils/app_text_styles.dart';
import '/src/features/favorite/presentation/widgets/favorite_card.dart';

class RemoveFromFavBottomSheet {
  static void show({
    required BuildContext context,
    required Hotel hotel,
    required FavoriteCubit cubit,
  }) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => FavRemoveBottomSheet(hotel: hotel, cubit: cubit),
    );
  }
}

class FavRemoveBottomSheet extends StatefulWidget {
  const FavRemoveBottomSheet({
    super.key,
    required this.hotel,
    required this.cubit,
  });

  final Hotel hotel;
  final FavoriteCubit cubit;

  @override
  State<FavRemoveBottomSheet> createState() => _FavRemoveBottomSheetState();
}

class _FavRemoveBottomSheetState extends State<FavRemoveBottomSheet>
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
    return BlocBuilder<ThemesCubit, ThemeData>(
      builder: (context, state) => BottomSheet(
        showDragHandle: true,
        enableDrag: true,
        animationController: _animationController,
        onDragStart: (_) {
          _animationController.forward();
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(50.0.r),
          ),
        ),
        backgroundColor:
            state.brightness == Brightness.light ? Colors.white : Colors.black,
        dragHandleColor: state.brightness == Brightness.light
            ? AppColors.darkGrey.withOpacity(0.49)
            : AppColors.white60,
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
                color: state.brightness == Brightness.light
                    ? Colors.black.withOpacity(0.71)
                    : Colors.white,
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
                GlowingCustomButton(
                  onPressed: () {
                    widget.cubit.removeFromFav(
                      hotelId: widget.hotel.id!,
                    );
                    context.getBack();
                  },
                  buttonText: 'Yes, remove',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
