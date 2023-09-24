import 'package:call/Core/App/app_info.dart';
import 'package:call/Core/Enums/font_enum.dart';
import 'package:call/Core/Utils/app_padding.dart';
import 'package:call/Core/Widgets/custom_button.dart';
import 'package:call/Core/Widgets/custom_snack_bar.dart';
import 'package:call/Core/Widgets/custom_text.dart';
import 'package:call/Core/routes/app_routes.dart';
import 'package:call/Features/Register/presentation/view/widgets/register_text_field.dart';
import 'package:call/Features/Register/presentation/view_model/register_cubit/register_cubit.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterBody extends StatelessWidget {
  const RegisterBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(child: LoginButtons());
  }
}

class LoginButtons extends StatefulWidget {
  const LoginButtons({super.key});

  @override
  State<LoginButtons> createState() => _LoginButtonsState();
}

class _LoginButtonsState extends State<LoginButtons> {
  final nameController = TextEditingController();
  final jobController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

//~to switch show password
  bool isShowPassword = true;
  void showPassword() {
    setState(() {
      isShowPassword = !isShowPassword;
    });
  }

  @override
  void dispose() {
    nameController.dispose();
    jobController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterSuccessState) {
          CustomSnackBar().showSuccessSnackBar(
              context: context, message: 'Registerd Successfully');
          MyApp.navigation.navigateAndFinish(AppRouter.loginView);
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
//~ register text
                Padding(
                  padding: EdgeInsets.only(
                      top: AppPadding().h55, bottom: AppPadding().h15),
                  child: const CustomText(
                    text: 'Register',
                    fontType: FontType.medium20,
                  ),
                ),
//~ name field
                RegisterTextField(
                  maxLength: 50,
                  controller: nameController,
                  hint: 'Full Name',
                  keyboardType: TextInputType.name,
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Please enter a full name';
                    } else if (value.length < 3) {
                      return 'too low characters';
                    }
                  },
                ),
//~ email field
                RegisterTextField(
                  maxLength: 50,
                  controller: emailController,
                  hint: 'Email address',
                  keyboardType: TextInputType.name,
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'epmtyId';
                    } else if (value.length < 4) {
                      return 'too low characters';
                    }
                  },
                ),
//~ password field (6 letter only)
                RegisterTextField(
                  maxLength: 6,
                  controller: passwordController,
                  hint: 'Password',
                  keyboardType: TextInputType.name,
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'emptyPassword';
                    } else if (value.length < 6) {
                      return 'low password';
                    }
                  },
                ),
                const SizedBox(height: 30, width: 1),
//~ login button
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
                        if (formKey.currentState!.validate()) {
                          cubit.register(
                            email: emailController.text,
                            password: passwordController.text,
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
                  height: 40,
                )
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
