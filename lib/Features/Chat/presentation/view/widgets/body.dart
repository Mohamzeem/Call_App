import 'package:call/Core/Utils/app_strings.dart';
import 'package:call/Core/Widgets/custom_circular_loading.dart';
import 'package:call/Core/Widgets/custom_text.dart';
import 'package:call/Features/Chat/presentation/view/widgets/contact_msg.dart';
import 'package:call/Features/Chat/presentation/view/widgets/user_msg.dart';
import 'package:flutter/material.dart';
import 'package:call/Core/Utils/app_padding.dart';
import 'package:call/Features/Chat/data/repo/chat_api.dart';
import 'package:call/Features/Chat/presentation/view/widgets/chat_field_row.dart';
import 'package:call/Features/Contacts/data/models/contact_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void sendMsg() async {
    if (controller.text.isNotEmpty) {
      ChatApi().sendMessage(
          receiverId: widget.model.id!,
          receiverName: widget.model.name!,
          msg: controller.text);
    }
    controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: AppPadding().w20, vertical: AppPadding().h20),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.end,
        children: [
          StreamBuilder(
            stream: ChatApi().getMessages(
                userId: AppStrings.userId!, receiverId: widget.model.id!),
            builder: (context, snapshots) {
              if (snapshots.hasError) {
                return const CustomText(text: "Error");
              } else if (snapshots.connectionState == ConnectionState.waiting) {
                return CustomCircularLoading(height: 25.h, width: 25.w);
              } else if (!snapshots.hasData) {
                return const CustomText(text: 'No Message Available');
              } else if (snapshots.hasData) {
                return Expanded(
                  child: ListView.builder(
                      itemCount: snapshots.data!.length,
                      itemBuilder: (context, index) {
                        var item = snapshots.data![index];
                        if (item.senderId! == AppStrings.userId) {
                          return UserMsg(
                              msg: item.message!,
                              createdAt: item.createdAt!,
                              photoUrl: AppStrings.defaultAppPhoto);
                        } else {
                          return ContactMsg(
                            msg: item.message!,
                            createdAt: item.createdAt!,
                          );
                        }
                      }),
                );
              }
              return const CustomText(text: 'Data');
            },
          ),
          ChatFieldRow(
            controller: controller,
            onTap: () {
              sendMsg();
            },
          ),
        ],
      ),
    );
  }
}
