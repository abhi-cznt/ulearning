import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/utils/colors.dart';

Widget text24Normal(
    {String text = "",
    Color color = AppColors.primaryText,
    FontWeight fontWeight = FontWeight.normal}) {
  return Text(
    text,
    textAlign: TextAlign.center,
    style: TextStyle(
      fontSize: 24.sp,
      color: color,
      fontWeight: fontWeight,
    ),
  );
}

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

class Text16Normal extends StatelessWidget {
  final String text;
  final Color color;
  final FontWeight fontWeight;
  const Text16Normal(
      {super.key,
      this.text = '',
      this.color = AppColors.primarySecondaryElementText,
      this.fontWeight = FontWeight.normal});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 16.sp,
        color: color,
        fontWeight: fontWeight,
      ),
    );
  }
}

class Text14Normal extends StatelessWidget {
  final String text;
  final Color color;
  const Text14Normal(
      {super.key,
      this.text = "",
      this.color = AppColors.primaryThreeElementText});

  @override
  Widget build(BuildContext context) {
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

class Text10Normal extends StatelessWidget {
  final String text;
  final Color color;
  const Text10Normal(
      {super.key,
        this.text = "",
        this.color = AppColors.primaryThreeElementText});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 10.sp,
        color: color,
        fontWeight: FontWeight.normal,
      ),
    );
  }
}

class Text11Normal extends StatelessWidget {
  final String text;
  final Color color;
  const Text11Normal(
      {super.key,
        this.text = "",
        this.color = AppColors.primaryElementText});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 11.sp,
        color: color,
        fontWeight: FontWeight.normal,
      ),
    );
  }
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
