import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_application_1/Presentation/screens/errorScreen.dart';
import 'package:payment_application_1/Presentation/widgets/loadingScreen.dart';

import 'package:payment_application_1/Presentation/widgets/portraitProductCard.dart';

import '../../../core/utils/appColors.dart';
import '../../../core/utils/globales.dart';
import '../../view-model/NavScreens/otherProductsCubit.dart';
import '../../view-model/NavScreens/otherProductsStates.dart';
import '../../widgets/lanscapeProductCard.dart';
import '../../widgets/noProducts.dart';

class OthersProductsList extends StatelessWidget {
  const OthersProductsList({super.key});

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (context, orientation) {
      return BlocConsumer<OtherProductsCubit, OtherProductsStates>(
        listener: (BuildContext context, OtherProductsStates state) {},
        builder: (context, state) {
          var cubit = OtherProductsCubit.get(context);
          return RefreshIndicator(
            backgroundColor: AppColors.backgroundColor,
            color: AppColors.defaultColor,
            triggerMode: RefreshIndicatorTriggerMode.anywhere,
            onRefresh: ()async {
              return await cubit.getOthersProducts();
            },
            child: cubit.othersOrders.isNotEmpty
                ? ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    scrollDirection: orientation == Orientation.landscape
                        ? Axis.horizontal
                        : Axis.vertical,
                    physics: const ClampingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return orientation == Orientation.landscape
                          ? LanscapeProductCard(cubit.othersOrders[index])
                          : PortraitProductCard(cubit.othersOrders[index]);
                    },
                    itemCount: cubit.othersOrders.length,
                    itemExtent: orientation == Orientation.landscape
                        ? width * 0.6
                        : height * 0.44,
                  )
                : state is OtherProductsSuccessState
                    ? Stack(
                        children: [
                          NoProductsScreen(
                            orientation: orientation,
                          ),
                          ListView(),
                        ],
                      )
                    : state is OtherProductsErrorState
                        ? Stack(
                            children: [
                              ErrorScreen(
                                  errorMessage: state.err,
                                  retry: cubit.getOthersProducts),
                              ListView(),
                            ],
                          )
                        : const LoadingScreen(),
          );
        },
      );
    });
  }
}
