import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulearning_app/common/global_loader/global_loader.dart';
import 'package:ulearning_app/common/widgets/popup_messages.dart';
import 'package:ulearning_app/pages/sign_in/notifier/sign_in_notifier.dart';

class SignInController {
  WidgetRef ref;
  SignInController(this.ref);

  Future<void> handleSignIn() async {
    var state = ref.read(signInNotifierProvider);
    String email = state.email;
    String password = state.password;

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
    // show app loader
    ref.read(appLoaderProvider.notifier).setLoaderValue(true);
    var context = Navigator.of(ref.context);
    try {
      final credentials =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (kDebugMode) {
        print(credentials);
      }

      if (credentials.user != null) {
        context.pushNamed("/homePage");
      }
    } on FirebaseAuthException catch (e) {
      if (kDebugMode) {
        print(e.message);
      }
    } catch(e){
      if(kDebugMode){
        print(e);
      }
    }

    ref.read(appLoaderProvider.notifier).setLoaderValue(false);
  }
}
