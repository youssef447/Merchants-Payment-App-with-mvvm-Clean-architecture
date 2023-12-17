import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_application_1/Presentation/view-model/NavScreens/settingsCubit.dart';

import '../../view-model/NavScreens/settingsStates.dart';

class Mysettings extends StatelessWidget {
  const Mysettings({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingCubit(),
      child: BlocConsumer<SettingCubit, SettingStates>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, state) {
          SettingCubit cubit = SettingCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                "Settings",
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            body: Center(
              child: state is SettingsLogoutLoadingState
                  ? const LinearProgressIndicator()
                  : IconButton(
                      onPressed: () {
                        cubit.signOut(context);
                      },
                      icon: const Icon(
                        Icons.logout_rounded,
                        color: Colors.red,
                      )),
            ),
          );
        },
      ),
    );
  }
}
