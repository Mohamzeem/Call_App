import 'package:call/Core/Widgets/custom_cached_image.dart';
import 'package:call/Core/Widgets/custom_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:call/Core/App/app_info.dart';
import 'package:call/Core/Enums/font_enum.dart';
import 'package:call/Core/Utils/app_colors.dart';
import 'package:call/Core/Utils/app_padding.dart';
import 'package:call/Core/Utils/app_strings.dart';
import 'package:call/Core/Widgets/custom_text.dart';

class ChatAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool isOnline;
  final String photoUrl;
  const ChatAppBar({
    Key? key,
    this.title = '',
    this.isOnline = true,
    this.photoUrl = AppStrings.defaultAppPhoto,
  })  : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);
  @override
  final Size preferredSize;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: InkWell(
        onTap: () => MyApp.navigation.goBack(),
        child: const SizedBox(
          child: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: AppColors.mainColor,
          ),
        ),
      ),
      title: CustomText(
        text: title,
        fontType: FontType.medium28,
        color: AppColors.mainColor,
      ),
      centerTitle: true,
      actions: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppPadding().w20),
          child: InkWell(
            onTap: () => showBottomSheet(
              context: context,
              builder: (context) {
                return SizedBox(
                  height: 300.h,
                  width: 300.w,
                  child: Stack(
                    fit: StackFit.passthrough,
                    children: [
                      SizedBox(
                        child: Center(
                          child: CustomCachedImage(
                            width: 300,
                            height: 300,
                            photoUrl: photoUrl,
                            child: const SizedBox(),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: InkWell(
                          onTap: () => MyApp.navigation.goBack(),
                          child: CustomTextButton(
                            text: 'close',
                            onPressed: () => MyApp.navigation.goBack(),
                            underline: TextDecoration.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            child: CustomCachedImage(
              photoUrl:
                  photoUrl.isEmpty ? AppStrings.defaultAppPhoto : photoUrl,
              child: Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isOnline ? AppColors.kGreen : AppColors.kGrey3,
                  ),
                  height: 15.h,
                  width: 15.w,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
