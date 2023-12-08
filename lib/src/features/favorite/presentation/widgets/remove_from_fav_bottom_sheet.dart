import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roome/src/config/themes/cubit/themes_cubit.dart';
import 'package:roome/src/core/models/hotel.dart';
import 'package:roome/src/core/utils/app_colors.dart';
import 'package:roome/src/core/utils/app_navigator.dart';
import 'package:roome/src/core/utils/app_text_styles.dart';
import 'package:roome/src/core/widgets/glowing_custom_button.dart';
import 'package:roome/src/core/widgets/main_button.dart';
import 'package:roome/src/features/favorite/presentation/cubit/favorite_cubit.dart';
import 'package:roome/src/features/favorite/presentation/widgets/favorite_card.dart';

class RemoveFromFavBottomSheet {
  static void show({
    required BuildContext context,
    required Hotel hotel,
    required FavoriteCubit cubit,
  }) {
    showModalBottomSheet<Widget>(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => FavBottomSheet(hotel: hotel, cubit: cubit),
    );
  }
}

class FavBottomSheet extends StatefulWidget {
  const FavBottomSheet({
    super.key,
    required this.hotel,
    required this.cubit,
  });

  final Hotel hotel;
  final FavoriteCubit cubit;

  @override
  State<FavBottomSheet> createState() => _FavBottomSheetState();
}

class _FavBottomSheetState extends State<FavBottomSheet>
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
        builder: (context) => Padding(
          padding: EdgeInsets.only(
            right: 15.w,
            left: 15.w,
            bottom: 30.h,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
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
              SizedBox(height: 16.h),
              FavoriteCard(
                cubit: widget.cubit,
                hotel: widget.hotel,
              ),
              SizedBox(height: 32.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  MainButton(
                    backgroundColor: AppColors.primaryColor.withOpacity(0.24),
                    onPressed: () => context.getBack(),
                    text: 'Cancel',
                    textColor: AppColors.primaryColor,
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
      ),
    );
  }
}
