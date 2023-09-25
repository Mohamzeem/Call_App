import 'package:call/Core/App/app_dependecies.dart';
import 'package:call/Core/Utils/app_padding.dart';
import 'package:call/Core/Widgets/custom_appbar.dart';
import 'package:call/Features/Contacts/data/repo/contacts_repo_impl.dart';
import 'package:call/Features/Contacts/presentation/view/widgets/contacts_body.dart';
import 'package:call/Features/Contacts/presentation/view/widgets/contacts_stream.dart';
import 'package:call/Features/Contacts/presentation/view_model/contacts_cubit/contacts_cubit.dart';
import 'package:call/Features/Contacts/presentation/view_model/stream_cubit/stream_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContactsView extends StatefulWidget {
  const ContactsView({super.key});

  @override
  State<ContactsView> createState() => _ContactsViewState();
}

class _ContactsViewState extends State<ContactsView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        //! cubit changed + add repImpl
        // create: (context) => StreamCubit(),
        create: (context) => ContactsCubit(repo: sl.get<ContactsRepoImpl>()),
        child: Scaffold(
          appBar: const CustomAppBar(isArrowBack: true),
          body: Padding(
            padding: EdgeInsets.symmetric(
              vertical: AppPadding().h20,
              horizontal: AppPadding().h20,
            ),
            child: Column(
              children: [
                //! body changed
                const ContactsBody(),
                //const StreamBody(),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
