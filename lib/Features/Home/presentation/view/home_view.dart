import 'package:call/Core/App/app_info.dart';
import 'package:call/Core/Widgets/custom_appbar.dart';
import 'package:call/Features/Auth/presentation/view_model/auth_cubit/auth_cubit.dart';
import 'package:call/Features/Home/presentation/view/widgets/floating_icon.dart';
import 'package:call/Features/Home/presentation/view/widgets/body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<AuthCubit>(context).getProfile();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(65),
          child: BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              if (state is AuthGetProfileSuccessState) {
                return CustomAppBar(
                  title: 'Call Me',
                  photoUrl: state.userModel.photo!,
                );
              }
              return const CustomAppBar(title: 'Call Me');
            },
          ),
        ),
        floatingActionButton: const ContactsIcon(),
        body: const HomeBody(),
      ),
    );
  }
}
