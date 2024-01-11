import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:payment_application_1/Data/models/merchantMode.dart';
import 'package:payment_application_1/Domain/repositories/ICrudRepo.dart';
import 'package:payment_application_1/core/Di/injection.dart';

import '../services/FirebaseAuthService.dart';
import '../../core/Network/local/cach_helper.dart';
import '../../Domain/repositories/iAuthRepo.dart';

class FirebaseAuthRepo implements IAuthRepo {
  final FirebaseAuthService _authService;
  const FirebaseAuthRepo(this._authService);
  @override
  Future<String> signInEmailPass({
    required String email,
    required String pass,
  }) async {
    final response = await _authService.signInEmailPass(
      email: email,
      pass: pass,
    );
    //Check whether OTP Verification Done Successfully
    if (CacheHelper.getData(key: response.user!.uid) == null) {
      await _authService.signOut();
      return '';
    }
    return response.user!.uid;
  }

  @override
  Future<void> signUp({
    required String email,
    required String firstName,
    required String lastName,
    required String pass,
    required PhoneNumber phone,
    File? profileImage,
  }) async {
    final response = await _authService.signUp(
      email: email,
      pass: pass,
    );
    String? profileImageUrl;
    if (profileImage != null) {
      profileImageUrl = await locators.get<ICrudRepo>().uploadFile(
          image: profileImage,
          path: 'Profile/${Uri.file(profileImage.path).pathSegments.last}');
    }
    MerchantModel user = MerchantModel(
      email: email,
      firstName: firstName,
      lastName: lastName,
      phone: {
        'countryCode': phone.countryCode,
        'number': phone.completeNumber,
      },
      profileIimageUrl: profileImageUrl,
      address: 'test',
    );

    //create table for merchant information
    await locators
        .get<ICrudRepo>()
        .addUser(query: user.toJson(), uid: response.user!.uid);
  }

  ///returns false when response is null as user didn't complete google sign in,
  /// so we avoid null issue that makes login button loading
  @override
  Future<bool> signInWithGoogle() async {
    final UserCredential? response = await _authService.signInWithGoogle();

    if (response != null) {
      MerchantModel user = MerchantModel(
        email: response.user!.email!,
        firstName: response.user!.displayName!.split(' ')[0],
        lastName: response.user!.displayName!.split(' ')[1],
        //to be back
        phone: {
          'number': response.user!.phoneNumber ?? '',
        },
        profileIimageUrl: response.user!.photoURL,
        address:'test',
      );

      await locators
          .get<ICrudRepo>()
          .addUser(query: user.toJson(), uid: response.user!.uid);

      return true;
    }
    return false;
  }

  @override
  Future<void> signOut() async {
    _authService.signOut();
  }

  @override
  Future<String?> sendOTP({required String phoneNumber}) async {
    await _authService.sendOTPCode(phoneNumber: phoneNumber);
    return _authService.verificationId();
  }
}
