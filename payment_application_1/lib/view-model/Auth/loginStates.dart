
abstract class LoginStates{}
class LoginInitialState extends LoginStates {}

class LoginLoadingState extends LoginStates {}

class LoginSuccessState extends LoginStates {}

class LoginFaluireState extends LoginStates {
  final String error;

  LoginFaluireState(this.error);
}

class LoginResetPassSuccessState extends LoginStates {}
class ShowPasswordSuccessState extends LoginStates {}
class ChangeHelperTextState extends LoginStates {}


class LoginResetPassErrorState extends LoginStates {
  final String error;

  LoginResetPassErrorState(this.error);
}


