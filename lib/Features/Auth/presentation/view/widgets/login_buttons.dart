import 'package:call/Core/App/app_info.dart';
import 'package:call/Core/routes/app_routes.dart';
import 'package:call/Features/Auth/presentation/view/widgets/login_fb_go.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:call/Core/Enums/font_enum.dart';
import 'package:call/Core/Utils/app_colors.dart';
import 'package:call/Core/Utils/app_padding.dart';
import 'package:call/Core/Widgets/custom_button.dart';
import 'package:call/Core/Widgets/custom_snack_bar.dart';
import 'package:call/Core/Widgets/custom_text.dart';
import 'package:call/Core/Widgets/custom_text_button.dart';
import 'package:call/Features/Auth/presentation/view/widgets/auth_text_form_field.dart';
import 'package:call/Features/Auth/presentation/view_model/auth_cubit/auth_cubit.dart';

class LoginButtons extends StatefulWidget {
  const LoginButtons({
    super.key,
  });

  @override
  State<LoginButtons> createState() => _LoginButtonsState();
}

class _LoginButtonsState extends State<LoginButtons> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

// to switch show password
  bool isShowPassword = true;
  void showPassword() {
    setState(() {
      isShowPassword = !isShowPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is LoginWithEmailPasswordSuccessState ||
            state is LoginWithGoogleSuccessState) {
          CustomSnackBar().showSuccessSnackBar(
              context: context, message: 'loggedSuccessfully');
          MyApp.navigation.navigateAndFinish(AppRouter.registerView);
        } else if (state is LoginWithEmailPasswordFailureState) {
          CustomSnackBar()
              .showErrorSnackBar(context: context, message: state.errMessage);
        } else if (state is LoginWithGoogleFailureState) {
          CustomSnackBar()
              .showErrorSnackBar(context: context, message: state.errMessage);
        }
      },
      builder: (context, state) {
        var cubit = BlocProvider.of<AuthCubit>(context);
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: AppPadding().w25),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
//login text
                Padding(
                  padding: EdgeInsets.only(
                      top: AppPadding().h55, bottom: AppPadding().h15),
                  child: const CustomText(
                    text: 'Log In',
                    fontType: FontType.medium32,
                    isTitle: true,
                  ),
                ),
//Email Field
                AuthTextFormField(
                  prefixIcon: Icons.email,
                  controller: emailController,
                  label: 'Email',
                  hint: 'Type Email',
                  keyBoard: TextInputType.emailAddress,
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'empty email';
                    } else if (!value.contains('@') &&
                        !value.contains('.com')) {
                      return 'not valid email';
                    }
                  },
                  suffixIconShow: false,
                ),
                const SizedBox(height: 10),
//Password Field
                AuthTextFormField(
                  prefixIcon: Icons.email,
                  controller: passwordController,
                  label: 'Password',
                  hint: 'Type Password',
                  keyBoard: TextInputType.text,
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'empty password';
                    } else if (value.length < 6) {
                      return 'weak password';
                    }
                  },
                  obscureText: isShowPassword,
                  suffixIconShow: true,
                  suffixIconFunction: () => showPassword(),
                ),
                const SizedBox(height: 10),
//login button
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: AppPadding().h35, bottom: AppPadding().h20),
                    child: CustomButton(
                      width: 210,
                      height: 45,
                      text: 'login',
                      isLoading: state is LoginWithEmailPasswordLoadingState,
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          cubit.login(
                              email: emailController.text,
                              password: passwordController.text);
                        }
                      },
                    ),
                  ),
                ),
                const Row(
                  children: [
                    Expanded(child: Divider()),
                    CustomText(
                        text: '  Or  ',
                        isTitle: false,
                        fontType: FontType.medium32),
                    Expanded(child: Divider())
                  ],
                ),
//facebook login
                LoginGoogleFacebook(
                    title: 'Google',
                    logo: 'google',
                    onPressed: () {
                      cubit.loginWithGoogle();
                    }),
//google login
                LoginGoogleFacebook(
                    title: 'Facebook', logo: 'facebook', onPressed: () {}),
                SizedBox(height: 60.h),
//go to sign in page
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CustomText(
                        text: 'You Dont Have Account?',
                        isTitle: false,
                        fontType: FontType.medium28,
                        color: AppColors.kGrey),
                    CustomTextButton(text: 'Sign Up!', onPressed: () {}),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
