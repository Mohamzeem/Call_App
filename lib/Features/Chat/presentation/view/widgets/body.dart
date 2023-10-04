import 'package:call/Core/Utils/app_padding.dart';
import 'package:call/Features/Chat/presentation/view/widgets/field_row.dart';
import 'package:flutter/material.dart';

class ChatBody extends StatefulWidget {
  const ChatBody({super.key});

  @override
  State<ChatBody> createState() => _ChatBodyState();
}

class _ChatBodyState extends State<ChatBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: AppPadding().w20, vertical: AppPadding().h10),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text('Message'),
          ChatFieldRow(),
        ],
      ),
    );
  }
}
