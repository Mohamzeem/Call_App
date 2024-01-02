import 'package:flutter/material.dart';
import 'package:call/Core/Utils/app_padding.dart';
import 'package:call/Features/Chat/data/repo/chat_api.dart';
import 'package:call/Features/Chat/presentation/view/widgets/chat_field_row.dart';
import 'package:call/Features/Contacts/data/models/contact_model.dart';

class ChatBody extends StatefulWidget {
  final ContactModel model;
  const ChatBody({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  State<ChatBody> createState() => _ChatBodyState();
}

class _ChatBodyState extends State<ChatBody> {
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: AppPadding().w20, vertical: AppPadding().h10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ChatFieldRow(
            controller: controller,
            onTap: () {
              ChatApi().sendChatMessage(
                receiverId: widget.model.id!,
                receiverName: widget.model.name!,
                msg: controller.text,
              );
            },
          ),
        ],
      ),
    );
  }
}
