import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:payment_application_1/Presentation/widgets/defaultContainer.dart';
import 'package:payment_application_1/core/utils/appColors.dart';
import 'package:payment_application_1/core/utils/globales.dart';

import '../../../view-model/NavScreens/profileCubit.dart';
import '../../../view-model/NavScreens/profileStates.dart';
import '../../../widgets/defaultButton.dart';
import '../../../widgets/defaultCachedImage.dart';
part 'profilePicAvatar.dart';
part 'profileOptions.dart';

class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.defaultColor,
        body: Column(
          children: [
            SizedBox(
              height: height * 0.2,
            ),
            Expanded(
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.topCenter,
                children: [
                  DefaultContainer(
                    color: Colors.white,
                    width: double.infinity,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 70,
                        ),
                        Text(
                          '${currentUser.firstName} ${currentUser.lastName}',
                          style:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.defaultColor,
                                  ),
                        ),
                        Text(
                          currentUser.email,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                                fontWeight: FontWeight.bold,
                                color: const Color.fromARGB(255, 149, 169, 211),
                              ),
                        ),const SizedBox(
                          height: 15,
                        ),
                        DefaultButton(
                          width: double.minPositive,
                          backgroundColor: AppColors.defaultAddbtnColor,
                          raduis: 25,
                          height: 50,
                          onClicked: () {},
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('Edit Profile'),
                              Icon(Icons.arrow_forward_ios),
                            ],
                          ),
                        ),
                        const Spacer(),
                        const ProfileOptions(),
                        const Spacer(),
                      ],
                    ),
                  ),
                  const Positioned(
                    top: -50,
                    child: ProfilePicAvatar(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
