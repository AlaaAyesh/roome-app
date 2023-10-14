import 'package:flutter/material.dart';
import 'package:roome/src/features/profile/presentation/widgets/edit_profile_view_body.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: EditProfileViewBody()),
    );
  }
}
