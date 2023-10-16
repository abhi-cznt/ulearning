import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/global_loader/global_loader.dart';
import 'package:ulearning_app/common/utils/colors.dart';
import 'package:ulearning_app/common/widgets/button_widgets.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';
import 'package:ulearning_app/features/sign_in/view/widgets/sign_in_widgets.dart';
import '../../../common/widgets/app_bar.dart';
import '../../../common/widgets/textfield_widget.dart';
import '../controller/sign_in_controller.dart';
import '../provider/notifier/sign_in_notifier.dart';

class SignIn extends ConsumerWidget {
  const SignIn({super.key});



  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final regProvider = ref.watch(signInNotifierProvider);
    final loaderProvider = ref.watch(appLoaderProvider);

    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: buildAppBar(),
          body: loaderProvider == false
              ? SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // top login options
                      thirdPartyLogin(),
                      // more login options message
                      const Center(
                        child: Text14Normal(
                          text: 'Or use your email account for login',
                        ),
                      ),

                      SizedBox(height: 50.h),

                      // email text field
                      appTextField(
                        controller: SignInController.emailController,
                        text: "Email",
                        iconPath: "assets/icons/user.png",
                        hintText: "Enter your email address",
                        func: (value) {
                          ref
                              .read(signInNotifierProvider.notifier)
                              .onEmailChanged(email: value);
                        },
                      ),

                      SizedBox(height: 20.w),

                      // password text field
                      appTextField(
                        controller: SignInController.passwordController,
                        text: "Password",
                        iconPath: "assets/icons/lock.png",
                        hintText: "Enter Password",
                        obscureText: true,
                        func: (value) {
                          ref
                              .read(signInNotifierProvider.notifier)
                              .onPasswordChanged(password: value);
                        },
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
                        child: appButton(
                            buttonName: "Log In",
                            func: () {
                              SignInController controller = SignInController();
                              controller.handleSignIn(ref);
                            }),
                      ),
                      SizedBox(height: 20.h),
                      Center(
                        child: appButton(
                          buttonName: "Register",
                          isLogin: false,
                          context: context,
                          func: () => Navigator.pushNamed(context, '/register'),
                        ),
                      ),
                    ],
                  ),
                )
              : const Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.blue,
                    color: AppColors.primaryElement,
                  ),
                ),
        ),
      ),
    );
  }
}
