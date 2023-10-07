import 'package:call/Core/Widgets/custom_appbar.dart';
import 'package:call/Features/Home/presentation/view/widgets/floating_icon.dart';
import 'package:call/Features/Home/presentation/view/widgets/body.dart';
import 'package:call/Features/Profile/presentation/view_model.dart/cubit/profile_cubit.dart';
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
    BlocProvider.of<ProfileCubit>(context).getProfile();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(65),
          child: BlocBuilder<ProfileCubit, ProfileState>(
            builder: (context, state) {
              if (state is ProfileGetSuccessState) {
                return CustomAppBar(
                  title: 'Call Me',
                  photoUrl:
                      BlocProvider.of<ProfileCubit>(context).userModel!.photo!,
                );
              }
              return const CustomAppBar();
            },
          ),
        ),
        floatingActionButton: const ContactsIcon(),
        body: const HomeBody(),
      ),
    );
  }
}
