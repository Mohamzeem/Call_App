// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:call/Core/Utils/app_colors.dart';
import 'package:call/Core/Utils/app_padding.dart';
import 'package:flutter/material.dart';

class RegisterTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? initialValue;
  final String? hint;
  final ValueChanged<String?>? onChanged;
  final int maxLines;
  final int maxLength;
  final bool readOnly;
  final TextInputType keyboardType;
  final Function validator;

  const RegisterTextField({
    Key? key,
    required this.controller,
    this.initialValue,
    required this.hint,
    this.onChanged,
    this.maxLines = 1,
    this.maxLength = 6,
    this.readOnly = false,
    this.keyboardType = TextInputType.multiline,
    required this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) => validator(value),
      initialValue: initialValue,
      onChanged: onChanged,
      maxLength: maxLength,
      cursorColor: AppColors.kBlack,
      textInputAction: TextInputAction.done,
      maxLines: maxLines,
      readOnly: readOnly,
      keyboardType: keyboardType,
      style: Theme.of(context).textTheme.displayLarge?.copyWith(
            color: AppColors.kBlack,
            fontSize: 14,
          ),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
            horizontal: AppPadding().w10, vertical: AppPadding().h10),
        filled: true,
        fillColor: AppColors.kGrey2,
        border: InputBorder.none,
        alignLabelWithHint: true,
        hintText: hint,
        hintStyle: Theme.of(context)
            .textTheme
            .displayLarge
            ?.copyWith(color: AppColors.kGrey1, fontSize: 12),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: AppColors.kGrey2,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: AppColors.kGrey2,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: AppColors.kGrey2,
          ),
        ),
      ),
    );
  }
}
