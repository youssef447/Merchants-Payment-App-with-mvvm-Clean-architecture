import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:payment_application_1/Presentation/view-model/payment/paymentCubit.dart';
import 'package:payment_application_1/Presentation/view-model/payment/paymentStates.dart';
import 'package:payment_application_1/Presentation/widgets/payCardContainer.dart';
import 'package:payment_application_1/core/utils/appColors.dart';
import 'package:payment_application_1/core/utils/paymobConstants.dart';

import '../../Data/models/paymentKey/request/billingDataModel.dart';
import '../../core/utils/globales.dart';
import '../../core/utils/sharedAssets.dart';

class PaymentMethodScreen extends StatelessWidget {
  final BillingDataModel billingData;
  final String currency, amountCents, orderId;

  const PaymentMethodScreen({
    super.key,
    required this.billingData,
    required this.currency,
    required this.amountCents,
    required this.orderId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PaymentCubit(),
      child: BlocConsumer<PaymentCubit, PaymentStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = PaymentCubit.get(context);
            return SafeArea(
              child: Scaffold(
                backgroundColor: AppColors.defaultFieldsColor,
                appBar: AppBar(
                  backgroundColor: AppColors.defaultFieldsColor,
                  iconTheme: const IconThemeData(color: Colors.black),
                  title: Text('Choose Payment Method',
                      style: Theme.of(context).textTheme.titleLarge!),
                ),
                body: Stack(
                  fit: StackFit.expand,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: () async {
                              await cubit.getPaymentToken(
                                billingData: billingData,
                                amountCents: amountCents,
                                currency: currency,
                                integrationId:
                                    PaymobConstants.integrationIdCard,
                                orderId: orderId,
                                context: context,
                              );
                            },
                            child: PayCardContainer(
                              width: double.infinity,
                              height: height * 0.14,
                              title: 'Pay with Credit Card',
                              assetImg: ImageAssets.payCard,
                            ),
                          ),
                          GestureDetector(
                            onTap: () async {
                              await cubit.getPaymentToken(
                                billingData: billingData,
                                amountCents: amountCents,
                                currency: currency,
                                integrationId:
                                    PaymobConstants.integrationIdKiosk,
                                orderId: orderId,
                                context: context,
                              );
                              if (context.mounted) {
                                await cubit.reqKioskRef(context);
                              }
                            },
                            child: PayCardContainer(
                              width: double.infinity,
                              title: 'Pay with Ref Code',
                              height: height * 0.14,
                              assetImg: ImageAssets.kiosk,
                            ),
                          ),
                          GestureDetector(
                            onTap: () async {
                              await cubit.getPaymentToken(
                                billingData: billingData,
                                amountCents: amountCents,
                                currency: currency,
                                integrationId:
                                    PaymobConstants.integrationIdKiosk,
                                orderId: orderId,
                                context: context,
                              );
                               if (context.mounted) {
                                await cubit.reqMobileWalletUrl(context);
                              }
                            },
                            child: PayCardContainer(
                              width: double.infinity,
                              title: 'Pay using mobile wallet',
                              height: height * 0.14,
                              assetImg: ImageAssets.mobWallet,
                            ),
                          ),
                        ],
                      ),
                    ),
                    state is GetPaymentTokenLoadingState ||
                            state is ReqReferenceCodeLoadingState
                        ? BackdropFilter(
                            filter: ImageFilter.blur(
                              sigmaX: 3.0,
                              sigmaY: 3.0,
                            ),
                            child: const Center(
                              child: CircularProgressIndicator(color:Colors.white),
                            ),
                          )
                        : const SizedBox(),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
