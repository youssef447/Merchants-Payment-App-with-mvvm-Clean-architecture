import 'package:get_it/get_it.dart';
import 'package:payment_application_1/Data/repositories/firebaseAuthRepo.dart';
import 'package:payment_application_1/Data/repositories/paymentRepo.dart';

import '../../Data/services/FirebaseAuthService.dart';
import '../../Data/services/PaymobService.dart';
import '../../Domain/repositories/iAuthRepo.dart';
import '../../Domain/repositories/iPaymentRepo.dart';

final locators = GetIt.instance;

configurationDependencies() {
  locators.registerLazySingleton<IAuthRepo>(
    () => FirebaseAuthRepo(
      FirebaseAuthService()
    ),
  );

  locators.registerLazySingleton<IPaymentRepo>(
    () => PaymobRepo(
      PaymobService(),
    ),
  );
}
