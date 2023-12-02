import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../Network/local/cach_helper.dart';
import '../constants.dart';
import 'package:country_flags/country_flags.dart';

import '../shared/sharedFunctions.dart';
import '../shared/sharedAssets.dart';
import '../shared/widgets/FadeInDown.dart';
import '../shared/widgets/defaultButton.dart';
import '../shared/widgets/defaultContainer.dart';
import '../view-model/locales/locales cubit.dart';
import '../view-model/locales/locales states.dart';
import 'AuthScreens/loginScreen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LocalesCubit, LocalesStates>(
      listener: (context, state) {},
      builder: (context, state) {
        LocalesCubit cubit = LocalesCubit.get(context);

        return Scaffold(
          backgroundColor: defaultColor,
          body: Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top),
            child: FadeInDown(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Image.asset(
                        ImageAssets.paymob,
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.5,
                        fit: BoxFit.contain,
                      ),
                      Positioned(
                        bottom: 25,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppLocalizations.of(context)!.welcome,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(
                                        color: Colors.grey[300],
                                        fontSize: 40,
                                        fontWeight: FontWeight.normal),
                              ),
                              Text(
                                AppLocalizations.of(context)!.toApp,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: DefaultContainer(
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(AppLocalizations.of(context)!.selectLanguage,
                              style: Theme.of(context).textTheme.bodyLarge),
                          DropdownButton(
                            value: cubit.selectedValue,
                            onChanged: (Languages? value) {
                              cubit.changeLocale(value!);
                            },
                            items: [
                              DropdownMenuItem(
                                value: Languages.english,
                                child: Row(
                                  children: [
                                    CountryFlags.flag(
                                      width: 25,
                                      'us',
                                      borderRadius: 55,
                                    ),
                                    const SizedBox(
                                      // sized box with width 10
                                      width: 60,
                                    ),
                                    const Text("english"),
                                  ],
                                ),
                              ),
                              DropdownMenuItem(
                                value: Languages.arabic,
                                child: Row(
                                  children: [
                                    CountryFlags.flag(
                                      width: 25,
                                      'sa',
                                      borderRadius: 55,
                                    ),
                                    const SizedBox(
                                      // sized box with width 10
                                      width: 60,
                                    ),
                                    const Text("العربية")
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.35,
                            child: DefaultButton(
                              text: AppLocalizations.of(context)!.start,
                              backgroundColor: defaultColor,
                              raduis: 25,
                              elevation: 5,
                              shadowColor: Colors.grey[400],
                              onClicked: () async {
                                await CacheHelper.saveData(
                                    key: 'started', value: true);
                                if (context.mounted) {
                                  navigateTo(
                                    context,
                                    LoginScreen(),
                                  );
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

enum Languages { arabic, english }
