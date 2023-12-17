import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'Presentation/screens/AuthScreens/logupScreen.dart';
import 'Presentation/view-model/blocObserver.dart';
import 'core/utils/sharedFunctions.dart';
import 'core/utils/themes.dart';
import 'Presentation/view-model/locales/locales cubit.dart';
import 'Presentation/view-model/locales/locales states.dart';
import 'Presentation/screens/AuthScreens/loginScreen.dart';
import 'Presentation/screens/splashScreen.dart';
import 'Presentation/screens/homeScreen.dart';

import 'core/Network/local/cach_helper.dart';
import 'core/Network/remote/dio_helper.dart';
import 'core/utils/constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'Presentation/screens/startupErrorScreen.dart';
import 'core/Di/injection.dart';

void main() async {
  WidgetsBinding binding = WidgetsFlutterBinding
      .ensureInitialized(); //عشان اتاكد انه هيخلص كل الawaits قبل الرن
  Bloc.observer = MyBlocObserver();

  FlutterNativeSplash.preserve(
    widgetsBinding: binding,
  );

  try {
    await Firebase.initializeApp();
   /*  await FirebaseAppCheck.instance.activate(
        //webRecaptchaSiteKey: 'recaptcha-v3-site-key',
        ); */
    configurationDependencies();
    await CacheHelper.init();

    Widget homeWidget;
    if (CacheHelper.getData(key: 'started') == null) {
      homeWidget = const SplashScreen();
    } else {
      /*  String? tmpToken = CacheHelper.getData(key: 'token');
      if (tmpToken == null) {
        homeWidget = LoginScreen();
      } else {
        token = tmpToken;
        homeWidget = const HomeScreen();
      } */

      if (isLoggedIn()) {
        // signed in
        homeWidget = const HomeScreen();
      } else {
        homeWidget = LoginScreen();
      }
    }
    homeWidget = LogupScreen();

    DioHelper.init(baseUrl: baseUrl);
    runApp(MyApp(home: homeWidget));
    FlutterNativeSplash.remove();
  } catch (_) {
    runApp(const AppstartupErrorWidget("Error: failed Starting App"));
  }
}

class MyApp extends StatelessWidget {
  final Widget home;
  const MyApp({super.key, required this.home});
  @override
  Widget build(BuildContext context) {
    topPadding = MediaQuery.of(context).padding.top;
    height = MediaQuery.of(context).size.height - topPadding;
    width = MediaQuery.of(context).size.width - topPadding;

    return BlocProvider(
      create: (context) => LocalesCubit(),
      child: BlocConsumer<LocalesCubit, LocalesStates>(
        listener: (context, state) {},
        builder: (context, state) {
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
