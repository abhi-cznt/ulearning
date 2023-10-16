import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/utils/constant.dart';
import 'package:ulearning_app/common/widgets/app_shadow.dart';
import 'package:ulearning_app/common/widgets/image_widgets.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';
import 'package:ulearning_app/global.dart';

class AppOnBoardingPage extends StatelessWidget {
  final BuildContext context;
  final PageController controller;
  final String imagePath;
  final String title;
  final String subTitle;
  final int index;
  const AppOnBoardingPage(
      {super.key,
      required this.context,
      required this.controller,
      required this.imagePath,
      required this.title,
      required this.subTitle,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          /*Image.asset(
          imagePath,
        ),*/
          appImage(height: 300.h, width: 325.w, imagePath: imagePath),
          Container(
            margin: EdgeInsets.only(top: 15.h),
            child: text22Normal(
              text: title,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 15.h),
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Text14Normal(
              text: subTitle,
            ),
          ),
          _nextButton(index, controller, context),
        ],
      ),
    );
  }
}



Widget _nextButton(int index, PageController controller, BuildContext context) {
  return GestureDetector(
    onTap: () {
      if (index < 3) {
        controller.animateToPage(index,
            duration: const Duration(milliseconds: 300), curve: Curves.linear);
      } else {
        // remembering the app has opened or not
        Global.storageService
            .setBool(AppConstant.STORAGE_DEVICE_OPEN_FIRST_KEY, true);
        Navigator.pushNamed(context, "/sign_in");
      }
    },
    child: Container(
      width: 325.w,
      height: 50.h,
      margin: EdgeInsets.only(top: 120.h, left: 25.w, right: 25.w),
      decoration: appBoxShadow(),
      child: Center(
        child: Text14Normal(
            text: index < 3 ? 'next' : 'Get started', color: Colors.white),
      ),
    ),
  );
}
