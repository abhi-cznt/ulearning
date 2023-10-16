import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/utils/colors.dart';
import 'package:ulearning_app/common/utils/image_res.dart';

Widget appImage({
  String imagePath = ImageRes.defaultImage,
  double width = 16,
  double height = 16,
}) {
  return Image.asset(
    imagePath.isNotEmpty?imagePath:ImageRes.defaultImage,
    width:width.w,
    height:height.h,
  );
}

Widget appImageWithColor({
  String imagePath = ImageRes.defaultImage,
  double width = 16,
  double height = 16,
  Color color = AppColors.primaryElement,
}) {
  return Image.asset(
    imagePath.isNotEmpty?imagePath:ImageRes.defaultImage,
    width:width.w,
    height:height.h,
    color: color,
  );
}


