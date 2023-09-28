import 'package:call/Core/Utils/app_padding.dart';
import 'package:call/Features/Profile/presentation/view/widgets/build_developer.dart';
import 'package:call/Features/Profile/presentation/view/widgets/build_version.dart';
import 'package:call/Features/Profile/presentation/view/widgets/logout.dart';
import 'package:call/Features/Profile/presentation/view/widgets/photo.dart';
import 'package:flutter/material.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppPadding().w25),
      child: const Column(
        children: [
//~ profile photo
          ProfilePhoto(),
//~ build developer
          BuildDeveloper(),
//~ build developer
          BuildVerison(),
//~ logut button
          Logout(),
        ],
      ),
    );
  }
}
