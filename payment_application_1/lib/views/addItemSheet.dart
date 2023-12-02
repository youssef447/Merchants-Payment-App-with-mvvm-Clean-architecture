import 'dart:io';

import 'package:currency_picker/currency_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_application_1/constants.dart';

import 'package:input_quantity/input_quantity.dart';
import 'package:payment_application_1/view-model/addProductCubit.dart';
import 'package:payment_application_1/view-model/addProductStates.dart';

import '../shared/sharedFunctions.dart';
import '../shared/widgets/defaultButton.dart';
import '../shared/widgets/defaultFormField.dart';
import '../shared/widgets/productImage.dart';

class AddItemSheet extends StatefulWidget {
  AddItemSheet({super.key});

  @override
  State<AddItemSheet> createState() => _AddItemState();
}

class _AddItemState extends State<AddItemSheet> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final TextEditingController _name = TextEditingController();

  final TextEditingController _description = TextEditingController();

  final TextEditingController _price = TextEditingController();

  late final File? imageFile;
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddProductCubit(),
      child: BlocConsumer<AddProductCubit, AddProductStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AddProductCubit.get(context);
          return DraggableScrollableSheet(
              initialChildSize: 0.9,
              maxChildSize: 0.9,
              expand: false,
              builder: (context, scrollController) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 28.0, vertical: 15),
                  child: SingleChildScrollView(
                    controller: scrollController,
                    physics: const BouncingScrollPhysics(),
                    child: Container(
                      color: Colors.white,
                      child: Form(
                        key: _formkey,
                        child: Column(
                          //  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ProductImage(
                              ctx: context,
                              cubit: cubit,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                DefaultFormField(
                                  controller: _name,
                                  context: context,
                                  hintText: "product name",
                                  filled: true,
                                  // fillColor: const Color(0Xfff2f2f2),
                                  fillColor: defaultFieldsColor,

                                  borderNone: true,
                                  radius: 25,
                                  validate: (str) {
                                    if (str!.isEmpty) {
                                      return "name required";
                                    }
                                    return "";
                                  },
                                ),
                                const SizedBox(height: 20),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: width * 0.5,
                                      child: DefaultFormField(
                                        controller: _price,
                                        context: context,
                                        borderNone: true,
                                        filled: true,
                                        hintText: "price",
                                        type: TextInputType.number,
                                        radius: 25,
                                        // fillColor: const Color(0Xfff2f2f2),
                                        fillColor: defaultFieldsColor,
                                        validate: (str) {
                                          if (str!.isEmpty) {
                                            return "price required";
                                          }
                                          return "";
                                        },
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    Expanded(
                                      child: TextButton(
                                        child: Text(cubit.currencyCode,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium!
                                                .copyWith(
                                                    fontWeight: FontWeight.bold,
                                                    color: defaultColor)),
                                        onPressed: () {
                                          currencyPicker(
                                            context: context,
                                            onSelect: (Currency currency) {
                                              cubit.selectCurrency(
                                                  currency.code);
                                             
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20),
                                InputQty.int(
                                  qtyFormProps:
                                      const QtyFormProps(enableTyping: false),
                                  messageBuilder: (minVal, maxVal, value) =>
                                      Text(
                                    'Quantity',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .copyWith(color: Colors.grey),
                                  ),
                                  decoration: const QtyDecorationProps(
                                    fillColor: defaultFieldsColor,
                                    btnColor: defaultColor,
                                    isBordered: false,
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 10),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                    ),
                                    borderShape: BorderShapeBtn.circle,
                                  ),
                                  initVal: 1,
                                  minVal: 1,
                                  onQtyChanged: (val) {
                                    print(val);
                                    quantity = val;
                                  },
                                ),
                                const SizedBox(
                                  height: 20,
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
                                    // fillColor: const Color(0Xfff2f2f2),
                                    fillColor: defaultFieldsColor,
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
                                  value: cubit.deliveryNeeded,
                                  onChanged: (val) {
                                    cubit.changeCheckBox(val);
                                  },
                                ),
                                const Spacer(),
                              ],
                            ),
                            SizedBox(
                              width: width * 0.4,
                              child: DefaultButton(
                                text: "post",
                                backgroundColor: defaultColor,
                                foregroundColor: Colors.white,
                                elevation: 10,
                                shadowColor: Colors.black,
                                raduis: 20,
                                onClicked: () {
                                  if (_formkey.currentState!
                                      .validate()) {
                                    //navigate to homeScreen
                                  } else {}
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              });
        },
      ),
    );
  }
}
