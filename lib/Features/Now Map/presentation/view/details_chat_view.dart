// import 'package:call/Core/Enums/font_enum.dart';
// import 'package:call/Core/Widgets/custom_cached_image.dart';
// import 'package:call/Core/Widgets/custom_text.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:call/Core/Utils/app_colors.dart';
// import 'package:call/Core/Utils/app_padding.dart';
// import 'package:call/Features/Now%20Map/data/models/chats_model.dart';
// import 'package:call/Features/Now%20Map/presentation/view/widgets/appbar.dart';

// class DetailsChatview extends StatelessWidget {
//   final ChatsModel item;
//   const DetailsChatview({
//     Key? key,
//     required this.item,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.kBlack.withOpacity(0.9),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           SizedBox(height: 55.h),
//           //^ appbar
//           ChatListBar(
//             withPhoto: true,
//             title: item.name!,
//             photoUrl: item.photo!,
//           ),
//           Divider(
//             thickness: 0.5,
//             height: 20.h,
//             color: Colors.grey.shade500,
//           ),
//           SizedBox(height: 15.h),
//           CustomText(
//             text: 'SEP 14,2021',
//             fontType: FontType.medium22,
//             color: Colors.grey.shade600,
//           ),
//           SizedBox(height: 15.h),
//           //^ user msg
//           UserMsg(
//             time: '8:27 PM',
//             item: item,
//             msg: 'Alex, let\'s meet this weekend. I\'ll check with Dave too 😎',
//           ),
//           SizedBox(height: 15.h),
//           //^ contact msg
//           ContactMsg(
//             isTime: false,
//             item: item,
//             time: '8:56 PM',
//             msg: 'Sure. Let\'s aim for saturday',
//           ),
//           SizedBox(height: 5.h),
//           //^ contact msg
//           ContactMsg(
//             isTime: true,
//             item: item,
//             time: '8:56 PM',
//             msg: 'I\'m visiting mom this sunday 👻',
//           ),
//           SizedBox(height: 15.h),
//           //^ user msg
//           UserMsg(
//             item: item,
//             time: '9:01 PM',
//             msg: 'Alrighty! Will give you a call shortly',
//           ),
//           SizedBox(height: 15.h),
//           //^ contact msg
//           ContactMsg(
//             isTime: true,
//             item: item,
//             time: '9:04 PM',
//             msg: '❤️',
//           ),
//           SizedBox(height: 15.h),
//           CustomText(
//             text: 'TODAY',
//             fontType: FontType.medium22,
//             color: Colors.grey.shade600,
//           ),
//           SizedBox(height: 15.h),
//           //^ user msg
//           UserMsg(
//             item: item,
//             time: '11:53 AM',
//             msg: 'Hey you! Are you there?',
//           ),
//           SizedBox(height: 15.h),
//           //^ contact msg
//           ContactMsg(
//             isTime: true,
//             item: item,
//             time: '12:14 PM',
//             msg: '👋 Hi Jess! What\'s up?',
//           ),
//           const Spacer(),
//           Align(
//             alignment: Alignment.bottomCenter,
//             child: Container(
//               height: 100,
//               decoration: const BoxDecoration(color: AppColors.kBlack),
//               child: const TextChatField(),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class TextChatField extends StatelessWidget {
//   const TextChatField({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(10.0),
//       child: TextFormField(
//         style: const TextStyle(fontSize: 22, color: AppColors.kWhite),
//         decoration: InputDecoration(
//           suffixIcon: SizedBox(
//             width: 80,
//             child: Row(
//               children: [
//                 const Icon(
//                   Icons.add,
//                   size: 25,
//                   color: AppColors.kGrey3,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 10),
//                   child: Container(
//                     padding: const EdgeInsets.all(5),
//                     decoration: const BoxDecoration(
//                       color: Colors.pink,
//                       shape: BoxShape.circle,
//                     ),
//                     child: const Icon(
//                       Icons.warning_amber_rounded,
//                       size: 25,
//                       color: AppColors.kWhite,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           contentPadding: EdgeInsets.symmetric(horizontal: AppPadding().w20),
//           fillColor: Colors.grey.shade700,
//           filled: true,
//           hintText: 'Type your message here.',
//           hintStyle: TextStyle(
//             fontSize: 20.sp,
//             color: Colors.grey.shade400,
//           ),
//           border: const OutlineInputBorder(
//               borderRadius: BorderRadius.all(Radius.circular(25))),
//           enabledBorder: const OutlineInputBorder(
//               borderRadius: BorderRadius.all(Radius.circular(25))),
//           focusedBorder: const OutlineInputBorder(
//               borderRadius: BorderRadius.all(Radius.circular(25))),
//           errorBorder: const OutlineInputBorder(
//               borderRadius: BorderRadius.all(Radius.circular(25))),
//           focusedErrorBorder: const OutlineInputBorder(
//               borderRadius: BorderRadius.all(Radius.circular(25))),
//         ),
//       ),
//     );
//   }
// }

// class UserMsg extends StatelessWidget {
//   final ChatsModel item;
//   final String msg;
//   final String time;

//   const UserMsg({
//     super.key,
//     required this.item,
//     required this.msg,
//     required this.time,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: AppPadding().w20),
//       child: Column(
//         children: [
//           Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               CustomCachedImage(
//                 width: 50,
//                 height: 50,
//                 photoUrl: item.photo!,
//                 child: Container(),
//               ),
//               SizedBox(width: 8.w),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Container(
//                     constraints: BoxConstraints(maxWidth: 260.w),
//                     padding: const EdgeInsets.all(8),
//                     decoration: BoxDecoration(
//                       color: Colors.grey.shade800,
//                       borderRadius: const BorderRadius.only(
//                         topRight: Radius.circular(15),
//                         bottomLeft: Radius.circular(15),
//                         bottomRight: Radius.circular(15),
//                       ),
//                     ),
//                     child: CustomText(
//                       text: msg,
//                       fontType: FontType.medium20,
//                       color: Colors.grey.shade300,
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.only(top: 5.h),
//                     child: Align(
//                       alignment: Alignment.centerRight,
//                       child: CustomText(
//                         text: time,
//                         fontType: FontType.medium16,
//                         color: Colors.grey.shade600,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

// class ContactMsg extends StatelessWidget {
//   final ChatsModel item;
//   final String msg;
//   final bool isTime;
//   final String time;

//   const ContactMsg({
//     super.key,
//     required this.item,
//     required this.msg,
//     required this.time,
//     this.isTime = true,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: AppPadding().w20),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.end,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               Container(
//                 //constraints: BoxConstraints(maxWidth: 260.w),
//                 padding: const EdgeInsets.all(8),
//                 decoration: BoxDecoration(
//                   color: Colors.blue.shade800,
//                   borderRadius: const BorderRadius.only(
//                     topLeft: Radius.circular(15),
//                     bottomLeft: Radius.circular(15),
//                     bottomRight: Radius.circular(15),
//                   ),
//                 ),
//                 child: Align(
//                   alignment: Alignment.centerRight,
//                   child: CustomText(
//                     text: msg,
//                     fontType: FontType.medium20,
//                     color: Colors.grey.shade300,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           isTime
//               ? Padding(
//                   padding: EdgeInsets.only(top: 5.h),
//                   child: Align(
//                     alignment: Alignment.centerRight,
//                     child: CustomText(
//                       text: time,
//                       fontType: FontType.medium16,
//                       color: Colors.grey.shade600,
//                     ),
//                   ),
//                 )
//               : const SizedBox.shrink(),
//         ],
//       ),
//     );
//   }
// }
