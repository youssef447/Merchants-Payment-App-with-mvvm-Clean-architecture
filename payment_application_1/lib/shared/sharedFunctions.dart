import 'dart:io';

import 'package:currency_picker/currency_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

navigateTo(BuildContext ctx, Widget screen) {
  Navigator.of(ctx).pushReplacement(
    MaterialPageRoute(
      builder: (context) => screen,
    ),
  );
}

navigate(BuildContext ctx, Widget screen) {
  Navigator.of(ctx).push(
    MaterialPageRoute(
      builder: (context) => screen,
    ),
  );
}

currencyPicker({required BuildContext context,required Function(Currency currency) onSelect}) {
  showCurrencyPicker(
    context: context,
    theme: CurrencyPickerThemeData(
      flagSize: 25,
      titleTextStyle: TextStyle(fontSize: 17),
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
    onSelect: onSelect /* (Currency currency) {
      print('Select currency: ${currency.name}');
    }, */
  );
}

Future<File?> pickIamge(
    {required ImageSource source, required BuildContext ctx}) async {
  {
    final ImagePicker _picker = ImagePicker();

    XFile? image = await _picker
        .pickImage(source: source, imageQuality: 85)
        .catchError(((onError) {}));
    File? file = image == null
        ? null
        : File(
            image.path,
          );

    // if (ctx.mounted) Navigator.of(ctx).pop();
    return file;
  }
}
