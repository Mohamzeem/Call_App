import 'package:call/Core/Widgets/custom_appbar.dart';
import 'package:call/Features/Contatcs/presentation/view/widgets/contacts_body.dart';
import 'package:flutter/material.dart';

class ContactsView extends StatelessWidget {
  const ContactsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(isArrowBack: true),
        body: ContactsBody(),
      ),
    );
  }
}
