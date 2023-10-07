import 'package:call/Core/App/app_info.dart';
import 'package:call/Core/Utils/app_colors.dart';
import 'package:call/Core/Utils/app_strings.dart';
import 'package:call/Core/Widgets/custom_circular_loading.dart';
import 'package:call/Core/Widgets/custom_error_loading.dart';
import 'package:call/Core/Widgets/custom_skelton_shimmer.dart';
import 'package:call/Core/routes/app_routes.dart';
import 'package:call/Features/Contacts/presentation/view/widgets/list_item.dart';
import 'package:call/Features/Register/data/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StreamBody extends StatefulWidget {
  const StreamBody({super.key});

  @override
  State<StreamBody> createState() => _StreamBodyState();
}

class _StreamBodyState extends State<StreamBody> {
  final Stream stream = FirebaseFirestore.instance
      .collection(AppStrings.usersCollection)
      .doc(AppStrings.profileDocument)
      .collection(AppStrings.profileDetailsCollection)
      .orderBy('isOnline', descending: true)
      .snapshots();

  UserModel? userModel;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: stream,
      builder: (context, snapshot) {
        final contacts = snapshot.data?.docs;
//~ List have no data
        if (!snapshot.hasData) {
          return Column(
            children: [
              SizedBox(height: 300.h),
              const CustomCircularLoading(height: 50, width: 50),
            ],
          );
//~ List loading
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return Expanded(
            child: ListView.separated(
              itemCount: contacts!.length,
              itemBuilder: (context, index) {
                return CustomSkeltonShimmer(
                  height: 55.h,
                );
              },
              separatorBuilder: (context, index) => const Divider(
                thickness: 0.6,
                color: AppColors.mainColor,
              ),
            ),
          );
//~ List have error
        } else if (snapshot.hasError) {
          return const CustomErrorLoading(errMsg: 'Server Error Loading !!!');
//~ List have data
        } else {
          return Expanded(
            child: ListView.builder(
              itemCount: contacts!.length,
              itemBuilder: (context, index) {
                final item = contacts[index];
                //userModel = item;
                if (item['id'] == AppStrings.userId) {
                  return SizedBox(height: 0.h);
                }
                return ListItem(
                  onTap: () => MyApp.navigation
                      .navigateTo(AppRouter.contactDetailsView, args: item),
                  photoUrl: item['photo'],
                  isOnline: item['isOnline'],
                  name: item['name'],
                  // photoUrl: userModel!.photo!,
                  // isOnline: userModel!.isOnline!,
                  // name: userModel!.name!,
                );
              },
            ),
          );
        }
      },
    );
  }
}
