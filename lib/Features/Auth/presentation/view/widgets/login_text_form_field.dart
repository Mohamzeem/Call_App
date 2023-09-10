import 'package:call/Core/Enums/font_enum.dart';
import 'package:call/Core/Utils/app_colors.dart';
import 'package:call/Core/Utils/app_padding.dart';
import 'package:call/Core/Widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AuthTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final ValueChanged<String?>? onChanged;
  final ValueChanged<String?>? onFieldSubmitted;
  final String? initialValue;
  final String label;
  final String hint;
  final IconData prefixIcon;
  final bool readOnly;
  final Function()? suffixIconFunction;
  final bool suffixIconShow;
  final bool obscureText;
  final TextInputType keyBoard;
  final Function validator;
  final int maxLength;
  const AuthTextFormField({
    super.key,
    this.controller,
    this.initialValue,
    required this.label,
    required this.hint,
    required this.keyBoard,
    required this.validator,
    this.readOnly = false,
    this.suffixIconShow = false,
    this.maxLength = 6,
    this.obscureText = false,
    this.suffixIconFunction,
    this.onChanged,
    this.onFieldSubmitted,
    required this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      initialValue: initialValue,
      readOnly: readOnly,
      // autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: keyBoard,
      onChanged: onChanged,
      inputFormatters: [LengthLimitingTextInputFormatter(maxLength)],
      cursorColor: AppColors.mainColor,
      onFieldSubmitted: onFieldSubmitted,
      validator: (value) => validator(value),
      textInputAction: TextInputAction.done,
      obscureText: obscureText,
      maxLines: 1,
      style: const TextStyle(
        fontSize: 22,
        color: AppColors.kBlack,
      ),
      decoration: InputDecoration(
        prefixIcon: Icon(prefixIcon),
        suffixIcon: suffixIconShow
            ? InkWell(
                onTap: suffixIconFunction,
                child: obscureText
                    ? const Icon(Icons.visibility_off)
                    : const Icon(Icons.visibility))
            : const SizedBox(),
        contentPadding: EdgeInsets.symmetric(horizontal: AppPadding().w10),
        fillColor: AppColors.mainColor,
        filled: true,
        hintText: hint,
        hintStyle: const TextStyle(
          fontSize: 20,
          color: AppColors.kGrey1,
        ),
        label: CustomText(
          text: label,
          color: AppColors.kGrey1,
          fontType: FontType.medium20,
        ),
        border: const OutlineInputBorder(
            borderSide: BorderSide(width: 0.5, color: AppColors.mainColor)),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 0.5, color: AppColors.mainColor)),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 0.5, color: AppColors.mainColor)),
        errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 0.5, color: AppColors.mainColor)),
        focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 0.5, color: AppColors.mainColor)),
      ),
    );
  }
}
