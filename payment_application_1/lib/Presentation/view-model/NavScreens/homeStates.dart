abstract class HomeStates {}

class GetDataLoadingState extends HomeStates {}

class GetDataSuccessState extends HomeStates {}

class GetDataErrorState extends HomeStates {
  final String error;
  GetDataErrorState(this.error);
}

class HomeInitialState extends HomeStates {}


class HomeChangeIndexState extends HomeStates {}
