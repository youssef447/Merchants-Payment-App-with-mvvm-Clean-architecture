import 'dart:io';

import 'package:currency_picker/currency_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_application_1/core/utils/constants.dart';

import 'package:payment_application_1/Presentation/view-model/NavScreens/addProductCubit.dart';
import 'package:payment_application_1/Presentation/view-model/NavScreens/addProductStates.dart';

import '../../core/utils/sharedFunctions.dart';
import 'defaultButton.dart';
import 'defaultFormField.dart';
import 'inputQty.dart';
import 'productImage.dart';

class AddItemSheet extends StatefulWidget {
  const AddItemSheet({super.key});

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
                return Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 28.0, vertical: 15),
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
                                    height: height * 0.25,
                                    child: GridView.builder(
                                      physics: const BouncingScrollPhysics(),
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3,
                                        crossAxisSpacing: 10,
                                        mainAxisSpacing: 10,
                                      ),
                                      itemCount: cubit.imgFiles.length + 1,
                                      itemBuilder: (context, index) {
                                        return index == cubit.imgFiles.length
                                            ? ProductImage(
                                                ctx: context,
                                                cubit: cubit,
                                              )
                                            : Stack(
                                                alignment: Alignment.topRight,
                                                children: [
                                                  ProductImage(
                                                    ctx: context,
                                                    cubit: cubit,
                                                    img: cubit.imgFiles[index],
                                                  ),
                                                  IconButton(
                                                    onPressed: () {
                                                      cubit.imgFiles
                                                          .removeAt(index);

                                                      cubit.changeImage();
                                                    },
                                                    icon: const Icon(
                                                      Icons.cancel_rounded,
                                                    ),
                                                  )
                                                ],
                                              );
                                      },
                                    ),
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
                                                  currency.symbol);
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20),
                                InputQtyWidget(
                                  fillColor: defaultFieldsColor,
                                  onQtyChanged: (val) {
                                    quantity = val;
                                  },
                                  messageBuilder: true,
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
                                  activeColor: defaultColor,
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
                                backgroundColor: defaultColor,
                                foregroundColor: Colors.white,
                                elevation: 10,
                                shadowColor: Colors.black,
                                raduis: 20,
                                onClicked: () {
                                  if (_formkey.currentState!.validate()) {
                                    //navigate to homeScreen
                                  } else {}
                                },
                                child: const Text('Post'),
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
