abstract class HistoryStates {}

class HistoryInitialState extends HistoryStates {}

class GetTransactionsLoadingState extends HistoryStates {}

class GetTransactionsSuccessState extends HistoryStates {}

class GetTransactionsErrorState extends HistoryStates {
  final String err;
  GetTransactionsErrorState(this.err);
}
