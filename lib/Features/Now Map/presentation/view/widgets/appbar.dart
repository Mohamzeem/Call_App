import 'package:call/Core/Widgets/custom_cached_image.dart';
import 'package:call/Features/Now%20Map/data/repo/chats_api.dart';
import 'package:flutter/material.dart';
import 'package:call/Core/App/app_info.dart';
import 'package:call/Core/Enums/font_enum.dart';
import 'package:call/Core/Utils/app_colors.dart';
import 'package:call/Core/Utils/app_padding.dart';
import 'package:call/Core/Utils/app_strings.dart';
import 'package:call/Core/Widgets/custom_text.dart';

class ChatListBar extends StatelessWidget {
  final String title;
  final String photoUrl;
  final bool withPhoto;
  const ChatListBar({
    Key? key,
    this.title = '',
    this.withPhoto = false,
    this.photoUrl = AppStrings.defaultAppPhoto,
  }) : super(key: key);
  @override
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppPadding().w20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //^ arrow back
              InkWell(
                onTap: () => MyApp.navigation.goBack(),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 1,
                      color: AppColors.kGrey3,
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Icon(
                      Icons.arrow_back,
                      color: AppColors.kWhite,
                    ),
                  ),
                ),
              ),
              //^ title
              withPhoto
                  ? CustomCachedImage(
                      width: 40,
                      height: 40,
                      photoUrl: photoUrl,
                      child: const SizedBox.shrink(),
                    )
                  : CustomText(
                      text: title,
                      fontType: FontType.medium28,
                      color: AppColors.kWhite,
                    ),
              //^ arrow back
              InkWell(
                onTap: () {
                  ChatsApi().addChats();
                },
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 1,
                      color: AppColors.kGrey3,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      withPhoto ? Icons.safety_check : Icons.settings,
                      size: 20,
                      color: AppColors.kWhite,
                    ),
                  ),
                ),
              ),
            ],
          ),
          withPhoto
              ? Padding(
                  padding: const EdgeInsets.only(top: 3),
                  child: CustomText(
                    text: title,
                    fontType: FontType.medium22,
                    color: AppColors.kWhite,
                  ),
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
