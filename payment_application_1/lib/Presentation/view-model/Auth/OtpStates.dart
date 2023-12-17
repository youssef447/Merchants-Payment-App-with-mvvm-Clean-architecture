abstract class OtpStates {}

class OtpInitialState extends OtpStates {}

class OtpSentLoadingState extends OtpStates {}

class OtpSentSuccessState extends OtpStates {}

class OtpSentErrorState extends OtpStates {}

class OtpResentLoadingState extends OtpStates {}

class OtpResentSuccessState extends OtpStates {}

class OtpResentErrorState extends OtpStates {}

class OtpVerifiedLoadingState extends OtpStates {}

class OtpVerifiedSuccessState extends OtpStates {}

class OtpVerifiedErrorState extends OtpStates {}
