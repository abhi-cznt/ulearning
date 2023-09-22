import'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ulearning_app/pages/sign_up/notifier/register_state.dart';
part 'register_notifier.g.dart';
@riverpod
class RegisterNotifier extends _$RegisterNotifier{
  @override
  RegisterState build(){
    return RegisterState();
  }

  onUserNameChanged(String value){
    state = state.copyWith(userName: value);
  }

  onEmailChanged(String value){
   state = state.copyWith(email: value);
  }

  onPasswordChanged(String value){
    state = state.copyWith(password: value);
  }

  onConfirmPasswordChanged(String value){
    state = state.copyWith(rePassword: value);
  }
}