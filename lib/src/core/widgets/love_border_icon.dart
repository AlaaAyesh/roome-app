import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../features/roome/presentation/cubits/favorite/favorite_cubit.dart';
import '../models/hotel.dart';

class LoveBorderIcon extends StatelessWidget {
  const LoveBorderIcon({
    super.key,
    required this.hotel,
    required this.iconSize,
    required this.borderColor,
  });

  final Hotel hotel;
  final double iconSize;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCubit, FavoriteStates>(
        builder: (context, index) {
      FavoriteCubit cubit = BlocProvider.of<FavoriteCubit>(context);
      return IconButton(
        onPressed: () {
          // if it's in favorite, remove : else add
          cubit.favoriteHotels.contains(hotel)
              ? cubit.removeFromFav(hotelId: hotel.id!)
              : cubit.addToFav(hotelId: hotel.id!);
        },
        icon: Icon(
          cubit.favoriteHotels.contains(hotel)
              ? Icons.favorite
              : Icons.favorite_border,
          color:
              cubit.favoriteHotels.contains(hotel) ? Colors.red : borderColor,
          size: iconSize.w,
        ),
      );
    });
  }
}
