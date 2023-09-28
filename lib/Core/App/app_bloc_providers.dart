import 'package:call/Core/App/app_dependecies.dart';
import 'package:call/Features/Profile/data/profile_repo_impl.dart';
import 'package:call/Features/Profile/presentation/view_model.dart/cubit/profile_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocProviders {
  static get allBlocProvider => [
        BlocProvider(
            create: (context) => ProfileCubit(repo: sl.get<ProfileRepoImpl>())),
      ];
}
