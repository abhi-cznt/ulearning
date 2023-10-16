import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulearning_app/common/global_loader/global_loader.dart';
import 'package:ulearning_app/common/widgets/popup_messages.dart';
import '../provider/notifier/register_notifier.dart';
import '../repo/sign_up_repo.dart';

class SignUpController {
  late WidgetRef ref;
  SignUpController({required this.ref});

  static  TextEditingController userNameController = TextEditingController();
  static  TextEditingController emailController = TextEditingController();
  static  TextEditingController passwordController = TextEditingController();

  Future<void> handleSignUp() async {
    var state = ref.read(registerNotifierProvider);
    String name = state.userName;
    String email = state.email;
    String password = state.password;
    String rePassword = state.rePassword;

    userNameController.text = name;
    emailController.text = email;
    passwordController.text = password;

    if (kDebugMode) {
      print("Your name is $name");
      print("Your email is $email");
      print("Your password is $password");
      print("Your rePassword is $rePassword");
    }

    if (state.userName.isEmpty || name.isEmpty) {
      toastInfo("Your name is empty");
      return;
    }

    if (state.email.isEmpty || email.isEmpty) {
      toastInfo("Your email is empty");
      return;
    }
    if (state.password.isEmpty || password.isEmpty) {
      toastInfo("Your password is empty");
      return;
    }
    if (state.rePassword.isEmpty || rePassword.isEmpty) {
      toastInfo("Confirm password is empty!");
      return;
    }
    if (state.password != state.rePassword || password != rePassword) {
      toastInfo("Your password did not match");
      return;
    }

    // show the app loader
    ref.read(appLoaderProvider.notifier).setLoaderValue(true);

    // the context stored into the another variable so that, we use it after 'await'//
    var context = Navigator.of(ref.context);
    try {
      final credential =
          await SignUpRepo.firebaseSignUp(email, password);

      if (kDebugMode) {
        print(credential);
      }

      if (credential.user != null) {
        await credential.user?.sendEmailVerification();
        await credential.user?.updateDisplayName(name);

        //get user photo url
        //set user photo url

        toastInfo("An email has been sent to verify your account. "
            "Please open that email and confirm your identity.");


        context.pop();
        userNameController.text = '' ;
        emailController.text = '';
        passwordController.text = '';
      }
    }on FirebaseAuthException catch (e) {

      toastInfo(e.message.toString());
    }catch(e){
      if (kDebugMode) {
        print("**sign_up_controller**");
        print('Error caught: $e');
      }
    }

    // hide the app loader
    ref.read(appLoaderProvider.notifier).setLoaderValue(false);
  }
}