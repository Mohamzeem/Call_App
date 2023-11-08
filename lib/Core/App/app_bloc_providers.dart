import 'package:call/Core/App/app_dependecies.dart';
import 'package:call/Features/Auth/data/repo/auth_repo_impl.dart';
import 'package:call/Features/Auth/presentation/view_model/auth_cubit/auth_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocProviders {
  static get allBlocProvider => [
        BlocProvider(
            create: (context) => AuthCubit(repo: sl.get<AuthRepoImpl>())),
      ];
}
