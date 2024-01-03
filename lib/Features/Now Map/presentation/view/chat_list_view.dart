import 'package:call/Core/App/app_dependecies.dart';
import 'package:call/Core/Utils/app_colors.dart';
import 'package:call/Features/Contacts/data/repo/contacts_repo_impl.dart';
import 'package:call/Features/Contacts/presentation/view_model/contacts_cubit/contacts_cubit.dart';
import 'package:call/Features/Now%20Map/data/repo/chats_repo_impl.dart';
import 'package:call/Features/Now%20Map/presentation/view/widgets/body.dart';
import 'package:call/Features/Now%20Map/presentation/view_model.dart/cubit/chats_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatListView extends StatelessWidget {
  const ChatListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ContactsCubit(repo: sl.get<ContactsRepoImpl>()),
        ),
        BlocProvider(
          create: (context) => ChatsCubit(repoImpl: sl.get<ChatsRepoImpl>()),
        ),
      ],
      child: Scaffold(
        backgroundColor: AppColors.kBlack.withOpacity(0.9),
        body: const ChatListBody(),
      ),
    );
  }
}
