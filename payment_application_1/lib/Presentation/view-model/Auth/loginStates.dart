abstract class LoginStates {}

class LoginPageInitialState extends LoginStates {}

class LoginLoadingState extends LoginStates {}

class GoogleLoginLoadingState extends LoginStates {}

class LoginSuccessState extends LoginStates {}

class GoogleLoginSuccessState extends LoginStates {}

class GoogleLoginCanceledState extends LoginStates {}

class LoginFaluireState extends LoginStates {
  final String error;

  LoginFaluireState(this.error);
}

class GoogleLoginFaluireState extends LoginStates {
  final String error;

  GoogleLoginFaluireState(this.error);
}

class LoginResetPassSuccessState extends LoginStates {}

class ShowPasswordSuccessState extends LoginStates {}

class ChangeHelperTextState extends LoginStates {}

class LoginResetPassErrorState extends LoginStates {
  final String error;

  LoginResetPassErrorState(this.error);
}
