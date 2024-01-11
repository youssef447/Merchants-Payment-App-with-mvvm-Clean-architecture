import 'package:firebase_auth/firebase_auth.dart';

abstract class IAuthService {
  Future<void> sendOTPCode({
    required String phoneNumber,
  });

  Future<UserCredential> signInEmailPass({
    required String email,
    required String pass,
  });
  Future<UserCredential> signUp({
    required String email,
    required String pass,

  });

  Future<UserCredential?> signInWithGoogle();
  Future<void> signOut();
/* 
  Future<DocumentSnapshot<Map<String, dynamic>>> getUser();
  Future<void> updateUser(Map<String, dynamic> map);

  Future<DocumentSnapshot<Map<String, dynamic>>> getOthersProducts();
  Future<DocumentSnapshot<Map<String, dynamic>>> getMyProduct(); */

 
}
