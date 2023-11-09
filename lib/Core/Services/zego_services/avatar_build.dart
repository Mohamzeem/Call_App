// Flutter imports:
import 'package:call/Core/App/app_info.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:cached_network_image/cached_network_image.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

Widget avatarBuilder(
  BuildContext context,
  Size size,
  ZegoUIKitUser? user,
  Map<String, dynamic> extraInfo,
) {
  return CachedNetworkImage(
    imageUrl: MyApp.currentUser!.photo!,
    imageBuilder: (context, imageProvider) => Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: imageProvider,
          fit: BoxFit.cover,
        ),
      ),
    ),
    progressIndicatorBuilder: (context, url, downloadProgress) =>
        CircularProgressIndicator(value: downloadProgress.progress),
    errorWidget: (context, url, error) {
      ZegoLoggerService.logInfo(
        '$user avatar url is invalid',
        tag: 'live audio',
        subTag: 'live page',
      );
      return ZegoAvatar(user: user, avatarSize: size);
    },
  );
}
