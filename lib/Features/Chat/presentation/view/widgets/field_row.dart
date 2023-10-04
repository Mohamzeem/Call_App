import 'package:call/Core/Utils/app_colors.dart';
import 'package:call/Core/Utils/app_padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatFieldRow extends StatelessWidget {
  const ChatFieldRow({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 320.w,
            height: 50.h,
            child: TextFormField(
              style: const TextStyle(
                fontSize: 22,
                color: AppColors.kBlack,
              ),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                  vertical: 0,
                  horizontal: AppPadding().w10,
                ),
                suffixIcon: Icon(
                  Icons.send,
                  color: AppColors.mainColor,
                  size: 30.r,
                ),
                border: const OutlineInputBorder(
                  borderSide:
                      BorderSide(width: 0.5, color: AppColors.mainColor),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide:
                      BorderSide(width: 0.5, color: AppColors.mainColor),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide:
                      BorderSide(width: 0.5, color: AppColors.mainColor),
                ),
                errorBorder: const OutlineInputBorder(
                  borderSide:
                      BorderSide(width: 0.5, color: AppColors.mainColor),
                ),
                focusedErrorBorder: const OutlineInputBorder(
                  borderSide:
                      BorderSide(width: 0.5, color: AppColors.mainColor),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: const Icon(
              Icons.add_circle_outline,
              color: AppColors.mainColor,
              size: 40,
            ),
          )
        ],
      ),
    );
  }
}
