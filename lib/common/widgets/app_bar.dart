import 'package:flutter/material.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';

import '../utils/colors.dart';

/*
 PreferredSized widget gives you a height or space from the appbar downwards and we can put
 child into the given space.
*/

AppBar buildAppBar({String title = "Log In"}) {
  return AppBar(
    // backgroundColor: Colors.white,
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(1.0),
      child: Container(
        color: Colors.grey.withOpacity(0.3),
        height: 1.0,
      ),
    ),
    title: text16Normal(
      text: title,
      color: AppColors.primaryText,
    ),
  );
}
