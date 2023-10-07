import 'package:call/Core/Utils/app_colors.dart';
import 'package:call/Core/Utils/app_padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatFieldRow extends StatelessWidget {
  const ChatFieldRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          border: Border.all(
            color: AppColors.mainColor,
            width: 0.5,
          )),
      child: Row(
        children: [
          SizedBox(
            width: 295.w,
            child: TextFormField(
              style: const TextStyle(fontSize: 22, color: AppColors.kBlack),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                  vertical: 0.h,
                  horizontal: AppPadding().w10,
                ),
                border: const OutlineInputBorder(
                  borderSide: BorderSide(width: 0.5, color: AppColors.kWhite),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(width: 0.5, color: AppColors.kWhite),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(width: 0.5, color: AppColors.kWhite),
                ),
                errorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(width: 0.5, color: AppColors.kWhite),
                ),
                focusedErrorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(width: 0.5, color: AppColors.kWhite),
                ),
              ),
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.attach_file_rounded,
                color: AppColors.mainColor,
                size: 30.r,
              ),
              SizedBox(width: 5.w),
              Icon(
                Icons.camera_alt,
                color: AppColors.mainColor,
                size: 30.r,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
