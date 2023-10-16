import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/utils/colors.dart';

import '../utils/image_res.dart';

BoxDecoration appBoxShadow(
    {Color color = AppColors.primaryElement,
    double radius = 15,
    double sR = 1.0,
    double bR = 2.0,
    BoxBorder? border}) {
  return BoxDecoration(
    color: color,
    borderRadius: BorderRadius.circular(radius),
    border: border,
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.1),
        spreadRadius: sR,
        blurRadius: bR,
        offset: const Offset(0, 1),
      ),
    ],
  );
}

BoxDecoration appBoxShadowWithRadius(
    {Color color = AppColors.primaryElement,
    double topLeft = 0,
    double topRight = 0,
    double bottomLeft = 0,
    double bottomRight = 0,
    double sR = 1.0,
    double bR = 2.0,
    BoxBorder? border}) {
  return BoxDecoration(
    color: color,
    borderRadius: BorderRadius.only(
      topRight: Radius.circular(topRight),
      topLeft: Radius.circular(topLeft),
      bottomLeft: Radius.circular(bottomLeft),
      bottomRight: Radius.circular(bottomRight),
    ),
    border: border,
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.1),
        spreadRadius: sR,
        blurRadius: bR,
        offset: const Offset(0, 1),
      ),
    ],
  );
}

BoxDecoration appBoxDecorationTextField({
  Color color = AppColors.primaryBackground,
  double radius = 15,
  Color borderColor = AppColors.primaryFourElementText,
}) {
  return BoxDecoration(
    color: color,
    borderRadius: BorderRadius.circular(radius),
    border: Border.all(color: borderColor),
  );
}

class AppBoxDecorationImage extends StatelessWidget {
  final double width;
  final double height;
  final String imagePath;
  const AppBoxDecorationImage(
      {super.key,
      this.width = 40,
      this.height = 40,
      this.imagePath = ImageRes.person});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height.w,
      width: width.w,
      decoration: BoxDecoration(
        image:  DecorationImage(
          fit: BoxFit.fitHeight,
          image: AssetImage(imagePath),
        ),
        borderRadius: BorderRadius.circular(20.w),
      ),
    );
  }
}
