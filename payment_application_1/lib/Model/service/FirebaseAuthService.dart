import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import '../models/Merchant.dart';
import 'baseAuthService.dart';

class FirebaseAuthService implements IAuthService {
  @override
  signInEmailPass(
      {required String email,
      required String pass,
      required BuildContext ctx}) {

        
      }

  @override
  signUp(
      {required String email,
      required String firstName,
      required String lastName,
      required String pass,
      required String phone,
      File? profileImage,
      required BuildContext ctx}) async {
    String? profileImageUrl;

    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: pass)
        .then((value) async {
      final storageRef = FirebaseStorage.instance.ref();

      if (profileImage != null) {
        await storageRef
            .child(value.user!.uid)
            .child("profile")
            .putFile(profileImage);

        profileImageUrl = await storageRef
            .child(value.user!.uid)
            .child("profile")
            .getDownloadURL();
      }

      Merchant merchant = Merchant(
        email: email,
        firstName: firstName,
        profileIimageUrl: profileImageUrl ?? '',
        phone: phone,
        token: value.user!.uid,
        lastName: lastName,
      );
      FirebaseFirestore.instance
        .collection('merchants')
        .doc(merchant.token)
        .set(merchant.toJson())
        .then((value) {
     
         });
      
    });
  }
}
