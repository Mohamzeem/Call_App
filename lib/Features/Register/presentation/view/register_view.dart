// ignore_for_file: file_names
import 'package:call/Core/App/app_dependecies.dart';
import 'package:call/Core/App/app_info.dart';
import 'package:call/Core/Enums/font_enum.dart';
import 'package:call/Core/Utils/app_colors.dart';
import 'package:call/Core/Utils/app_padding.dart';
import 'package:call/Core/Widgets/custom_button.dart';
import 'package:call/Core/Widgets/custom_snack_bar.dart';
import 'package:call/Core/Widgets/custom_text.dart';
import 'package:call/Core/routes/app_routes.dart';
import 'package:call/Features/Register/data/repo/register_repo_impl.dart';
import 'package:call/Features/Register/presentation/view/register_text_field.dart';
import 'package:call/Features/Register/presentation/view_model/register_cubit/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(repo: sl.get<RegisterRepoImpl>()),
      child: const Scaffold(
        backgroundColor: AppColors.kWhite,
        body: AuthBody(),
      ),
    );
  }
}

class AuthBody extends StatelessWidget {
  const AuthBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(child: LoginButtons());
  }
}

class LoginButtons extends StatefulWidget {
  const LoginButtons({
    super.key,
  });

  @override
  State<LoginButtons> createState() => _LoginButtonsState();
}

class _LoginButtonsState extends State<LoginButtons> {
  bool isShowPassword = true;
  final nameController = TextEditingController();
  final jobController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  /// to switch show password
  void showPassword() {
    setState(() {
      isShowPassword = !isShowPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterSuccessState) {
          CustomSnackBar().showSuccessSnackBar(
              context: context, message: 'تمت الاضافة بنجاح');
          // MyApp.navigation.navigateAndFinish(AppRouter.controlView);
        } else if (state is RegisterFailureState) {
          CustomSnackBar()
              .showErrorSnackBar(context: context, message: state.errMessage);
        }
      },
      builder: (context, state) {
        var cubit = BlocProvider.of<RegisterCubit>(context);
        return Padding(
          padding: EdgeInsets.symmetric(
              horizontal: AppPadding().w30, vertical: AppPadding().h40),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //register text//
                Padding(
                  padding: EdgeInsets.only(
                      top: AppPadding().h55, bottom: AppPadding().h15),
                  child: const CustomText(
                    text: 'Register',
                    fontType: FontType.medium20,
                  ),
                ),

                //user name//
                RegisterTextField(
                  maxLength: 50,
                  controller: nameController,
                  hint: 'الأسم',
                  keyboardType: TextInputType.name,
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'يرجي ادخال الاسم بالكامل';
                    } else if (value.length < 3) {
                      return 'idNumbeR6';
                    }
                  },
                ),

                //user email
                RegisterTextField(
                  maxLength: 50,
                  controller: emailController,
                  hint: 'الرقم التعريفي 123456',
                  keyboardType: TextInputType.name,
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'epmtyId';
                    } else if (value.length < 6) {
                      return 'idNumbeR6';
                    }
                  },
                ),
                //password text form field (6 letter only)//
                RegisterTextField(
                  maxLength: 6,
                  controller: passwordController,
                  hint: 'password',
                  keyboardType: TextInputType.name,
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'epmtyPassword';
                    } else if (value.length < 6) {
                      return 'password6';
                    }
                  },
                ),

                const SizedBox(height: 30, width: 1),

                //login elevated button//
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: AppPadding().h35, bottom: AppPadding().h20),
                    child: CustomButton(
                      width: 200,
                      height: 55,
                      text: 'أضافة',
                      isLoading: state is RegisterloadingState,
                      onPressed: () async {
                        //register & set data to firebase
                        if (formKey.currentState!.validate()) {
                          cubit.register(
                            email: emailController.text.trim(),
                            password: passwordController.text.trim(),
                            name: nameController.text.trim(),
                          );
                        }
                        nameController.clear();
                        emailController.clear();
                        passwordController.clear();
                      },
                    ),
                  ),
                ),
                CustomButton(
                    onPressed: () =>
                        MyApp.navigation.navigateTo(AppRouter.loginView),
                    text: 'Back',
                    width: 100,
                    height: 40)
                // Center(
                //   child: ForgotPasswordTextButton(
                //     text: 'تسجيل الدخول',
                //     onPressed: () =>
                //         MyApp.navigation.navigateTo(AppRouter.loginView),
                //   ),
                // ),
              ],
            ),
          ),
        );
      },
    );
  }
}
