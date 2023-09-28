import 'package:call/Core/Widgets/custom_appbar.dart';
import 'package:call/Features/Profile/presentation/view/widgets/body.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(isProfile: true, isArrowBack: true),
        body: ProfileBody(),
      ),
    );
  }
}
