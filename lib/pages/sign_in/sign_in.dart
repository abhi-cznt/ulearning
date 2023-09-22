import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/widgets/button_widgets.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';
import 'package:ulearning_app/pages/sign_in/widgets/sign_in_widgets.dart';

import '../../common/widgets/app_bar.dart';
import '../../common/widgets/textfield_widget.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: buildAppBar(),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // top login options
                thirdPartyLogin(),
                // more login options message
                Center(
                  child: text14Normal(
                    text: 'Or use your email account for login',
                  ),
                ),

                SizedBox(height: 50.h),

                // email text field
                appTextField(
                  text: "Email",
                  iconPath: "assets/icons/user.png",
                  hintText: "Enter your email address",
                ),

                SizedBox(height: 20.w),

                // password text field
                appTextField(
                  text: "Password",
                  iconPath: "assets/icons/lock.png",
                  hintText: "Enter Password",
                  obscureText: true,
                ),
                //forgot password text
                Container(
                  margin: EdgeInsets.only(
                    top: 20.h,
                    left: 25.w,
                  ),
                  child: textUnderline(text: "Forgot Password?"),
                ),
                SizedBox(height: 100.h),
                Center(
                  child: appButton(buttonName: "Log In"),
                ),
                SizedBox(height: 20.h),
                Center(
                  child: appButton(
                    buttonName: "Register",
                    isLogin: false,
                    context: context,
                    func: ()=> Navigator.pushNamed(context, '/register'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
