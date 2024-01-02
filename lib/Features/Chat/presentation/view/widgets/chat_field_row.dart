import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:call/Core/Utils/app_colors.dart';
import 'package:call/Core/Utils/app_padding.dart';

class ChatFieldRow extends StatelessWidget {
  final VoidCallback onTap;
  final TextEditingController controller;
  const ChatFieldRow({
    Key? key,
    required this.onTap,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            border: Border.all(
              color: AppColors.mainColor,
              width: 0.5,
            ),
          ),
          width: 306.w,
          child: TextFormField(
            controller: controller,
            validator: (value) {
              if (value!.isEmpty) {
                return "Message Required";
              }
              return "";
            },
            style: const TextStyle(fontSize: 22, color: AppColors.kBlack),
            decoration: InputDecoration(
              suffixIcon: InkWell(
                onTap: onTap,
                child: const Icon(
                  Icons.send,
                  size: 25,
                  color: AppColors.mainColor,
                ),
              ),
              contentPadding: EdgeInsets.symmetric(
                vertical: 0.h,
                horizontal: AppPadding().w10,
              ),
              border: const OutlineInputBorder(
                  borderSide: BorderSide(width: 0.5, color: AppColors.kWhite)),
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(width: 0.5, color: AppColors.kWhite)),
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(width: 0.5, color: AppColors.kWhite)),
              errorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(width: 0.5, color: AppColors.kWhite)),
              focusedErrorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(width: 0.5, color: AppColors.kWhite)),
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
    );
  }
}
