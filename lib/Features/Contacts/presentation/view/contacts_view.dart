import 'package:call/Core/App/app_dependecies.dart';
import 'package:call/Core/Utils/app_padding.dart';
import 'package:call/Core/Widgets/custom_appbar.dart';
import 'package:call/Features/Contacts/data/repo/contacts_repo_impl.dart';
import 'package:call/Features/Contacts/presentation/view/widgets/contacts_body.dart';
import 'package:call/Features/Contacts/presentation/view_model/contacts_cubit/contacts_cubit.dart';
import 'package:call/Features/Profile/presentation/view_model.dart/cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContactsView extends StatelessWidget {
  const ContactsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        //! cubit changed + add repImpl
        create: (context) => ContactsCubit(repo: sl.get<ContactsRepoImpl>()),
        child: Scaffold(
          appBar: CustomAppBar(
            title: 'Contacts',
            isArrowBack: true,
            photoUrl: BlocProvider.of<ProfileCubit>(context).userModel!.photo!,
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(
              vertical: AppPadding().h20,
              horizontal: AppPadding().h20,
            ),
            child: Column(
              children: [
                //! body changed
                const ContactsBody(),
                //   const StreamBody(),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
