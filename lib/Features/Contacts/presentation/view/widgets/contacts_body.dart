import 'package:call/Core/App/app_info.dart';
import 'package:call/Core/Enums/font_enum.dart';
import 'package:call/Core/Utils/app_colors.dart';
import 'package:call/Core/Utils/app_strings.dart';
import 'package:call/Core/Widgets/custom_cached_image.dart';
import 'package:call/Core/Widgets/custom_circular_loading.dart';
import 'package:call/Core/Widgets/custom_skelton_shimmer.dart';
import 'package:call/Core/Widgets/custom_text.dart';
import 'package:call/Core/routes/app_routes.dart';
import 'package:call/Features/Contacts/presentation/view_model/contacts_cubit/contacts_cubit.dart';
import 'package:call/Features/Register/data/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContactsBody extends StatefulWidget {
  const ContactsBody({super.key});

  @override
  State<ContactsBody> createState() => _ContactsBodyState();
}

class _ContactsBodyState extends State<ContactsBody> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ContactsCubit>(context).getAllContacts();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContactsCubit, ContactsState>(
      builder: (context, state) {
//~ contacts list loaded successfully
        if (state is ContactsSuccessState) {
          return Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                final item = state.contactsList[index];
                return ContactsListItem(item: item);
              },
              separatorBuilder: (context, index) => const Divider(
                thickness: 0.6,
                color: AppColors.mainColor,
              ),
              itemCount: state.contactsList.length,
            ),
          );
//~ contacts list empty
        } else if (state is ContactsEmptyState) {
          return const Center(
            child: CustomText(
              text: 'No Contacts Found !!!',
              fontType: FontType.medium32,
            ),
          );
//~ contacts list loading
        } else if (state is ContactsLoadingState) {
          return Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                return const CustomSkeltonShimmer(height: 50);
              },
              separatorBuilder: (context, index) => const Divider(
                thickness: 0.6,
                color: AppColors.mainColor,
              ),
              itemCount:
                  BlocProvider.of<ContactsCubit>(context).listOfContacts.length,
            ),
          );
        }
        return const CustomCircularLoading(height: 50, width: 50);
      },
    );
  }
}

class ContactsListItem extends StatelessWidget {
  const ContactsListItem({super.key, required this.item});

  final UserModel item;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => MyApp.navigation.navigateTo(AppRouter.contactDetailsView),
      child: Row(
        children: [
          CustomCachedImage(
            width: 45,
            height: 45,
            photoUrl:
                item.photo!.isEmpty ? AppStrings.defaultAppPhoto : item.photo!,
            child: Align(
              alignment: Alignment.bottomRight,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: item.isOnline! ? AppColors.kGreen : AppColors.kGrey3,
                ),
                height: 15.h,
                width: 15.w,
              ),
            ),
          ),
          SizedBox(width: 20.w),
          CustomText(
            text: item.name!,
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
