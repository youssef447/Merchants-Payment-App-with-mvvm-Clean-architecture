
import 'package:firebase_auth/firebase_auth.dart';

abstract class IAuthService {
  
  Future<void>sendOTPCode({required String phoneNumber,});



  Future<UserCredential> signInEmailPass({
    required String email,
    required String pass,
  });
  Future<UserCredential> signUp({
    required String email,
    required String firstName,
    required String lastName,
    required String pass,
    required String phone,
  });

  Future<UserCredential?> signInWithGoogle();

  Future<void>signOut();
}
