import 'package:call/Core/Enums/font_enum.dart';
import 'package:call/Core/Utils/app_padding.dart';
import 'package:call/Core/Widgets/custom_text.dart';
import 'package:flutter/material.dart';

class ContactsBody extends StatelessWidget {
  const ContactsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppPadding().w20),
      child: const Column(
        children: [
          Center(
            child: CustomText(
              text: 'CONTACTS',
              fontType: FontType.medium24,
            ),
          ),
        ],
      ),
    );
  }
}
