import 'package:call/Core/App/app_info.dart';
import 'package:call/Core/Widgets/custom_appbar.dart';
import 'package:call/Features/Profile/presentation/view/widgets/body.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'Hello,,, ${MyApp.currentUser!.name!}',
          isProfile: true,
          isArrowBack: true,
        ),
        body: const ProfileBody(),
      ),
    );
  }
}
