import 'package:call/Core/Enums/font_enum.dart';
import 'package:call/Core/Utils/app_strings.dart';
import 'package:call/Core/Widgets/custom_circular_loading.dart';
import 'package:call/Core/Widgets/custom_skelton_shimmer.dart';
import 'package:call/Core/Widgets/custom_text.dart';
import 'package:call/Core/routes/routes.dart';
import 'package:call/Features/Contacts/presentation/view/widgets/list_item.dart';
import 'package:call/Features/Contacts/presentation/view_model/contacts_cubit/contacts_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

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
            child: ListView.builder(
              itemBuilder: (context, index) {
                final item = state.contactsList[index];
                if (item.id == AppStrings.userId) {
                  return SizedBox(height: 0.h);
                }
                return ListItem(
                  photoUrl: item.photo!.isEmpty
                      ? AppStrings.defaultAppPhoto
                      : item.photo!,
                  name: item.name!,
                  isOnline: item.isOnline!,
                  onTap: () => GoRouter.of(context)
                      .pushNamed(AppRoutes.chatView, extra: item), //!
                );
              },
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
            child: ListView.builder(
              itemBuilder: (context, index) {
                return const CustomSkeltonShimmer(height: 50);
              },
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
