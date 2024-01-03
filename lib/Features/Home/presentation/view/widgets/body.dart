import 'package:call/Core/App/app_info.dart';
import 'package:call/Core/Enums/font_enum.dart';
import 'package:call/Core/Utils/app_padding.dart';
import 'package:call/Core/Utils/app_strings.dart';
import 'package:call/Core/Widgets/custom_text.dart';
import 'package:call/Core/routes/app_routes.dart';
import 'package:call/Features/Chat/data/repo/chat_api.dart';
import 'package:call/Features/Home/presentation/view/widgets/list_item.dart';
import 'package:flutter/material.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppPadding().w20),
      child: Column(
        children: [
          const Center(
            child: InkWell(
              //  onTap: () => ChatApi().getAllChats(),
              child: CustomText(
                text: 'Home Page',
                fontType: FontType.medium24,
              ),
            ),
          ),
          //!
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Center(
              child: InkWell(
                onTap: () =>
                    MyApp.navigation.navigateTo(AppRouter.chatListView),
                child: const CustomText(
                  text: 'List Of Chats',
                  fontType: FontType.medium28,
                  textDecoration: TextDecoration.underline,
                ),
              ),
            ),
          ), //!
          Expanded(
              child: ListView.builder(
            itemCount: ChatApi().chatsName.length,
            itemBuilder: (context, index) {
              final item = ChatApi().chatsName[index];
              // ListItem(
              //   photoUrl: AppStrings.defaultAppPhoto,
              //   name: item['receiverName'],
              //   onTap: () {},
              // );

              return CustomText(
                text: item,
                fontType: FontType.medium24,
              );
            },
          )),
        ],
      ),
    );
  }
}
