import 'package:call/Core/Enums/font_enum.dart';
import 'package:call/Core/Widgets/custom_text.dart';
import 'package:call/Features/Now%20Map/presentation/view/widgets/appbar.dart';
import 'package:call/Features/Now%20Map/presentation/view/widgets/chats_list.dart';
import 'package:call/Features/Now%20Map/presentation/view/widgets/pinned_list.dart';
import 'package:call/Features/Now%20Map/presentation/view/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:call/Core/Utils/app_padding.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatListBody extends StatelessWidget {
  const ChatListBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppPadding().h10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 45.h),
          //^ appbar
          const ChatListBar(title: 'Messages'),
          SizedBox(height: 20.h),
          //^ search bar
          const ChatListSearchBar(),
          Divider(
            thickness: 0.5,
            height: 40.h,
            color: Colors.grey.shade500,
          ),
          //^ pinned text
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppPadding().w20),
            child: CustomText(
              text: 'PINNED',
              color: Colors.grey.shade500,
              fontType: FontType.medium22,
            ),
          ),
          SizedBox(height: 20.h),
          //^ pinned list
          const ChatListPinnedContacts(),
          Divider(
            thickness: 0.5,
            height: 40.h,
            color: Colors.grey.shade500,
          ),
          const ChatsList()
        ],
      ),
    );
  }
}
