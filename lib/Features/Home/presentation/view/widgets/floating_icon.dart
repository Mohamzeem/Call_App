import 'package:call/Core/App/app_info.dart';
import 'package:call/Core/Utils/app_colors.dart';
import 'package:call/Core/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class ContactsIcon extends StatelessWidget {
  const ContactsIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => MyApp.navigation.navigateTo(AppRouter.contactsView),
      backgroundColor: AppColors.mainColor,
      child: const Icon(
        IconlyBold.user_3,
        size: 40,
        color: AppColors.kWhite,
      ),
    );
  }
}
