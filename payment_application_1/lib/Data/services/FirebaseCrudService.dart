import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'ICrudService.dart';

class FirebaseCrudService implements ICrudService {
  @override
  deleteUser() {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<DocumentSnapshot<Map<String, dynamic>>> getUser({required String userId}) async {
    return await FirebaseFirestore.instance
        .collection('merchants')
        .doc(userId)
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
  Future<Reference> uploadFile({
    required File image,
    required String path,
  }) async {
    Reference storageReference = FirebaseStorage.instance
        .ref()
        .child(FirebaseAuth.instance.currentUser!.uid)
        .child(path);
    UploadTask uploadTask = storageReference.putFile(image);
    await uploadTask.whenComplete(() => null);
    return storageReference;
  }

  @override
  Future<void> addOrder(
      {required Map<String, dynamic> orderReqQuery,
      required String docName}) async {
    await FirebaseFirestore.instance
        .collection('Orders')
        .doc()
        .set(orderReqQuery);
  }

  @override
  Future<void> addUser(
      {required Map<String, dynamic> query, required String uid}) async {
    await FirebaseFirestore.instance
        .collection('merchants')
        .doc(uid)
        .set(query);
  }

  @override
  Future<QuerySnapshot<Map<String, dynamic>>> getMyOrders() async {
    return await FirebaseFirestore.instance
        .collection('Orders')
        .where('merchant_uid',
            isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();
  }

  @override
  Future<QuerySnapshot<Map<String, dynamic>>> getOthersOrders() async {
    return await FirebaseFirestore.instance
        .collection('Orders')
        .where('merchant_uid',
            isNotEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();
  }
}
