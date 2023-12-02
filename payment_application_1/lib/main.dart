import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:payment_application_1/shared/styles/themes.dart';
import 'package:payment_application_1/view-model/locales/locales%20cubit.dart';
import 'package:payment_application_1/view-model/locales/locales%20states.dart';
import 'package:payment_application_1/views/AuthScreens/loginScreen.dart';
import 'package:payment_application_1/views/splashScreen.dart';
import 'package:payment_application_1/views/home.dart';

import 'Network/local/cach_helper.dart';
import 'Network/remote/dio_helper.dart';
import 'constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'startupErrorWidget.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); //عشان اتاكد انه هيخلص كل الawaits قبل الرن
  try {
    await Firebase.initializeApp();

    await CacheHelper.init();

    Widget homeWidget;
    if (CacheHelper.getData(key: 'started') == null) {
      homeWidget = const SplashScreen();
    } else {
      String? tmpToken = CacheHelper.getData(key: 'token');
      if (tmpToken == null) {
        homeWidget = LoginScreen();
      } else {
        token = tmpToken;
        print(token);
        homeWidget = const HomeScreen();
      }
    }

    DioHelper.init(baseUrl: baseUrl);
    runApp(MyApp(home: homeWidget));
  } catch (_) {
    runApp(const AppstartupErrorWidget("Error: failed Starting App"));
  }
}

class MyApp extends StatelessWidget {
  final Widget home;
  const MyApp({super.key, required this.home});
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    topPadding = MediaQuery.of(context).padding.top;

    return BlocProvider(
      create: (context) => LocalesCubit(),
      child: BlocConsumer<LocalesCubit, LocalesStates>(
        listener: (context, state) {},
        builder: (context, state) {
          globalLocale = AppLocalizations.of(context);

          LocalesCubit cubit = LocalesCubit.get(context);

          if (CacheHelper.getData(key: 'lang') == 'ar') {
            cubit.selectedLang = const Locale('ar');
            cubit.selectedValue = Languages.arabic;
          } else {
            cubit.selectedLang = const Locale('en');
            cubit.selectedValue = Languages.english;
          }

          return MaterialApp(
              title: 'Payment app',
              locale: cubit.selectedLang,
              // supportedLocales: SupportedLanguages.all,
              supportedLocales: AppLocalizations.supportedLocales,
              localizationsDelegates: const [
                GlobalMaterialLocalizations
                    .delegate, //حاجات فلاتر بتهندلها زي  الدايلوج هيخليه حذف/الغاء لو عربي
                GlobalCupertinoLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate, //اتحاه الويدجيت
                AppLocalizations.delegate,
              ],
              debugShowCheckedModeBanner: false,
              //theme: lightTheme,
              darkTheme: darkTheme,
              //theme: lightTheme,
              themeMode: ThemeMode.dark,
              /*  home: SplashScreen(
              cubit: cubit,
            ), */
              home: home);
        },
      ),
    );
  }
}
