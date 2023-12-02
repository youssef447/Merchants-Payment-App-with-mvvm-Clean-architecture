import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_application_1/constants.dart';
import 'package:payment_application_1/shared/widgets/BottomAppbarItem.dart';
import 'package:payment_application_1/view-model/navCubit.dart';
import 'package:payment_application_1/view-model/navStates.dart';
import 'package:payment_application_1/views/addItemSheet.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavCubit(),
      child: BlocConsumer<NavCubit, NavStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = NavCubit.get(context);
          return Scaffold(
            floatingActionButton: FloatingActionButton(
              child: const Icon(Icons.add_shopping_cart_sharp),
              onPressed: () {
                showModalBottomSheet(
                    isScrollControlled: true,
                    
                    context: context,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25),
                      ),
                    ),
                    builder: (context) => AddItemSheet(),
                    backgroundColor: Colors.white);
              },
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.startDocked,
            bottomNavigationBar: BottomAppBar(
              color: defaultColor,
              notchMargin: 2,
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
              shape: const CircularNotchedRectangle(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      if (cubit.currentIndex != 0) {
                        cubit.changeNavIndex(0);
                      }
                    },
                    child: BottomAppBarTabItem(
                        icon: Icons.production_quantity_limits_outlined,
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
                        cubit.changeNavIndex(1);
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
                        cubit.changeNavIndex(2);
                      }
                    },
                    child: BottomAppBarTabItem(
                        icon: Icons.settings,
                        index: 2,
                        labelText: "settings",
                        color: cubit.currentIndex == 2
                            ? Colors.white
                            : Colors.grey[400]!),
                  ),
                ],
              ),
            ),
            body: cubit.screens[cubit.currentIndex],
          );
        },
      ),
    );
  }
}
