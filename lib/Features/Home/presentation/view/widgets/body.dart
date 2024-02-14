import 'package:call/Core/Utils/app_colors.dart';
import 'package:call/Core/Utils/app_padding.dart';
import 'package:call/Core/Utils/app_strings.dart';
import 'package:call/Core/Widgets/custom_cached_image.dart';
import 'package:call/Core/Widgets/custom_circular_loading.dart';
import 'package:call/Core/Widgets/custom_text.dart';
import 'package:call/Features/Home/data/repo/home_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppPadding().w20),
      child: const Column(
        children: [
          // StreamBuilder(
          //   stream: HomeApi().getChats(),
          //   builder: (context, snapshots) {
          //     if (snapshots.hasError) {
          //       return const CustomText(text: "Error");
          //     } else if (snapshots.connectionState == ConnectionState.waiting) {
          //       return CustomCircularLoading(height: 25.h, width: 25.w);
          //     } else if (!snapshots.hasData) {
          //       return const Center(
          //         child: CustomText(
          //           text: 'No Message Available',
          //           color: AppColors.kBlack,
          //           fontSize: 20,
          //         ),
          //       );
          //     } else if (snapshots.hasData) {
          //       return Expanded(
          //         child: ListView.builder(
          //           itemCount: snapshots.data!.length,
          //           itemBuilder: (context, index) {
          //             final item = snapshots.data![index];
          //             return ListTile(
          //               leading: CustomCachedImage(
          //                 photoUrl: AppStrings.defaultAppPhoto,
          //                 child: Container(),
          //               ),
          //               title: CustomText(text: item.receiverName!),
          //             );
          //           },
          //         ),
          //       );
          //     }
          //     return const CustomText(text: 'Data');
          //   },
          // ),
        ],
      ),
    );
  }
}
