import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_application_1/Presentation/view-model/NavScreens/addProductCubit.dart';
import 'package:payment_application_1/Presentation/view-model/NavScreens/addProductStates.dart';
import 'package:payment_application_1/Presentation/widgets/defaultCSCPicker.dart';
import 'package:payment_application_1/Presentation/widgets/defaultFormField.dart';

import '../../core/utils/appColors.dart';
import '../../core/utils/globales.dart';

class ShippingDataForm extends StatelessWidget {
  late final TextEditingController _apartment;
  late final TextEditingController _companyName;

  late final TextEditingController _address;

  late final TextEditingController _postalCode;

  ShippingDataForm({
    super.key,
    required TextEditingController apartment,
    required TextEditingController companyName,
    required TextEditingController address,
    required TextEditingController postalCode,
  }) {
    _apartment = apartment;
    _companyName = companyName;
    _postalCode = postalCode;
    _address = address;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddProductCubit, AddProductStates>(
        listener: (context, state) {},
        builder: (context, state) {
          AddProductCubit cubit = AddProductCubit.get(context);
          print(
              'whyyyyyyy ${cubit.countryValue} ${cubit.cityValue} ${cubit.stateValue}');

          return Column(
            children: [
              DefaultFormField(
                controller: _companyName,
                context: context,
                filled: true,
                fillColor: AppColors.defaultFieldsColor,
                borderNone: true,
                radius: 25,
                hintText: 'Company name',
                validate: (str) {
                  if (str!.isEmpty) {
                    return 'company name required';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: height * 0.02,
              ),
              state is GetAddressLoadingState
                  ? const LinearProgressIndicator()
                  : DefaultCscPicker(
                      currentCountry: cubit.countryValue,
                      currentCity: cubit.cityValue,
                      currentState: cubit.stateValue,
                      onCityChanged: (val) {
                        cubit.changeCityValue(val ?? 'City');
                      },
                      onCountryChanged: (val) {
                        cubit.changeCountryValue(val);
                      },
                      onStateChanged: (val) {
                        cubit.changeStateValue(val ?? "State");
                      },
                    ),
              SizedBox(
                height: height * 0.02,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: DefaultFormField(
                      controller: _address,
                      context: context,
                      filled: true,
                      fillColor: AppColors.defaultFieldsColor,
                      borderNone: true,
                      radius: 25,
                      hintText: 'Address',
                      onchanged: (val) {
                        cubit.changedAddressField(val);
                      },
                      validate: (str) {
                        if (str == null) {
                          return 'Address Required';
                        }
                        if (str.isEmpty) {
                          return 'Address Required';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    width: width * 0.05,
                  ),
                  Expanded(
                    child: DefaultFormField(
                      controller: _apartment,
                      context: context,
                      type: TextInputType.number,
                      filled: true,
                      fillColor: AppColors.defaultFieldsColor,
                      borderNone: true,
                      radius: 25,
                      hintText: 'Apart no',
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.02,
              ),
              cubit.addReqMeesage
                  ? Text(
                      'please fill full Loaction',
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: const Color.fromARGB(255, 195, 50, 40),
                          ),
                    )
                  : const SizedBox(),
              state is GetAddressLoadingState
                  ? const LinearProgressIndicator()
                  : state is GetAddressErrorState
                      ? TextButton(
                          child: Text(
                            '${state.err}, Tap to Retry',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {
                            cubit.getLocation();
                          },
                        )
                      : TextButton(
                          onPressed: () {
                            cubit.getLocation();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'use current address',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                        color: AppColors.defaultColor,
                                        fontWeight: FontWeight.bold),
                              ),
                              const Icon(
                                Icons.location_on_outlined,
                                color: Colors.green,
                              ),
                            ],
                          ),
                        ),
              SizedBox(
                height: height * 0.01,
              ),
              DefaultFormField(
                controller: _postalCode,
                context: context,
                type: TextInputType.number,
                filled: true,
                fillColor: AppColors.defaultFieldsColor,
                borderNone: true,
                radius: 25,
                hintText: 'postal code',
              ),
            ],
          );
        });
  }
}
