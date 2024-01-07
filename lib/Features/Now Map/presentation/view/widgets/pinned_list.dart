import 'package:call/Core/Enums/font_enum.dart';
import 'package:call/Core/Utils/app_strings.dart';
import 'package:call/Core/Widgets/custom_circular_loading.dart';
import 'package:call/Core/Widgets/custom_skelton_shimmer.dart';
import 'package:call/Core/Widgets/custom_text.dart';
import 'package:call/Features/Contacts/presentation/view_model/contacts_cubit/contacts_cubit.dart';
import 'package:call/Features/Now%20Map/presentation/view/widgets/pinned_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatListPinnedContacts extends StatefulWidget {
  const ChatListPinnedContacts({super.key});

  @override
  State<ChatListPinnedContacts> createState() => _ChatListPinnedContactsState();
}

class _ChatListPinnedContactsState extends State<ChatListPinnedContacts> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ContactsCubit>(context).getAllContacts();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContactsCubit, ContactsState>(
      builder: (context, state) {
//~ contacts list loaded successfully
        if (state is ContactsSuccessState) {
          return SizedBox(
            height: 90.h,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final item = state.contactsList[index];
                  if (item.id == AppStrings.userId) {
                    return SizedBox(height: 0.h);
                  }
                  return PinnedListItem(
                    photoUrl: item.photo!.isEmpty
                        ? AppStrings.defaultAppPhoto
                        : item.photo!,
                    name: item.name!,
                  );
                },
                itemCount: state.contactsList.length,
              ),
            ),
          );
//~ contacts list empty
        } else if (state is ContactsEmptyState) {
          return const Center(
            child: CustomText(
              text: 'No Contacts Found !!!',
              fontType: FontType.medium32,
            ),
          );
//~ contacts list loading
        } else if (state is ContactsLoadingState) {
          return Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return const CustomSkeltonShimmer(height: 50);
              },
              itemCount:
                  BlocProvider.of<ContactsCubit>(context).listOfContacts.length,
            ),
          );
        }
        return const CustomCircularLoading(height: 50, width: 50);
      },
    );
  }
}




// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class CategoriesList extends StatefulWidget {
//   const CategoriesList({Key? key}) : super(key: key);

//   @override
//   State<CategoriesList> createState() => _CategoriesListState();
// }

// class _CategoriesListState extends State<CategoriesList> {
//   @override
//   void initState() {
//     super.initState();
//     BlocProvider.of<CategoriesCubit>(context).getCategories();
//   }

//   int currentIndex = 0;
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 50.h,
//       child: BlocBuilder<CategoriesCubit, CategoriesState>(
//         builder: (context, state) {
//           if (state is GetCategoriesEmptyState) {
//             return CustomText(text: state.emptyMsg);
//           } else if (state is GetCategoriesLoadingState) {
//             return CustomCircularLoading(height: 25.h, width: 25.w);
//           } else if (state is GetCategoriesFailureState) {
//             return CustomText(text: state.failMsg);
//           } else if (state is GetCategoriesSuccessfullState) {
//             return ListView.builder(
//               scrollDirection: Axis.horizontal,
//               itemCount: state.categorieslist.length,
//               itemBuilder: (context, index) {
//                 final item = state.categorieslist[index];
//                 return Padding(
//                   padding: EdgeInsets.only(right: 15.w),
//                   child: InkWell(
//                     onTap: () {
//                       setState(() {
//                         currentIndex = index;
//                       });
//                       if (item.title! == 'All') {
//                         BlocProvider.of<ProductsCubit>(context).getProducts();
//                       } else {
//                         BlocProvider.of<ProductsCubit>(context)
//                             .searchProductsByMark(mark: item.title!);
//                       }
//                     },
//                     child: CustomText(
//                       text: item.title!,
//                       color: currentIndex == index
//                           ? AppColor.kBlack
//                           : AppColor.kGray,
//                       fontWeight: FontWeight.w700,
//                       fontSize: 20,
//                     ),
//                   ),
//                 );
//               },
//             );
//           }
//           return CustomCircularLoading(height: 25.h, width: 25.w);
//         },
//       ),
//     );
//   }
// }
