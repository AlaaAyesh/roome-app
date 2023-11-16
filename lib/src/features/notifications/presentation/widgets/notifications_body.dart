import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roome/src/core/utils/app_assets.dart';
import 'package:roome/src/core/utils/app_constants.dart';
import 'package:roome/src/core/widgets/custom_sliver_app_bar.dart';
import 'package:roome/src/core/widgets/separator_widget.dart';
import 'package:roome/src/features/notifications/presentation/cubit/notifications_cubit.dart';
import 'package:roome/src/features/notifications/presentation/widgets/notifications_card.dart';
import 'package:roome/src/features/roome/presentation/cubit/roome_cubit.dart';

class NotificationsBody extends StatelessWidget {
  const NotificationsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationsCubit, NotificationsState>(
      builder: (context, state) {
        NotificationsCubit cubit = BlocProvider.of<NotificationsCubit>(context);

        return cubit.notifications.isNotEmpty
            ? FadeInUp(
                from: AppConstants.fadeInUpValue,
                child: CustomScrollView(
                  physics: AppConstants.physics,
                  slivers: [
                    CustomSliverAppBar(
                      titleText: 'Notifications',
                      arrowBackOnTap: () {
                        BlocProvider.of<RoomeCubit>(context)
                            .changeBottomNavToHome(context);
                        BlocProvider.of<RoomeCubit>(context).getUserData();
                      },
                    ),
                    SliverPadding(
                      padding: const EdgeInsets.only(
                        top: 40,
                        bottom: 16,
                        right: 29,
                        left: 29,
                      ),
                      sliver: SliverFillRemaining(
                        child: ListView.separated(
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: cubit.notifications.length,
                          itemBuilder: (context, index) {
                            return NotificationCard(
                              notification: cubit.notifications[index],
                            );
                          },
                          separatorBuilder: (context, index) =>
                              const SeparatorWidget(height: 33),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : FadeInDown(
                from: AppConstants.fadeInUpValue,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      right: 27,
                      left: 14,
                    ),
                    child: SvgPicture.asset(
                      AppAssets.imageNoNotifications,
                      fit: BoxFit.contain,
                      width: double.infinity,
                    ),
                  ),
                ),
              );
      },
    );
  }
}
