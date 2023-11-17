import 'package:flutter/material.dart';
import 'package:roome/src/core/utils/app_constants.dart';
import 'package:roome/src/core/widgets/get_back_arrow.dart';
import 'package:roome/src/features/search/presentation/widgets/search_result_list_view.dart';
import 'package:roome/src/features/search/presentation/widgets/search_text_field.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          physics: AppConstants.physics,
          slivers: <Widget>[
            SliverPadding(
              padding: EdgeInsets.only(
                top: 40,
                bottom: 16,
                right: 27,
                left: 14,
              ),
              sliver: SliverToBoxAdapter(
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        GetBackArrow(),
                        SizedBox(width: 8),
                        Expanded(child: SearchTextField()),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.only(right: 27, left: 14),
              sliver: SliverFillRemaining(
                child: SearchResultListView(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
