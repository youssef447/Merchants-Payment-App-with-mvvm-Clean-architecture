import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:payment_application_1/Presentation/widgets/lanscapeProductCard.dart';
import 'package:payment_application_1/Presentation/widgets/portraitProductCard.dart';
import 'package:payment_application_1/core/utils/appColors.dart';

import '../../../core/utils/globales.dart';
import '../../view-model/NavScreens/myPorductsStates.dart';
import '../../view-model/NavScreens/myProductsCubit.dart';
import '../../widgets/loadingScreen.dart';
import '../../widgets/noProducts.dart';
import '../errorScreen.dart';

class MyProductsList extends StatelessWidget {
  const MyProductsList({super.key});

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (context, orientation) {
      return BlocConsumer<MyProductsCubit, MyProductsStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = MyProductsCubit.get(context);
            return RefreshIndicator(
              backgroundColor: AppColors.backgroundColor,
              color: AppColors.defaultColor,
              triggerMode: RefreshIndicatorTriggerMode.anywhere,
              onRefresh: () async {
                return await cubit.getMyProducts();
              },
              child: cubit.myOrders.isNotEmpty
                  ? ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      scrollDirection: orientation == Orientation.landscape
                          ? Axis.horizontal
                          : Axis.vertical,
                      physics: const AlwaysScrollableScrollPhysics(),
                      
                      itemBuilder: (context, index) {
                        return orientation == Orientation.portrait
                            ? PortraitProductCard(cubit.myOrders[index])
                            : LanscapeProductCard(cubit.myOrders[index]);
                      },
                      itemCount: cubit.myOrders.length,
                      itemExtent: orientation == Orientation.landscape
                          ? width * 0.6
                          : height * 0.45,
                    )
                  : state is MyProductsSuccessState
                      ? Stack(
                          children: [
                            NoProductsScreen(
                              orientation: orientation,
                            ),
                            ListView()
                          ],
                        )
                      : state is MyProductsErrorState
                          ? Stack(
                              children: [
                                ErrorScreen(
                                    errorMessage: state.err,
                                    retry: () {
                                      cubit.getMyProducts();
                                    }),
                                ListView()
                              ],
                            )
                          : const LoadingScreen(),
            );
          });
    });
  }
}
