import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/utils/colors.dart';

Widget text22Normal({String text = "", Color color = AppColors.primaryText}) {
  return Text(
    text,
    textAlign: TextAlign.center,
    style: TextStyle(
      fontSize: 22.sp,
      color: color,
      fontWeight: FontWeight.bold,
    ),
  );
}

Widget text16Normal({
  String text = '',
  Color color = AppColors.primarySecondaryElementText,
}) {
  return Text(
    text,
    style: TextStyle(
      fontSize: 16.sp,
      color: color,
      fontWeight: FontWeight.normal,
    ),
  );
}

Widget text14Normal(
    {String text = "", Color color = AppColors.primaryThreeElementText}) {
  return Text(
    text,
    textAlign: TextAlign.center,
    style: TextStyle(
      fontSize: 14.sp,
      color: color,
      fontWeight: FontWeight.bold,
    ),
  );
}
Widget text13Normal(
    {String text = "", Color color = AppColors.primaryThreeElementText}) {
  return Text(
    text,
    textAlign: TextAlign.start,
    style: TextStyle(
      fontSize: 13.sp,
      color: color,
      fontWeight: FontWeight.bold,
    ),
  );
}

Widget textUnderline({String text = ''}) {
  return GestureDetector(
    onTap: () {},
    child: Text(
      text,
      style: TextStyle(
        fontSize: 12.sp,
        color: AppColors.primaryText,
        fontWeight: FontWeight.normal,
        decoration: TextDecoration.underline,
        decorationColor: AppColors.primaryText,
      ),
    ),
  );
}
