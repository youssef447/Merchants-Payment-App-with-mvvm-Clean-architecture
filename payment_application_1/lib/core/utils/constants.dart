///response is token which is valid for one hour from it's creation time

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

const baseUrl = "https://accept.paymob.com/api/";

const authMethod = "auth/tokens";

///response is order id , created time and etc..
const orderRegMethod = "ecommerce/orders";

///response is a token of the man who u will deal with , who posted the order
const paymentKeyReqMethod = "acceptance/payment_keys";

const apiKey =
    'ZXlKaGJHY2lPaUpJVXpVeE1pSXNJblI1Y0NJNklrcFhWQ0o5LmV5SmpiR0Z6Y3lJNklrMWxjbU5vWVc1MElpd2ljSEp2Wm1sc1pWOXdheUk2T0RZMk5qTXhMQ0p1WVcxbElqb2lhVzVwZEdsaGJDSjkuNWlkTk5MTEdPeDJPOFNhUFlJV29WOHdXbEgxb0pZX25MazI0UDM3bkp4WGdsZUpVNDJsVDFOdnlSOS12M0RMS0VFVXlKaFhwaVFWd05hdW9aWHlpSVE=';

const defaultColor = Color(0xff06328f);
const backgroundColor = Colors.white;
const defaultFieldsColor = Color(0Xfff6f8fc);

 AppLocalizations? globalLocale;
String? coSent;
late final String token;
const integrationIdCard = 4062929;
const integrationIdKiosk = 4140496;
String authToken = "";

String finalToken = "";
late double height, width, topPadding;






















/*//response is token which is valid for one hour from it's creation time

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AppConstants {
  static const baseUrl = "https://accept.paymob.com/api/";

  static const authMethod = "auth/tokens";

//response is order id , created time and etc..
  static const orderRegMethod = "ecommerce/orders";

//response is a token of the man who u will deal with , who posted the order
  static const paymentKeyReqMethod = "acceptance/payment_keys";

  static const apiKey =
      'ZXlKaGJHY2lPaUpJVXpVeE1pSXNJblI1Y0NJNklrcFhWQ0o5LmV5SmpiR0Z6Y3lJNklrMWxjbU5vWVc1MElpd2ljSEp2Wm1sc1pWOXdheUk2T0RZMk5qTXhMQ0p1WVcxbElqb2lhVzVwZEdsaGJDSjkuNWlkTk5MTEdPeDJPOFNhUFlJV29WOHdXbEgxb0pZX25MazI0UDM3bkp4WGdsZUpVNDJsVDFOdnlSOS12M0RMS0VFVXlKaFhwaVFWd05hdW9aWHlpSVE=';

  static const defaultColor = Color(0xff06328f);
  static const backgroundColor = Colors.white;
  static const defaultFieldsColor = Color(0Xfff6f8fc);

  static late AppLocalizations? globalLocale;

  late final String token;
  static const integrationIdCard = 4062929;
  static const integrationIdKiosk = 4140496;
  static String authToken = "";

  static String finalToken = "";
  static late double height, width, topPadding;
}
 */
