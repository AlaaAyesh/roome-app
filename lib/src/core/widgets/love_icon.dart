import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../features/roome/presentation/cubits/favorite/favorite_cubit.dart';
import '../models/hotel.dart';

class LoveIcon extends StatelessWidget {
  const LoveIcon({super.key, required this.hotel, this.favoriteBorder = false});

  final Hotel hotel;
  final bool favoriteBorder;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCubit, FavoriteStates>(
      builder: (context, state) {
        FavoriteCubit cubit = BlocProvider.of<FavoriteCubit>(context);
        return IconButton(
          onPressed: () {
            // if it's in favorite, remove : else add
            cubit.favoriteHotels.contains(hotel)
                ? cubit.removeFromFav(hotelId: hotel.id!)
                : cubit.addToFav(hotelId: hotel.id!);
          },
          icon: favoriteBorder
              ? Icon(
                  cubit.favoriteHotels.contains(hotel)
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color: cubit.favoriteHotels.contains(hotel)
                      ? Colors.red
                      : Colors.white,
                  size: 24.w,
                )
              : Icon(
                  Icons.favorite,
                  color: cubit.favoriteHotels.contains(hotel)
                      ? Colors.red
                      : Colors.white,
                  size: 18.w,
                ),
        );
      },
    );
  }
}
