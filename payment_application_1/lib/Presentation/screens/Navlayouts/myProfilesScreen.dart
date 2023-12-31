import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_application_1/Presentation/view-model/NavScreens/profileStates.dart';
import 'package:payment_application_1/Presentation/view-model/NavScreens/profileCubit.dart';
import 'package:payment_application_1/core/utils/globales.dart';

class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return
       BlocConsumer<ProfileCubit, ProfileStates>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, state) {
          ProfileCubit cubit = ProfileCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                '${currentUser!.firstName} ${currentUser!.lastName}',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            body: /*  Center(
              child: state is ProfileLogoutLoadingState
                  ? const LinearProgressIndicator()
                  : IconButton(
                      onPressed: () {
                        cubit.signOut(context);
                      },
                      icon: const Icon(
                        Icons.logout_rounded,
                        color: Colors.red,
                      )), */
                Column(
              children: [],
            ),
          );
        },
      
    );
  }
}
