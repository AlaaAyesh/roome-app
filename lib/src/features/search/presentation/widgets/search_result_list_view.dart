import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reusable_components/reusable_components.dart';
import 'package:roome/src/core/utils/app_constants.dart';
import 'package:roome/src/core/widgets/hotel_card.dart';
import 'package:roome/src/core/widgets/separator_widget.dart';
import 'package:roome/src/features/search/presentation/cubit/search_cubit.dart';
import 'package:roome/src/features/search/presentation/widgets/shimmer_search_result.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchSuccessState) {
          return ListView.separated(
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            // Download all items at the same time
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return FadeInRight(
                from: AppConstants.fadeInHorizontalValue,
                child: HotelCard(
                  cardHeight: SizeConfig.screenHeight! * 0.24,
                  cardWidth: SizeConfig.screenWidth! * 0.55,
                  hotel: state.hotels[index],
                ),
              );
            },
            separatorBuilder: (context, index) => SeparatorWidget(height: 15.h),
            itemCount: state.hotels.length,
          );
        } else if (state is SearchLoadingState) {
          return const ShimmerSearchResult();
        } else if (state is SearchErrorState) {
          return const ShimmerSearchResult();
        } else {
          return Container();
        }
      },
    );
  }
}
