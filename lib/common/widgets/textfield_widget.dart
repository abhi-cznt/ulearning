import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';

import 'app_shadow.dart';
import 'image_widgets.dart';

Widget appTextField({
  TextEditingController? controller,
  String text = '',
  String iconPath = '',
  String hintText = "Type in your info",
  bool obscureText = false,
  void Function(String value)? func,
}) {
  return Container(
    margin: EdgeInsets.only(
      left: 25.w,
      right: 25.w,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Text14Normal(text: text),
        SizedBox(height: 5.h),
        Container(
          decoration: appBoxDecorationTextField(),
          // row contains icon and  text-field.
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 17.w),
                child: appImage(imagePath: iconPath),
              ),
              appTextFieldOnly(
                hintText: hintText,
                obscureText: obscureText,
                controller: controller,
                func: func,
              ),
            ],
          ),
        )
      ],
    ),
  );
}

Widget appTextFieldOnly({
  String hintText = 'type in your info',
  double height = 40,
  double width = 240,
  bool obscureText = false,
  TextEditingController? controller,
  void Function(String value)? func,
}) {
  return SizedBox(
    width: width.w,
    height: height.h,
    child: TextField(
      controller: controller,
      onChanged: (value) => func != null ? func(value) : () {},
      keyboardType: TextInputType.multiline,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.h),
        hintText: hintText,
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.transparent,
          ),
        ),
        //default border without input
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.transparent,
          ),
        ),
        // focused border with some input
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.transparent,
          ),
        ),
        disabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.transparent,
          ),
        ),
      ),

      autocorrect: false,
      maxLines: 1,
      // by default it is false
      obscureText: obscureText,
    ),
  );
}
