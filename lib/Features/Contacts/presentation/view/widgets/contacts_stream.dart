import 'package:call/Core/App/app_info.dart';
import 'package:call/Core/Enums/font_enum.dart';
import 'package:call/Core/Utils/app_colors.dart';
import 'package:call/Core/Utils/app_strings.dart';
import 'package:call/Core/Widgets/custom_cached_image.dart';
import 'package:call/Core/Widgets/custom_text.dart';
import 'package:call/Core/routes/app_routes.dart';
import 'package:call/Features/Contacts/presentation/view_model/stream_cubit/stream_cubit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StreamBody extends StatefulWidget {
  const StreamBody({super.key});

  @override
  State<StreamBody> createState() => _StreamBodyState();
}

class _StreamBodyState extends State<StreamBody> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<StreamCubit>(context).getStream();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection(AppStrings.usersCollection)
          .doc(AppStrings.profileDocument)
          .collection(AppStrings.profileDetailsCollection)
          .orderBy('isOnline', descending: true)
          .snapshots(),
      builder: (context, snapshot) {
        final contacts = snapshot.data!.docs;
        if (!snapshot.hasData) {
          return const Center(
            child: CustomText(
              text: 'No Contacts Found !!!',
              fontType: FontType.medium32,
            ),
          );
        } else {
          return Expanded(
            child: ListView.separated(
              itemCount: contacts.length,
              itemBuilder: (context, index) {
                final item = snapshot.data!.docs[index];
                return ListItem(
                  photoUrl: item['photo'],
                  isOnline: item['isOnline'],
                  name: item['name'],
                );
              },
              separatorBuilder: (context, index) => const Divider(
                thickness: 0.6,
                color: AppColors.mainColor,
              ),
            ),
          );
        }
      },
    );
  }
}

class ListItem extends StatelessWidget {
  final String photoUrl;
  final String name;
  final bool isOnline;
  const ListItem({
    super.key,
    required this.photoUrl,
    required this.isOnline,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => MyApp.navigation.navigateTo(AppRouter.contactDetailsView),
      child: Row(
        children: [
          CustomCachedImage(
            width: 45,
            height: 45,
            photoUrl: photoUrl.isEmpty ? AppStrings.defaultAppPhoto : photoUrl,
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
          SizedBox(width: 20.w),
          CustomText(
            text: name,
            fontType: FontType.medium22,
          ),
          const Spacer(),
          const Icon(
            Icons.arrow_forward_ios,
            color: AppColors.mainColor,
            size: 20,
          ),
        ],
      ),
    );
  }
}
