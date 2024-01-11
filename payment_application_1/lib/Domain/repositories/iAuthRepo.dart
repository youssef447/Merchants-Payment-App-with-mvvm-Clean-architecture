import 'dart:io';

import 'package:intl_phone_field/phone_number.dart';

abstract class IAuthRepo {
  /// returns verification Id, To be used later in phoneAuthCredential
  Future<String?> sendOTP({
    required String phoneNumber,
  });

  Future<void> signUp({
    required String email,
    required String firstName,
    required String lastName,
    required String pass,
    required  PhoneNumber phone,
    File? profileImage,
  });

  Future<String> signInEmailPass({
    required String email,
    required String pass,
  });

  Future<bool> signInWithGoogle();

  Future<void> signOut();
}
