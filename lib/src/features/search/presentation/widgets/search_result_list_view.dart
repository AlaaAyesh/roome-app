import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roome/src/core/utils/app_colors.dart';

import '../../../../core/widgets/separator_widget.dart';
import '../cubit/search_cubit.dart';
import 'search_hotel_card.dart';

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
            // TODO: Delete SearchHotelCard from the whole project and use HotelCard instead
            itemBuilder: (context, index) {
              debugPrint("DATA: ${state.hotels[index].toString()}");

              return SearchHotelCard(
                hotel: state.hotels[index],
              );
            },
            separatorBuilder: (context, index) => SeparatorWidget(height: 15.h),
            itemCount: state.hotels.length,
          );
        } else if (state is SearchLoadingState) {
          return LinearProgressIndicator(
            color: AppColors.primaryColor,
            backgroundColor: Colors.white,
          );
        } else {
          return Container();
        }
      },
    );
  }
}
