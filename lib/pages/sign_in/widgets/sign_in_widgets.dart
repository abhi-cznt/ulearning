import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/utils/colors.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';

/*
 PreferredSized widget gives you a height or space from the appbar downwards and we can put
 child into the given space.
*/
AppBar buildAppBar()  {
  return AppBar(
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(1.0),
      child: Container(
        color: Colors.red,
        height: 1.0,
      ),
    ),
    title: text16Normal(
      text: "Log In",
      color: AppColors.primaryText,
    ),
  );
}

Widget thirdPartyLogin() {
  return Container(
    margin: EdgeInsets.only(
      left: 80.w,
      right: 80.w,
      top: 40.h,
      bottom: 20.h,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _loginButton("assets/icons/google.png"),
        _loginButton("assets/icons/apple.png"),
        _loginButton("assets/icons/facebook.png"),
      ],
    ),
  );
}

Widget _loginButton(String imagePath) {
  return GestureDetector(
    child: SizedBox(
      height: 40.h,
      width: 40.w,
      child: Image.asset(
        imagePath,
      ),
    ),
  );
}

Widget appTextField(){
  return Container();
}