import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '/src/core/utils/app_navigator.dart';
import '/src/core/widgets/get_back_arrow.dart';
import '/src/features/search/presentation/widgets/search_result_list_view.dart';

import 'search_text_field.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(
              top: 40.h,
              bottom: 16.h,
              right: 27.w,
              left: 14.w,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    GetBackArrow(onTap: () => context.getBack()),
                    SizedBox(width: 8.w),
                    const Expanded(child: SearchTextField()),
                  ],
                ),
                SizedBox(height: 16.h),
                const SearchResultListView(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
