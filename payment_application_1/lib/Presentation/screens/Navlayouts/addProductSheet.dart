import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_application_1/core/utils/globales.dart';

import 'package:payment_application_1/Presentation/view-model/NavScreens/addProductCubit.dart';
import 'package:payment_application_1/Presentation/view-model/NavScreens/addProductStates.dart';

import '../../../core/utils/appColors.dart';
import '../../widgets/ShippingDataForm.dart';
import '../../widgets/defaultButton.dart';
import '../../widgets/defaultFormField.dart';
import '../../widgets/imgGridView.dart';
import '../../widgets/inputQty.dart';
import '../../widgets/priceCurrencyField.dart';
import '../../widgets/productImage.dart';

class AddProductSheet extends StatefulWidget {
  const AddProductSheet({super.key});

  @override
  State<AddProductSheet> createState() => _AddItemState();
}

class _AddItemState extends State<AddProductSheet> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final TextEditingController _name = TextEditingController();

  final TextEditingController _description = TextEditingController();

  final TextEditingController _price = TextEditingController();



  final TextEditingController _apartment = TextEditingController();
  final TextEditingController _address = TextEditingController();
  final TextEditingController _companyName = TextEditingController();

  final TextEditingController _postalCode = TextEditingController();

  late final File? imageFile;
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddProductCubit(),
      child: BlocConsumer<AddProductCubit, AddProductStates>(
        listener: (context, state) {
          
        },
        builder: (context, state) {
          var cubit = AddProductCubit.get(context);
          _address.text = cubit.addressField;

          return DraggableScrollableSheet(
            initialChildSize: 0.9,
            maxChildSize: 0.9,
            expand: false,
            builder: (context, scrollController) {
              if (cubit.deliveryNeeded ) {
                scrollController.animateTo(height * 0.44,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeIn);
              }
              return Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 28.0, right: 28.0, top: 15),
                  child: SingleChildScrollView(
                    controller: scrollController,
                    physics: const BouncingScrollPhysics(),
                    child: Form(
                      key: _formkey,
                      child: Column(
                        children: [
                          cubit.imgFiles.isEmpty
                              ? ProductImage(
                                  ctx: context,
                                  cubit: cubit,
                                )
                              : SizedBox(
                                  height: height * 0.3,
                                  child: ImgGridView(
                                      cubit: cubit,
                                      itemCount: cubit.imgFiles.length),
                                ),
                          SizedBox(
                            height: height * 0.03,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              DefaultFormField(
                                controller: _name,
                                context: context,
                                hintText: "product name",
                                filled: true,
                                fillColor: AppColors.defaultFieldsColor,
                                borderNone: true,
                                radius: 25,
                                validate: (str) {
                                  if (str == null) {
                                    return "name required";
                                  }
                                  if (str.isEmpty) {
                                    return "name required";
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(
                                height: height * 0.02,
                              ),
                              PriceCurrencyField(
                                cubit: cubit,
                                price: _price,
                              ),
                              SizedBox(
                                height: height * 0.02,
                              ),
                              InputQtyWidget(
                                fillColor: AppColors.defaultFieldsColor,
                                onQtyChanged: (val) {
                                  quantity = val;
                                },
                                messageBuilder: true,
                              ),
                              SizedBox(
                                height: height * 0.02,
                              ),
                              SizedBox(
                                height: height * 0.2,
                                child: DefaultFormField(
                                  controller: _description,
                                  context: context,
                                  filled: true,
                                  borderNone: true,
                                  hintText: "add description",
                                  radius: 25,
                                  fillColor: AppColors.defaultFieldsColor,
                                  helperText: "(Optional)",
                                  expand: true,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const Spacer(),
                              Text(
                                'delivery needed',
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              Checkbox.adaptive(
                                activeColor: AppColors.defaultColor,
                                value: cubit.deliveryNeeded,
                                onChanged: (val) {
                                  cubit.changeCheckBox(val);
                                },
                              ),
                              const Spacer(),
                            ],
                          ),
                          cubit.deliveryNeeded
                              ? ShippingDataForm(
                                  apartment: _apartment,
                                
                                  companyName: _companyName,
                                  postalCode: _postalCode,
                                  address: _address,
                                )
                              : const SizedBox(),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          state is AddProductLoadingState
                              ? const LinearProgressIndicator()
                              : DefaultButton(
                                  backgroundColor: AppColors.defaultColor,
                                  foregroundColor: Colors.white,
                                  elevation: 10,
                                  shadowColor: Colors.black,
                                  raduis: 20,
                                  onClicked: () {
                                    if (cubit.currencyCode == 'currency') {
                                      cubit.showCurrReqMessage(true);
                                    } else {
                                      if (cubit.currReqMeesage == true) {
                                        cubit.showCurrReqMessage(false);
                                      }
                                    }
                                    if (cubit.deliveryNeeded) {
                                      if (cubit.cityValue == 'City' ||
                                          cubit.stateValue == 'State' ||
                                          cubit.countryValue == 'Country') {
                                        cubit.showAddressReqMessage(true);
                                      } else {
                                        // اصل لو هي كانت ب فالس اصلا هعمل ستيت تاني ع الفاضي لي واخليها فالس بردو
                                        if (cubit.addReqMeesage == true) {
                                          cubit.showAddressReqMessage(false);
                                        }
                                      }
                                    }
                                    if (_formkey.currentState!.validate()) {
                                      if (cubit.addReqMeesage == false &&
                                          cubit.currReqMeesage == false) {

                                      cubit.addOrder(
                                        ctx: context,
                                        price: double.parse(_price.text),
                                        productName: _name.text,
                                        quantity: quantity,
                                        apartNo: _apartment.text,
                                        city: cubit.cityValue,
                                        country: cubit.countryValue,
                                        state: cubit.stateValue,
                                        description: _description.text,
                                        street: _address.text,
                                        postalCode: _postalCode.text,
                                      );
                                    }
                                    }
                                  },
                                  child: const Text('Post'),
                                ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
