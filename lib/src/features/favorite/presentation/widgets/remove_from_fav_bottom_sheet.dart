import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roome/src/config/themes/cubit/themes_cubit.dart';
import 'package:roome/src/core/models/user/hotel.dart';
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
  }) {
    showModalBottomSheet<Widget>(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => FavBottomSheet(hotel: hotel),
    );
  }
}

class FavBottomSheet extends StatefulWidget {
  const FavBottomSheet({
    super.key,
    required this.hotel,
  });

  final Hotel hotel;

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
      builder: (context, themeState) =>
          BlocBuilder<FavoriteCubit, FavoriteState>(
        builder: (context, state) {
          return BottomSheet(
            showDragHandle: true,
            enableDrag: true,
            animationController: _animationController,
            onDragStart: (_) {
              _animationController.forward();
            },
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
                      color: themeState.brightness == Brightness.light
                          ? Colors.black.withOpacity(0.71)
                          : Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16.h),
                  FavoriteCard(
                    hotel: widget.hotel,
                  ),
                  SizedBox(height: 32.h),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: MainButton(
                          backgroundColor:
                              AppColors.primaryColor.withOpacity(0.24),
                          onPressed: () => context.getBack(),
                          text: 'Cancel',
                          textColor: AppColors.primaryColor,
                        ),
                      ),
                      SizedBox(width: 16.w),
                      Expanded(
                        child: GlowingCustomButton(
                          onPressed: () {
                            BlocProvider.of<FavoriteCubit>(context)
                                .removeFromFav(
                              hotelId: widget.hotel.id!,
                            );
                            context.getBack();
                          },
                          buttonText: 'Yes, remove',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
