import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

abstract class ICrudService {
  //**************User*************//
  Future<void> addUser(
      {required Map<String, dynamic> query, required String uid});

  Future<DocumentSnapshot<Map<String, dynamic>>> getUser({required String userId});

  Future<void> updateUser(Map<String, dynamic> map);
  deleteUser();

  //**************User*************//

  Future<void> addOrder(
      {required Map<String, dynamic> orderReqQuery, required String docName});

  Future<QuerySnapshot<Map<String, dynamic>>> getMyOrders();
    Future<QuerySnapshot<Map<String, dynamic>>> getOthersOrders();


  Future<Reference> uploadFile({
    required File image,
    required String path,
  });
}
