import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/utils/colors.dart';
import 'package:ulearning_app/common/utils/image_res.dart';
import 'package:ulearning_app/common/widgets/image_widgets.dart';
import 'package:ulearning_app/features/home/view/home.dart';

var bottomTabs = <BottomNavigationBarItem>[
  BottomNavigationBarItem(
      icon: _bottomContainer(color: AppColors.primaryFourElementText),
      activeIcon: _bottomContainer(color: AppColors.primaryElement),
      backgroundColor: AppColors.primaryBackground,
      label: "Home"),
  BottomNavigationBarItem(
      icon: _bottomContainer(
          color: AppColors.primaryFourElementText,
          imagePath: ImageRes.search),
      activeIcon: _bottomContainer(
          color: AppColors.primaryElement,
          imagePath: ImageRes.search),
      backgroundColor: AppColors.primaryBackground,
      label: "Search"),
  BottomNavigationBarItem(
      icon: _bottomContainer(
          color: AppColors.primaryFourElementText,
          imagePath: ImageRes.play),
      activeIcon: _bottomContainer(
          color: AppColors.primaryElement,
          imagePath: ImageRes.play),
      backgroundColor: AppColors.primaryBackground,
      label: "Play"),
  BottomNavigationBarItem(
      icon: _bottomContainer(
          color: AppColors.primaryFourElementText,
          imagePath: ImageRes.message),
      activeIcon: _bottomContainer(
          color: AppColors.primaryElement,
          imagePath: ImageRes.message),
      backgroundColor: AppColors.primaryBackground,
      label: "Message"),
  BottomNavigationBarItem(
      icon: _bottomContainer(
          color: AppColors.primaryFourElementText,
          imagePath: ImageRes.person),
      activeIcon: _bottomContainer(
          color: AppColors.primaryElement,
          imagePath: ImageRes.person),
      backgroundColor: AppColors.primaryBackground,
      label: "Profile"),
];

Widget _bottomContainer({
  String imagePath = ImageRes.defaultImage,
  double width = 15,
  double height = 15,
  Color color = AppColors.primaryFourElementText,
}) {
  return SizedBox(
    width: width.w,
    height: height.h,
    child: appImageWithColor(
      imagePath: imagePath,
      color: color,
    ),
  );
}

Widget appScreens({int index = 0}){
  List<Widget> screens = [
    const Home(),
    Center(child: appImage(imagePath: ImageRes.search)),
    Center(child: appImage(imagePath: ImageRes.play)),
    Center(child: appImage(imagePath: ImageRes.message)),
    Center(child: appImage(imagePath: ImageRes.person)),
  ];
  return screens[index];
}
