import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_application_1/Data/models/Order%20Registration%20API/response/OrderApiResponseModel.dart';
import 'package:payment_application_1/Presentation/screens/errorScreen.dart';
import 'package:payment_application_1/Presentation/view-model/orderViewCubit.dart';
import 'package:payment_application_1/Presentation/widgets/FadeInDown.dart';
import 'package:payment_application_1/Presentation/widgets/defaultCachedImage.dart';
import 'package:payment_application_1/Presentation/widgets/imagesPageView.dart';
import 'package:payment_application_1/Presentation/widgets/loadingScreen.dart';
import 'package:payment_application_1/Presentation/widgets/orderButtonsRow.dart';
import 'package:intl/intl.dart';

import '../../../Domain/entities/merchant.dart';
import '../../../core/utils/appColors.dart';
import '../../../core/utils/globales.dart';
import '../../../core/utils/sharedAssets.dart';
import '../../../core/utils/sharedFunctions.dart';
import '../../view-model/orderViewStates.dart';
import '../../widgets/defaultImageContainer.dart';
import '../../widgets/inputQty.dart';
import '../PaymentPage/orderConfirmationScreen.dart';
part 'orderDetailsCard.dart';

class OrderScreen extends StatelessWidget {
  final OrderApiResponseModel order;
  final PageController pagecontroller = PageController();

  OrderScreen(this.order, {super.key});

  @override
  Widget build(BuildContext context) {

    final _originalPrice= double.parse(order.amountCents);
    print('wtf $_originalPrice');
    return BlocProvider(
      create: (context) =>
          OrderViewCubit(originalPrice:_originalPrice)
            ..getMerchat(order.merchantUid),
      child: BlocConsumer<OrderViewCubit, OrderViewStates>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = OrderViewCubit.get(context);
          return SafeArea(
            child: Scaffold(
              backgroundColor: AppColors.defaultFieldsColor,
              body: state is GetMerchatLoadingState
                  ? const LoadingScreen()
                  : state is GetMerchatErrorState
                      ? ErrorScreen(
                          errorMessage: state.err,
                          retry: cubit.getMerchat(order.merchantUid))
                      : Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                order.imgsUrl.isEmpty
                                    ? FadeInDown(
                                        child: DefaultImageContainer(
                                          height: height * 0.45,
                                          widget:
                                              Image.asset(ImageAssets.camera),
                                        ),
                                      )
                                    : order.imgsUrl.length == 1
                                        ? FadeInDown(
                                            child: SizedBox(
                                              height: height * 0.45,
                                              child: DefaultImageContainer(
                                                height: height * 0.3,
                                                width: width,
                                                widget: DefaultCachedImage(
                                                  imgUrl: order.imgsUrl[0],
                                                ),
                                              ),
                                            ),
                                          )
                                        : FadeInDown(
                                            child: ImagesPageView(
                                              height: height * 0.45,
                                              //width: double.infinity,
                                              itemBuilder: (context, index) {
                                                return DefaultImageContainer(
                                                  height: height * 0.4,
                                                  width: width,
                                                  widget: Hero(
                                                    tag: 'order$index',
                                                    child: DefaultCachedImage(
                                                      imgUrl:
                                                          order.imgsUrl[index],
                                                    ),
                                                  ),
                                                );
                                              },
                                              controller: pagecontroller,
                                              itemCount: order.imgsUrl.length,
                                            ),
                                          ),
                                FadeInDown(
                                  child: Container(
                                    width: double.infinity,
                                    // height: height * 0.55 - 20,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 18.0),
                                    child: Column(
                                      children: [
                                        Wrap(
                                          alignment: WrapAlignment.center,
                                          spacing: width * 0.4,
                                          crossAxisAlignment:
                                              WrapCrossAlignment.center,
                                          runAlignment: WrapAlignment.end,
                                          children: [
                                            Text(
                                              order.item[0].name,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleLarge,
                                              textAlign: TextAlign.center,
                                            ),
                                            InputQtyWidget(
                                              fillColor:
                                                  AppColors.defaultFieldsColor,
                                              onQtyChanged: (val) {
                                                cubit.changeQuantity(val);
                                              },
                                              maxVal: int.parse(
                                                  order.item[0].quantity),
                                              messageBuilder: true,
                                              msgText:
                                                  'Available: ${order.item[0].quantity}',
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: height * 0.05,
                                        ),
                                        Wrap(
                                          alignment: WrapAlignment.start,
                                          children: [
                                            Text(
                                              'Description:',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleLarge!,
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              '${order.item[0].description}',
                                              textAlign: TextAlign.start,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleMedium!
                                                  .copyWith(
                                                      color: Colors.grey[700]),
                                              maxLines: 7,
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: height * 0.03,
                                        ),
                                        OrderDetailsCard(
                                            order: order,
                                            merchant: cubit.merchant),
                                        SizedBox(
                                          height: height * 0.04,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              'Total Price:',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleLarge!,
                                            ),
                                            const Spacer(),
                                            Text(
                                                '${cubit.price} ${order.currency}',
                                                textAlign: TextAlign.start,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleLarge!),
                                          ],
                                        ),
                                        SizedBox(
                                          height: height * 0.02,
                                        ),
                                        OrderButtonsRow(
                                          width: width * 0.4,
                                          buyOnClicked: () {
                                            navigate(
                                              context,
                                              OrderConfirmationScreen(
                                                finalPrice: cubit.price,
                                                currency: order.currency,
                                                orderId: order.id,
                                              ),
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
            ),
          );
        },
      ),
    );
  }
}
