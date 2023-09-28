import 'package:call/Features/Contacts/presentation/view/widgets/contact_details_appbar.dart';
import 'package:flutter/material.dart';
import 'package:call/Core/Widgets/custom_text.dart';

class ContactDetailsView extends StatelessWidget {
  final dynamic item;
  const ContactDetailsView({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: ContactDetailsAppBar(
          title: item['name'],
          photoUrl: item['photo'],
          isOnline: item['isOnline'],
        ),
        body: const Center(
          child: CustomText(text: 'CONTACT DETAILS'),
        ),
      ),
    );
  }
}
