import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roome/src/config/themes/cubit/themes_cubit.dart';
import 'package:roome/src/core/models/hotel.dart';
import 'package:roome/src/core/utils/app_colors.dart';
import 'package:roome/src/core/utils/app_navigator.dart';
import 'package:roome/src/core/utils/app_text_styles.dart';
import 'package:roome/src/core/widgets/glowing_custom_button.dart';
import 'package:roome/src/core/widgets/my_custom_button.dart';
import 'package:roome/src/features/favorite/presentation/cubit/favorite_cubit.dart';
import 'package:roome/src/features/favorite/presentation/widgets/favorite_card.dart';

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
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(50.0),
          ),
        ),
        backgroundColor:
            state.brightness == Brightness.light ? Colors.white : Colors.black,
        dragHandleColor: state.brightness == Brightness.light
            ? AppColors.darkGrey.withOpacity(0.49)
            : AppColors.white60,
        dragHandleSize: const Size(50, 3),
        onClosing: () => context.getBack(),
        builder: (context) => Padding(
          padding: const EdgeInsets.only(right: 15, left: 15, bottom: 30),
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
              const SizedBox(height: 16),
              FavoriteCard(
                cubit: widget.cubit,
                hotel: widget.hotel,
              ),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  MyCustomButton(
                    height: 50,
                    width: 148,
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
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
      ),
    );
  }
}
