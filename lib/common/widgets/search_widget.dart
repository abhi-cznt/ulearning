import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/utils/colors.dart';
import 'package:ulearning_app/common/utils/image_res.dart';
import 'package:ulearning_app/common/widgets/app_shadow.dart';
import 'package:ulearning_app/common/widgets/image_widgets.dart';
import 'package:ulearning_app/common/widgets/textfield_widget.dart';

Widget searchBar() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      // search text box
      Container(
        width: 280.w,
        height: 40.h,
        decoration: appBoxShadow(
            color: AppColors.primaryBackground,
            border: Border.all(color: AppColors.primaryFourElementText)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(left: 12.w),
              child: appImage(
                imagePath: ImageRes.searchIcon,
              ),
            ),
            Container(
              child: appTextFieldOnly(
                  width: 240, height: 40, hintText: "Search your course..."),
            ),
          ],
        ),
      ),

      //search button
      GestureDetector(
        child: Container(
          padding: EdgeInsets.all(8.w),
          width: 40.w,
          height: 40.h,
          decoration: appBoxShadow(
            border: Border.all(color: AppColors.primaryElement)
          ),
          child: appImage(imagePath: ImageRes.searchButton),
        ),
      )
    ],
  );
}
