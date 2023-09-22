import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/widgets/button_widgets.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';
import 'package:ulearning_app/pages/sign_up/notifier/register_notifier.dart';
import 'package:ulearning_app/pages/sign_up/sign_up_controller.dart';

import '../../common/widgets/app_bar.dart';
import '../../common/widgets/textfield_widget.dart';

class SignUp extends ConsumerWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final regProvider = ref.watch(registerNotifierProvider);

    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: buildAppBar(title:"Sign Up"),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30.h),
                Center(
                  child: text14Normal(
                    text: 'Enter your details below & free',
                  ),
                ),

                SizedBox(height: 50.h),

                // username text field
                appTextField(
                  text: "User name",
                  iconPath: "assets/icons/user.png",
                  hintText: "Enter your user name",
                  func: (value) => ref
                      .read(registerNotifierProvider.notifier)
                      .onUserNameChanged(value),
                ),

                SizedBox(height: 20.w),

                // email text field
                appTextField(
                  text: "Email",
                  iconPath: "assets/icons/user.png",
                  hintText: "Enter your email address",
                  func: (value) => ref
                      .read(registerNotifierProvider.notifier)
                      .onEmailChanged(value),
                ),

                SizedBox(height: 20.w),

                // password text field
                appTextField(
                  text: "Password",
                  iconPath: "assets/icons/lock.png",
                  hintText: "Enter Password",
                  obscureText: true,
                  func: (value) => ref
                      .read(registerNotifierProvider.notifier)
                      .onPasswordChanged(value),
                ),

                SizedBox(height: 20.w),

                // password text field
                appTextField(
                  text: "Confirm Password",
                  iconPath: "assets/icons/lock.png",
                  hintText: "Enter your Confirm Password",
                  obscureText: true,
                  func: (value)=>ref.read(registerNotifierProvider.notifier).onConfirmPasswordChanged(value),
                ),

                Container(
                  margin: EdgeInsets.only(left: 25.w, right: 25.w, top: 20.w),
                  child: text13Normal(
                    text:
                        "By creating an account you have to agree with our terms and conditions.",
                  ),
                ),

                SizedBox(height: 50.h),
                Center(
                  child: appButton(buttonName: "Register",func:(){
                    SignUpController controller = SignUpController(ref: ref);
                    controller.handleSignUp();
                  } ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
