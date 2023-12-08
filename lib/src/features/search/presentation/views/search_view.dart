import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roome/src/core/utils/app_constants.dart';
import 'package:roome/src/core/widgets/get_back_arrow.dart';
import 'package:roome/src/features/search/presentation/widgets/search_result_list_view.dart';
import 'package:roome/src/features/search/presentation/widgets/search_text_field.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          physics: AppConstants.physics,
          slivers: <Widget>[
            SliverPadding(
              padding: EdgeInsets.only(
                top: 20.h,
                bottom: 16.h,
                right: 27.w,
                left: 14.w,
              ),
              sliver: SliverToBoxAdapter(
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        const GetBackArrow(),
                        SizedBox(width: 8.w),
                        const Expanded(child: SearchTextField()),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.only(right: 27.w, left: 14.w),
              sliver: const SliverToBoxAdapter(
                child: SearchResultListView(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
