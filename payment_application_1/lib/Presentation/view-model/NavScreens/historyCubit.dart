import 'package:flutter_bloc/flutter_bloc.dart';

import 'historyStates.dart';


class HistoryCubit extends Cubit<HistoryStates> {
  HistoryCubit() : super(HistoryInitialState());
  static HistoryCubit get(context) => BlocProvider.of(context);

  
}
