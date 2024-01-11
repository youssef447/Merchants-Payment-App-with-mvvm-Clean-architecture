import 'package:currency_picker/currency_picker.dart';
import 'package:flutter/material.dart';
import 'package:payment_application_1/Presentation/view-model/NavScreens/addProductCubit.dart';

import '../../core/utils/appColors.dart';
import '../../core/utils/globales.dart';
import '../../core/utils/sharedFunctions.dart';
import 'defaultFormField.dart';

class PriceCurrencyField extends StatelessWidget {
  late final TextEditingController _price;
  final AddProductCubit cubit;

  PriceCurrencyField(
      {super.key, required TextEditingController price, required this.cubit}) {
    _price = price;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
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
            fillColor: AppColors. defaultFieldsColor,
            validate: (str) {
              if (str == null) {
                return "price required";
              }
              if (str.isEmpty) {
                return "price required";
              }
              return null;
            },
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextButton(
                child: Text(cubit.currencyCode,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.bold, color: AppColors. defaultColor)),
                onPressed: () {
                  currencyPicker(
                    context: context,
                    onSelect: (Currency currency) {
                      cubit.selectCurrency(currency.code);
                    },
                  );
                },
              ),
              cubit.currReqMeesage
                  ? Text(
                      'currency required',
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: const Color.fromARGB(255, 195, 50, 40),
                          ),
                    )
                  : const SizedBox()
            ],
          ),
        ),
      ],
    );
  }
}
