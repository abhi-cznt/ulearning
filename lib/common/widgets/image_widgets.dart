import 'package:flutter/cupertino.dart';

Widget appImage({
  String imagePath = "assets/icons/user.png",
  double width = 16,
  double height = 16,
}) {
  return Image.asset(
    imagePath.isNotEmpty?imagePath:'assets/icons/user.png',
    width:width,
    height:height,
  );
}
