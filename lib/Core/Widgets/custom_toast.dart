import 'package:call/Core/App/app_info.dart';
import 'package:call/Core/Utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CustomToast {
  void showToastErrorTop(
          {required BuildContext context,
          required String message,
          int? seconds}) =>
      Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: seconds ?? 2,
        backgroundColor: Colors.red,
        textColor: Colors.black,
        fontSize: 16.0,
      );
  void showToastSuccessTop({
    required BuildContext context,
    required String message,
    int? seconds,
  }) =>
      Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: seconds ?? 3,
        backgroundColor: AppColors.kGreen,
        textColor: AppColors.kWhite,
        fontSize: 16.0,
      );
  void showSuccessDifferenttContext({
    required String message,
    int? seconds,
  }) =>
      Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: seconds ?? 3,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0,
      );
  void showModalBottomSheetContainer({
    required BuildContext context,
    required Widget widget,
    required double height,
    required double width,
    Function()? whenComplete,
  }) =>
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.black.withOpacity(0.01),
        barrierColor: Colors.black.withOpacity(0.01).withOpacity(0.5),
        builder: (context) {
          return Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.01),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: widget,
          );
        },
      ).whenComplete(whenComplete ?? () {});
}
