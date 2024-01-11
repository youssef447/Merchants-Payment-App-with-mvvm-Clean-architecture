import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:payment_application_1/Data/models/paymentKey/request/billingDataModel.dart';
import 'package:payment_application_1/Presentation/view-model/payment/orderConfirmationStates.dart';
import 'package:payment_application_1/Presentation/widgets/defaultButton.dart';
import 'package:payment_application_1/Presentation/widgets/defaultCachedImage.dart';
import 'package:payment_application_1/Presentation/widgets/defaultFormField.dart';
import 'package:payment_application_1/core/utils/extensions.dart';
import 'package:payment_application_1/core/utils/sharedAssets.dart';
import 'package:payment_application_1/core/utils/sharedFunctions.dart';

import '../../../core/utils/appColors.dart';
import '../../../core/utils/globales.dart';
import '../../view-model/payment/orderConfirmationCubit.dart';
import '../addPayMethodScreen.dart';
part 'addressContainer.dart';
part 'payMethodContainer.dart';
part 'userInfoFields.dart';
part 'selectPayRadioButton.dart';

class OrderConfirmationScreen extends StatelessWidget {
  OrderConfirmationScreen(
      {super.key,
      required this.finalPrice,
      required this.currency,
      required this.orderId});
  final double finalPrice;
  final String currency, orderId;

  final TextEditingController _firstNameController = TextEditingController()
    ..text = currentUser.firstName;

  final TextEditingController _lastNameController = TextEditingController()
    ..text = currentUser.lastName;

  final TextEditingController _emailController = TextEditingController()
    ..text = currentUser.email;
  static final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final List<String> address = currentUser.address.split(', ');

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: BlocProvider(
        create: (context) => OrderConfirmationCubit(),
        child: BlocConsumer<OrderConfirmationCubit, OrderConfirmationStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = OrderConfirmationCubit.get(context);
            return Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 15.0, horizontal: 25),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    GestureDetector(
                        onTap: () {
                          if (_formkey.currentState!.validate()) {
                            // so number changed
                            if (cubit.phoneNumber != null) {
                              if (cubit.phoneNumber!.isValidNumber()) {
                                BillingDataModel billingDataModel =
                                    BillingDataModel(
                                  email: _emailController.text,
                                  firstName: _firstNameController.text,
                                  lastName: _lastNameController.text,
                                  phoneNumber:
                                      cubit.phoneNumber!.completeNumber,
                                  street: address[0],
                                  city: address[1].split(' ')[0],
                                  country: address[1].split(' ')[1],
                                );
                                navigate(
                                  context,
                                  PaymentMethodScreen(
                                    amountCents: finalPrice.toString(),
                                    currency: currency,
                                    orderId: orderId,
                                    billingData: billingDataModel,
                                  ),
                                );
                              } else {
                                print('msh tmaaaam');
                                // كدا كدا هيبقي ظاهر تبع الويدجت ايرور مسدج
                              }
                            } else {
                              BillingDataModel billingDataModel =
                                  BillingDataModel(
                                email: _emailController.text,
                                firstName: _firstNameController.text,
                                lastName: _lastNameController.text,
                                phoneNumber: currentUser.phone['number'],
                                street: address[0],
                                city: address[1].split(' ')[0],
                                country: address[1].split(' ')[1],
                              );
                              navigate(
                                context,
                                PaymentMethodScreen(
                                  amountCents: finalPrice.toString(),
                                  currency: currency,
                                  orderId: orderId,
                                  billingData: billingDataModel,
                                ),
                              );
                            }
                          }
                        },
                        child: const PayMethodContainer()),
                    SizedBox(
                      height: height * 0.04,
                    ),
                    Row(
                      children: [
                        Text(
                          'Delivery Address:',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        const Spacer(),
                        TextButton(
                          child: Text(
                            'Change',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.defaultColor),
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    const AddressContainer(),
                    SizedBox(
                      height: height * 0.04,
                    ),
                    Text(
                      'Confirm Your Information',
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    UserInfoFields(
                      lastNameController: _lastNameController,
                      firstNameController: _firstNameController,
                      emailController: _emailController,
                      formkey: _formkey,
                      cubit: cubit,
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Image.asset(
                      width: width * 0.5,
                      height: height * 0.1,
                      ImageAssets.icon,
                    ),
                    _SelectPayRadioButton(
                      cubit: cubit,
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Row(
                      children: [
                        Text(
                          'Total Price:',
                          style: Theme.of(context).textTheme.titleLarge!,
                        ),
                        const Spacer(),
                        Text('$finalPrice $currency',
                            textAlign: TextAlign.start,
                            style: Theme.of(context).textTheme.titleLarge!),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    DefaultButton(
                      backgroundColor: AppColors.defaultColor,
                      foregroundColor: Colors.white,
                      elevation: 10,
                      shadowColor: Colors.black,
                      raduis: 20,
                      onClicked: () {
                        /*  if (_formkey.currentState!.validate()) {
                          // so number changed
                          if (cubit.phoneNumber != null) {
                            if (cubit.phoneNumber!.isValidNumber()) {
                              print('tmaaaam');
                            } else {
                              print('msh tmaaaam');
                              // كدا كدا هيبقي ظاهر تبع الويدجت ايرور مسدج
                            }
                          } else {
                            print('tmaaaam bardo');
                          }
                        } */
                      },
                      child: const Text(
                        'Confirm',
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    ));
  }
}
