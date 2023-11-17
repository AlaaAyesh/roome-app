import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roome/src/config/themes/cubit/themes_cubit.dart';
import 'package:roome/src/core/utils/app_constants.dart';
import 'package:roome/src/core/utils/app_text_styles.dart';
import 'package:roome/src/core/widgets/bottom_spacer.dart';
import 'package:roome/src/core/widgets/custom_sliver_app_bar.dart';
import 'package:roome/src/features/profile/presentation/widgets/edit_profile_form.dart';
import 'package:roome/src/features/profile/presentation/widgets/profile_image.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ThemesCubit, ThemeData>(
        builder: (context, state) => SafeArea(
          child: CustomScrollView(
            physics: AppConstants.physics,
            slivers: [
              CustomSliverAppBar(
                centerTitle: true,
                title: FadeInRight(
                  from: AppConstants.fadeInHorizontalValue,
                  child: Text(
                    'Edit Profile',
                    style: state.brightness == Brightness.light
                        ? AppTextStyles.appBarTextStyle
                        : AppTextStyles.appBarTextStyle
                            .copyWith(color: Colors.white),
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 44),
                sliver: SliverToBoxAdapter(
                  child: Column(
                    children: <Widget>[
                      FadeInLeft(
                        from: AppConstants.fadeInHorizontalValue,
                        child: const ProfileImage(),
                      ),
                      const SizedBox(height: 49),
                      const EditProfileForm(),
                      const BottomSpacer(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
