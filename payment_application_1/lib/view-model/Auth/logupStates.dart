abstract class LogupStates {}

class LogupInitialState extends LogupStates {}

class LogupLoadingState extends LogupStates {}

class LogupSuccessState extends LogupStates {}
class PhoneRequiredMessageState extends LogupStates {}
class FirstPasswordChangedState extends LogupStates {}

class ChangeHelperTextState extends LogupStates {}

class ShowPasswordSuccessState extends LogupStates {}

class LogupFaluireState extends LogupStates {
  final String error;

  LogupFaluireState(this.error);
}
