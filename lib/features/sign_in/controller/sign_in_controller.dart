import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulearning_app/common/global_loader/global_loader.dart';
import 'package:ulearning_app/common/models/entites.dart';
import 'package:ulearning_app/common/routes/app_routes_names.dart';
import 'package:ulearning_app/common/utils/constant.dart';
import 'package:ulearning_app/common/widgets/popup_messages.dart';
import 'package:ulearning_app/global.dart';
import 'package:ulearning_app/main.dart';
import '../provider/notifier/sign_in_notifier.dart';
import '../repo/sign_in_repo.dart';

class SignInController {
  // WidgetRef ref;
  SignInController();
  static TextEditingController emailController = TextEditingController();
  static TextEditingController passwordController = TextEditingController();

  Future<void> handleSignIn(WidgetRef ref) async {
    var state = ref.read(signInNotifierProvider);
    String email = state.email;
    String password = state.password;

    emailController.text = email;
    passwordController.text = password;
    if (kDebugMode) {
      print("\n**** sign_in_controller ****\n *****handleSignIn******");
      print("email: $email");
      print("password: $password");
    }

    if (state.email.isEmpty || email.isEmpty) {
      toastInfo("Your email is empty");
      return;
    }
    if (state.password.isEmpty || password.isEmpty) {
      toastInfo("Your password is empty");
      return;
    }

    ref.read(appLoaderProvider.notifier).setLoaderValue(true);
    try {
      final credentials = await SignInRepo.firebaseSignIn(email, password);

      if (credentials.user == null) {
        toastInfo("User not found");
        ref.read(appLoaderProvider.notifier).setLoaderValue(false);
        return;
      }

      if (!credentials.user!.emailVerified) {
        toastInfo("you must verify your email first !");
        ref.read(appLoaderProvider.notifier).setLoaderValue(false);
        return;
      }

      var user = credentials.user;
      if (user != null) {
        String? displayName = user.displayName;
        String? email = user.email;
        String? id = user.uid;
        String? photoUrl = user.photoURL;
        LoginRequestEntity loginRequestEntity = LoginRequestEntity();
        loginRequestEntity.avatar = photoUrl;
        loginRequestEntity.name = displayName;
        loginRequestEntity.email = email;
        loginRequestEntity.open_id = id;
        loginRequestEntity.type = 1;
        asyncPostAllData(loginRequestEntity);
        if (kDebugMode) {
          print("User logged in");
        }
      } else {
        toastInfo("Login error!");
      }
    } on FirebaseAuthException catch (e) {
      toastInfo(e.code);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    ref.read(appLoaderProvider.notifier).setLoaderValue(false);
  }

  void asyncPostAllData(LoginRequestEntity loginRequestEntity) {
    // we need to talk to sever
    // have local storage
    try {
      // var navigator = Navigator.of(ref.context);
      //  try to remember the user info
      Global.storageService.setString(
        AppConstant.STORAGE_USER_PROFILE_KEY,
        // json encode transform the json to string. and we can store it now using preferences.
        jsonEncode({
          'name': 'Akhand',
          'email': 'akhand@gmail.com',
          'age': 34,
        }),
      );

      Global.storageService
          .setString(AppConstant.STORAGE_USER_TOKEN_KEY, 'value');

      // navigator.pushNamedAndRemoveUntil("/application", (route) => false);
      // navigator.pushNamed("/application");

      navKey.currentState?.pushNamedAndRemoveUntil(
          AppRoutesNames.APPLICATION, (route) => false);
    } catch (exception) {
      if (kDebugMode) {
        print("Sign_in_controller: $exception");
      }
    }
    // redirect to new page
  }
}
