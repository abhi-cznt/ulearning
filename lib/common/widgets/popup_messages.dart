import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
toastInfo(
  String msg, {
  Color textColor = Colors.black,
  Color backgroundColor = Colors.red,
}) {
  return Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    textColor: textColor,
    backgroundColor: backgroundColor,
    timeInSecForIosWeb: 2,
    gravity: ToastGravity.TOP,
    fontSize: 16.sp,
  );
}
