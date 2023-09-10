import 'package:call/Core/Utils/app_colors.dart';
import 'package:call/Core/Utils/app_padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfilePhoto extends StatelessWidget {
  const ProfilePhoto({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppPadding().h20),
      child: Center(
        child: InkWell(
          onTap: () {},
          child: Container(
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: NetworkImage(
                    'https://firebasestorage.googleapis.com/v0/b/call-me-98459.appspot.com/o/icons8-account-40.png?alt=media&token=07e51d3d-b60c-4f84-ad0a-f35a747545f3'),
                fit: BoxFit.cover,
              ),
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.mainColor),
            ),
            height: 100.h,
            width: 100.w,
            child: const Align(
              alignment: Alignment.topRight,
              child: Icon(Icons.camera_alt_outlined),
            ),
          ),
        ),
      ),
    );
  }
}
