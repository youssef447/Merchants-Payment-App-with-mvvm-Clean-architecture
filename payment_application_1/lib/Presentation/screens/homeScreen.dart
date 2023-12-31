import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_application_1/Presentation/screens/errorScreen.dart';
import 'package:payment_application_1/Presentation/view-model/NavScreens/historyCubit.dart';
import 'package:payment_application_1/Presentation/view-model/NavScreens/myProductsCubit.dart';
import 'package:payment_application_1/Presentation/view-model/NavScreens/otherProductsCubit.dart';
import 'package:payment_application_1/Presentation/view-model/NavScreens/profileCubit.dart';
import 'package:payment_application_1/core/utils/globales.dart';
import 'package:payment_application_1/Presentation/screens/Navlayouts/addProductSheet.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../core/utils/appColors.dart';
import '../view-model/NavScreens/homeCubit.dart';
import '../view-model/NavScreens/homeStates.dart';
import '../widgets/BottomAppbarItem.dart';
import '../widgets/loadingScreen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    globalLocale ??= AppLocalizations.of(context)!;

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeCubit()..getData(),
        ),
        BlocProvider(
          create: (context) => MyProductsCubit()..getMyProducts(),
        ),
        BlocProvider(
          create: (context) => OtherProductsCubit()..getOthersProducts(),
        ),
        BlocProvider(
          create: (context) => HistoryCubit(),
        ),
        BlocProvider(
          create: (context) => ProfileCubit(),
        ),
      ],
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = HomeCubit.get(context);
          return SafeArea(
            child: Scaffold(
              body: state is GetDataLoadingState
                  ? const LoadingScreen()
                  : state is GetDataErrorState
                      ? ErrorScreen(
                          errorMessage: state.error,
                          retry: () {
                            cubit.getData();
                          })
                      : Scaffold(
                          resizeToAvoidBottomInset: false,
                          floatingActionButton: FloatingActionButton(
                            shape: const CircleBorder(),
                            onPressed: () {
                              showModalBottomSheet(
                                  isScrollControlled: true,
                                  context: context,
                                  builder: (context) => Padding(
                                        padding: EdgeInsets.only(
                                            bottom: MediaQuery.of(context)
                                                .viewInsets
                                                .bottom),
                                        child: const AddProductSheet(),
                                      ),
                                  backgroundColor: Colors.white);
                            },
                            child: const Icon(Icons.add_shopping_cart_sharp,
                                color: Colors.white),
                          ),
                          floatingActionButtonLocation:
                              FloatingActionButtonLocation.startDocked,
                          bottomNavigationBar: BottomAppBar(
                            height: 60,
                            color: AppColors.defaultColor,
                            notchMargin: 2,
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 25),
                            shape: const CircularNotchedRectangle(),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                InkWell(
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () {
                                    if (cubit.currentIndex != 0) {
                                      cubit.changeHomeIndex(0);
                                    }
                                  },
                                  child: BottomAppBarTabItem(
                                      icon: Icons
                                          .production_quantity_limits_outlined,
                                      index: 0,
                                      labelText: "products",
                                      color: cubit.currentIndex == 0
                                          ? Colors.white
                                          : Colors.grey[400]!),
                                ),

                                //SizedBox(width: width*0.5*0.5,),
                                InkWell(
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () {
                                    if (cubit.currentIndex != 1) {
                                      cubit.changeHomeIndex(1);
                                    }
                                  },
                                  child: BottomAppBarTabItem(
                                      icon: Icons.history_outlined,
                                      index: 1,
                                      labelText: "history",
                                      color: cubit.currentIndex == 1
                                          ? Colors.white
                                          : Colors.grey[400]!),
                                ),
                                InkWell(
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () {
                                    if (cubit.currentIndex != 2) {
                                      cubit.changeHomeIndex(2);
                                    }
                                  },
                                  child: BottomAppBarTabItem(
                                      icon: Icons.person_pin_circle_rounded,
                                      index: 2,
                                      labelText: "profile",
                                      color: cubit.currentIndex == 2
                                          ? Colors.white
                                          : Colors.grey[400]!),
                                ),
                              ],
                            ),
                          ),
                          body: cubit.screens[cubit.currentIndex],
                        ),
            ),
          );
        },
      ),
    );
  }
}
