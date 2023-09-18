import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/widgets/app_shadow.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';

Widget appOnBoardingPage(
  BuildContext context,
  PageController controller, {
  String imagePath = 'assets/images/reading.png',
  String title = '',
  String subTitle = '',
  index = 0,
}) {
  return Container(
    color: Colors.white,
    child: Column(
      children: [
        SizedBox(
          height: 300.h,
          width: 325.w,
          child: Image.asset(
            imagePath,
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 15.h),
          child: text22Normal(
            text: title,
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 15.h),
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: text14Normal(
            text: subTitle,
          ),
        ),
        _nextButton(index, controller, context),
      ],
    ),
  );
}

Widget _nextButton(int index, PageController controller, BuildContext context) {
  return GestureDetector(
    onTap: () {
      if (index < 3) {
        controller.animateToPage(index,
            duration: const Duration(milliseconds: 500), curve: Curves.linear);
      } else {
        /*Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const SignIn(),
            ));*/
        Navigator.pushNamed(context, "/signIn");
      }
    },
    child: Container(
      width: 325.w,
      height: 40.h,
      margin: EdgeInsets.only(top: 80.h, left: 25.w, right: 25.w),
      decoration: appBoxShadow(),
      child: Center(
        child: text14Normal(text: index<3? 'next': 'Get started', color: Colors.white),
      ),
    ),
  );
}
