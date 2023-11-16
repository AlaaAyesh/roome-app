import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
            padding: const EdgeInsets.all(8),
            physics: const NeverScrollableScrollPhysics(),
            // Download all items at the same time
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return FadeInRight(
                from: AppConstants.fadeInHorizontalValue,
                child: HotelCard(
                  // cardHeight: 240,
                  cardWidth: double.infinity,
                  hotel: state.hotels[index],
                ),
              );
            },
            separatorBuilder: (context, index) =>
                const SeparatorWidget(height: 15),
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
