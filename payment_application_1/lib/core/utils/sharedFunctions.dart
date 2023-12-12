import 'dart:io';

import 'package:currency_picker/currency_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

navigateTo(BuildContext ctx, Widget screen) {
  Navigator.of(ctx).pushReplacement(
    MaterialPageRoute(
      builder: (context) => screen,
    ),
  );
}
///check whether user signedIn or not exists
bool isLoggedIn(){
  if (FirebaseAuth.instance.currentUser != null) {
    // signed in
    return true;
} else {
   // signed out  
   return false;
   
}
}

navigate(BuildContext ctx, Widget screen) {
  Navigator.of(ctx).push(
    MaterialPageRoute(
      builder: (context) => screen,
    ),
  );
}

currencyPicker(
    {required BuildContext context,
    required Function(Currency currency) onSelect}) {
  showCurrencyPicker(
      context: context,
      theme: CurrencyPickerThemeData(
        flagSize: 25,
        titleTextStyle: const TextStyle(fontSize: 17),
        subtitleTextStyle:
            TextStyle(fontSize: 15, color: Theme.of(context).hintColor),
        bottomSheetHeight: MediaQuery.of(context).size.height / 2,
        //Optional. Styles the search field.
        inputDecoration: InputDecoration(
          labelText: 'Search',
          hintText: 'Start typing to search',
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: const Color(0xFF8C98A8).withOpacity(0.2),
            ),
          ),
        ),
      ),
      onSelect:
          onSelect /* (Currency currency) {
      print('Select currency: ${currency.name}');
    }, */
      );
}

Future<List<File>> pickIamge(
    {required ImageSource source, required BuildContext ctx}) async {
  final ImagePicker picker = ImagePicker();

  List<XFile> images = await picker.pickMultiImage(imageQuality: 85);
  List<File> fin = images.map((e) => File(e.path)).toList();

  return fin;
}
