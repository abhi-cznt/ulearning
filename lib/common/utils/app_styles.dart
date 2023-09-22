import 'package:flutter/material.dart';
import 'package:ulearning_app/common/utils/colors.dart';

class AppTheme{
  static ThemeData appThemeData = ThemeData(
    brightness:Brightness.light,
    appBarTheme: const AppBarTheme(
      elevation: 0.0,
      centerTitle:true,
      backgroundColor:Colors.white,
      iconTheme:IconThemeData(
        color:AppColors.primaryText,
      ),
    ),
  );
}