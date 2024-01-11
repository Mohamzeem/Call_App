import 'package:call/Core/Enums/font_enum.dart';
import 'package:call/Core/Extensions/convert_to_string.dart';
import 'package:call/Core/Utils/app_colors.dart';
import 'package:call/Core/Utils/app_strings.dart';
import 'package:call/Core/Widgets/custom_circular_loading.dart';
import 'package:call/Core/Widgets/custom_skelton_shimmer.dart';
import 'package:call/Core/Widgets/custom_text.dart';
import 'package:call/Features/Now%20Map/presentation/view/widgets/chats_item.dart';
import 'package:call/Features/Now%20Map/presentation/view_model.dart/cubit/chats_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatsList extends StatefulWidget {
  const ChatsList({super.key});

  @override
  State<ChatsList> createState() => _ChatsListState();
}

class _ChatsListState extends State<ChatsList> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ChatsCubit>(context).getChats();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatsCubit, ChatsState>(
      builder: (context, state) {
//^ chats list loaded successfully
        if (state is GetChatsSuccessfullState) {
          return Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                final item = state.allChats[index];
                return ChatsItem(
                  msg: item.msg!,
                  photoUrl: item.photo!.isEmpty
                      ? AppStrings.defaultAppPhoto
                      : item.photo!,
                  name: item.name!,
                  createdAt: DateTime.parse(item.createdAt!)
                      .timeAgo(numericDates: true),
                  onTap: () {},
                );
              },
              itemCount: state.allChats.length,
            ),
          );
//^ searched chats list empty
        } else if (state is SearchChatEmptyState) {
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: 30),
            child: Center(
              child: CustomText(
                text: 'No Chat with this contact!',
                fontType: FontType.medium28,
                color: AppColors.kWhite,
              ),
            ),
          );
        } else if (state is SearchChatSuccessfullState) {
//^ searched chats list success
          return Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                final item = state.searchedList[index];
                return ChatsItem(
                  msg: item.msg!,
                  photoUrl: item.photo!.isEmpty
                      ? AppStrings.defaultAppPhoto
                      : item.photo!,
                  name: item.name!,
                  createdAt: DateTime.parse(item.createdAt!)
                      .timeAgo(numericDates: true),
                  onTap: () {},
                );
              },
              itemCount: state.searchedList.length,
            ),
          );
        } else if (state is GetChatsEmptyState) {
          return const Center(
            child: CustomText(
              text: 'No Chats Found !!!',
              fontType: FontType.medium32,
            ),
          );
//^ chats list loading
        } else if (state is GetChatsLoadingState) {
          return Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return const CustomSkeltonShimmer(height: 50);
              },
              itemCount:
                  BlocProvider.of<ChatsCubit>(context).listOfChats.length,
            ),
          );
        }
        return const CustomCircularLoading(height: 50, width: 50);
      },
    );
  }
}
