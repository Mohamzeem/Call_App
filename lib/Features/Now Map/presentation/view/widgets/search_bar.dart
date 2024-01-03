import 'package:call/Core/App/app_info.dart';
import 'package:call/Features/Now%20Map/presentation/view_model.dart/cubit/chats_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:call/Core/Utils/app_colors.dart';
import 'package:call/Core/Utils/app_padding.dart';

class ChatListSearchBar extends StatefulWidget {
  const ChatListSearchBar({
    Key? key,
  }) : super(key: key);

  @override
  State<ChatListSearchBar> createState() => _ChatListSearchBarState();
}

class _ChatListSearchBarState extends State<ChatListSearchBar> {
  final controller = TextEditingController();
  bool isIconSearch = true;
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppPadding().w20),
      child: TextFormField(
        controller: controller,
        onChanged: (value) {
          _searchSelected(controller.text, context);
        },
        validator: (value) {
          if (value!.isEmpty) {
            return "Name Required";
          }
          return "";
        },
        style: const TextStyle(fontSize: 22, color: AppColors.kWhite),
        decoration: InputDecoration(
          suffixIcon: InkWell(
            onTap: () {
              _searchSelected(controller.text, context);
            },
            child: isIconSearch
                ? const Icon(
                    Icons.search,
                    size: 25,
                    color: AppColors.kWhite,
                  )
                : InkWell(
                    onTap: () => _clearAndCloseIcon(context),
                    child: const Icon(
                      Icons.close,
                      size: 25,
                      color: AppColors.kWhite,
                    ),
                  ),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: AppPadding().w20),
          fillColor: Colors.grey.shade700,
          filled: true,
          hintText: 'who do you want to chat with?',
          hintStyle: TextStyle(
            fontSize: 20.sp,
            color: Colors.grey.shade400,
          ),
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(25))),
          enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(25))),
          focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(25))),
          errorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(25))),
          focusedErrorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(25))),
        ),
      ),
    );
  }

  //^ search Function
  void _searchSelected(String? searchName, BuildContext context) {
    if (searchName != null) {
      setState(() {
        isIconSearch = false;
      });
      BlocProvider.of<ChatsCubit>(context).searchChatByname(searchName);
    }
  }

  //^ Clear and close
  void _clearAndCloseIcon(BuildContext context) {
    controller.clear();
    setState(() {
      isIconSearch = true;
    });
    BlocProvider.of<ChatsCubit>(context).searchChatByname("");
    MyApp.navigation.unfocus();
  }
}
