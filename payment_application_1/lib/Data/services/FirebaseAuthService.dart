import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'iAuthService.dart';

class FirebaseAuthService implements IAuthService {
  String? _verificationId;
  String? verificationId() => _verificationId;
  @override
  Future<UserCredential> signInEmailPass({
    required String email,
    required String pass,
  }) async {
    try {
      final response = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: pass);
      return response;
    } on SocketException {
      throw ('No Internet Connection');
    }
  }


  @override
  Future<UserCredential> signUp({
    required String email,
   
    required String pass,
  }) async {
    try {
      final response =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: pass,
      );
      return response;
    } on SocketException {
      throw ('No Internet Connection');
    }
  }

  @override
  Future<UserCredential?> signInWithGoogle() async {
    UserCredential? ret;
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      if (googleAuth != null) {
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,

          // Once signed in, return the UserCredential
        );
        ret = await FirebaseAuth.instance.signInWithCredential(credential);
      }

      return ret;
    } on SocketException {
      throw ('No Internet Connection');
    }
  }

  @override
  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Future<void> sendOTPCode({
    required String phoneNumber,
  }) async {
    FirebaseAuth.instance.verifyPhoneNumber(
      timeout: const Duration(seconds: 0),
      phoneNumber: phoneNumber,
      verificationCompleted: (phoneAuthCredential) {
        /* await FirebaseAuth.instance.currentUser!
            .linkWithPhoneNumber(phoneNumber);  */
      },
      verificationFailed: (error) {
        print('err failed ${error.message.toString()}');
        throw error;
      },
      codeSent: (verificationId, forceResendingToken) {
        _verificationId = verificationId;
        print('cooooooooodeeeee issssss seeeeeeeeent');
      },
      codeAutoRetrievalTimeout: (verificationId) {},
    );
  }



  /* @override
  Future<DocumentSnapshot<Map<String, dynamic>>> getUser() async {
    return await FirebaseFirestore.instance
        .collection('merchants')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
  }

  @override
  Future<void> updateUser(Map<String, dynamic> data) async {
    await FirebaseFirestore.instance
        .collection('merchants')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update(data);
  }

  @override
  Future<DocumentSnapshot<Map<String, dynamic>>> getOthersProducts() {
    
    // TODO: implement getOthersProducts
    throw UnimplementedError();
  }

  @override
  Future<DocumentSnapshot<Map<String, dynamic>>> getMyProduct() {
    // TODO: implement getProduct
    throw UnimplementedError();
  } */

}
