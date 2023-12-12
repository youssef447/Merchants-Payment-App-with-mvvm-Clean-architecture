
abstract class IAuthRepo {
  Future<void> signInEmailPass({
    required String email,
    required String pass,
  });
  Future<void>signUp({
    required String email,
    required String firstName,
    required String lastName,
    required String pass,
    required String phone,
  });

   Future<bool> signInWithGoogle();

  
}
