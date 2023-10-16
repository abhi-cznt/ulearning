import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/utils/colors.dart';
import 'package:ulearning_app/common/widgets/app_shadow.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';

Widget appButton({
  double width = 325,
  double height = 50,
  String buttonName = "",
  bool isLogin = true,
  BuildContext? context,
  void Function()? func,
}) {
  return GestureDetector(
    onTap: func,
    child: Container(
      height: height.h,
      width: width.w,
      decoration: appBoxShadow(
        color: isLogin ? AppColors.primaryElement : Colors.white,
        border: Border.all(
          color: AppColors.primaryFourElementText,
        ),
      ),
      child: Center(
        child:
        Text16Normal(
          text: buttonName,
          color: isLogin ? AppColors.primaryBackground : AppColors.primaryText,
        ),
      ),
    ),
  );
}
