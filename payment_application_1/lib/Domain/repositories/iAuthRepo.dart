
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
    required String phone,
    String? imgUrl,
  });

  Future<String> signInEmailPass({
    required String email,
    required String pass,
  });

  Future<bool> signInWithGoogle();

  Future<void> signOut();
}
