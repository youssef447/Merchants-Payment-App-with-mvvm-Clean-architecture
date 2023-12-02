import 'package:flutter_bloc/flutter_bloc.dart';

import 'productsStates.dart';

class ProductsCubit extends Cubit<ProductsStates> {
  ProductsCubit() : super(ProductsInitialState());
  static ProductsCubit get(context) => BlocProvider.of(context);

  
}
