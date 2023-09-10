import 'package:call/Core/Widgets/custom_text_button.dart';
import 'package:flutter/material.dart';

class LoginGoogleFacebook extends StatelessWidget {
  final String logo;
  final String title;
  final void Function() onPressed;
  const LoginGoogleFacebook({
    Key? key,
    required this.logo,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
//~logo
        Image.asset(
          'assets/images/$logo.png',
          scale: 3.5,
        ),
//~title
        CustomTextButton(
          text: 'Login with $title',
          onPressed: onPressed,
        ),
      ],
    );
  }
}
