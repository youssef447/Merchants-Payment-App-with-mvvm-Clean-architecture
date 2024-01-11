import 'package:get_it/get_it.dart';
import 'package:payment_application_1/Data/repositories/FirebaseCrudRepo.dart';
import 'package:payment_application_1/Data/repositories/firebaseAuthRepo.dart';
import 'package:payment_application_1/Data/repositories/paymobRepo.dart';
import 'package:payment_application_1/Data/services/FirebaseCrudService.dart';
import 'package:payment_application_1/Data/services/locationService.dart';
import 'package:payment_application_1/Domain/repositories/ICrudRepo.dart';

import '../../Data/services/FirebaseAuthService.dart';
import '../../Data/services/PaymobService.dart';
import '../../Domain/repositories/iAuthRepo.dart';
import '../../Domain/repositories/iPaymentRepo.dart';

final locators = GetIt.instance;

configurationDependencies() {
  locators.registerLazySingleton<LocationService>(
    () => LocationService(),
  );
  locators.registerLazySingleton<IAuthRepo>(
    () => FirebaseAuthRepo(FirebaseAuthService()),
  );
  locators.registerLazySingleton<ICrudRepo>(
    () => FirebaseCrudRepo(
      FirebaseCrudService(),
    ),);

  locators.registerLazySingleton<IPaymentRepo>(
    () => PaymobRepo(
      PaymobService(),
    ),
  );
}
