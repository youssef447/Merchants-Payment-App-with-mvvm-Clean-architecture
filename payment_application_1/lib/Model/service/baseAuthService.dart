import 'package:flutter/material.dart';

abstract class IAuthService {
  signInEmailPass({
    required String email,
    required String pass,
    required BuildContext ctx,
  });
  signUp({
    required String email,
    required String firstName,
    required String lastName,
    required String pass,
    required String phone,
    required BuildContext ctx,
  });
}
