import 'package:call/Core/Services/prints/prints_service.dart';
import 'package:call/Core/Services/zego_services/login_service.dart';
import 'package:call/Core/Utils/app_strings.dart';
import 'package:call/Core/Widgets/custom_circular_loading.dart';
import 'package:call/Core/Widgets/custom_text.dart';
import 'package:call/Features/Auth/presentation/view_model/auth_cubit/auth_cubit.dart';
import 'package:call/Features/Chat/presentation/view/widgets/contact_msg.dart';
import 'package:call/Features/Chat/presentation/view/widgets/user_msg.dart';
import 'package:flutter/material.dart';
import 'package:call/Core/Utils/app_padding.dart';
import 'package:call/Features/Chat/data/repo/chat_api.dart';
import 'package:call/Features/Chat/presentation/view/widgets/chat_field_row.dart';
import 'package:call/Features/Contacts/data/models/contact_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

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
  var scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    ZegoServices().initZego(
      userID: AppStrings.userId!,
      userName: AppStrings.userName!,
    ); //~ start zego service
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _scrollToBottom() {
    final bottomOffset = scrollController.position.minScrollExtent;
    if (scrollController.hasClients) {
      scrollController.animateTo(
        bottomOffset,
        duration: const Duration(microseconds: 500),
        curve: Curves.fastOutSlowIn,
      );
    }
  }

  void _sendMsg(String userId, String userName) async {
    if (controller.text.isNotEmpty) {
      ChatApi().sendMessage(
          userId: userId,
          userName: userName,
          receiverId: widget.model.id!,
          receiverName: widget.model.name!,
          msg: controller.text);
    }
    controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    //final userModel = BlocProvider.of<AuthCubit>(context).userModel;
    return Padding(
      padding: EdgeInsets.only(
        right: AppPadding().w20,
        left: AppPadding().w20,
        bottom: AppPadding().h30,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
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
                      controller: scrollController,
                      reverse: true,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        var item = snapshots.data![index];
                        DateTime inputTime =
                            DateFormat('dd/MM/yyyy, HH:mm:ss aaa')
                                .parse(item.createdAt!);

                        String formattedTime =
                            DateFormat('h:mm a').format(inputTime);
                        if (item.senderId! == AppStrings.userId) {
                          return UserMsg(
                            msg: item.message!,
                            createdAt: formattedTime,
                            photoUrl: AppStrings.userPhoto!,
                          );
                        } else {
                          return ContactMsg(
                            photoUrl: widget.model.photo!,
                            msg: item.message!,
                            createdAt: formattedTime,
                          );
                        }
                      }),
                );
              }
              return const CustomText(text: 'Data');
            },
          ),
          SizedBox(height: 15.h),
          ChatFieldRow(
            controller: controller,
            onTap: () {
              _sendMsg(AppStrings.userId!, AppStrings.userName!);
              _scrollToBottom();
            },
          ),
        ],
      ),
    );
  }
}
