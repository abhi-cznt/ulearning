import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ulearning_app/pages/sign_in/notifier/sign_in_state.dart';
part 'sign_in_notifier.g.dart';

@riverpod
class SignInNotifier extends _$SignInNotifier {
  @override
  SignInState build() {
    return const SignInState();
  }

  void onEmailChanged({String email = ''}){
    state = state.copyWith(email: email);
  }

  void onPasswordChanged({String password = ''}){
    state = state.copyWith(password: password);
  }

}
