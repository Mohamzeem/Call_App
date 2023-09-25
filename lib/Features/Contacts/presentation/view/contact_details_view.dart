import 'package:call/Core/Widgets/custom_appbar.dart';
import 'package:call/Core/Widgets/custom_text.dart';
import 'package:flutter/material.dart';

class ContactDetailsView extends StatelessWidget {
  const ContactDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(isArrowBack: true),
        body: Center(
          child: CustomText(text: 'CONTACT DETAILS'),
        ),
      ),
    );
  }
}
