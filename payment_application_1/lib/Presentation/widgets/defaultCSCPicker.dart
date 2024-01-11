import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:payment_application_1/core/utils/appColors.dart';


class DefaultCscPicker extends StatelessWidget {
  final String currentCountry;

  final String currentCity;

  final String currentState;
  final Function(String)? onCountryChanged;
  final Function(String?)? onStateChanged;
  final Function(String?)? onCityChanged;
  const DefaultCscPicker({
    super.key,
    required this.currentCountry,
    required this.currentState,
    required this.currentCity,
    this.onCityChanged,
    this.onCountryChanged,
    this.onStateChanged,
  });

  @override
  Widget build(BuildContext context) {
    print('cscccccccc $currentCity $currentCountry $currentState');
    return CSCPicker(
      layout: Layout.horizontal,
      searchBarRadius: 25,
      selectedItemStyle: Theme.of(context).textTheme.titleMedium,
      dropdownItemStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
            fontWeight: FontWeight.bold,
          ),
      dropdownHeadingStyle: Theme.of(context).textTheme.titleLarge,
      disabledDropdownDecoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
        color: AppColors.defaultFieldsColor,
        border: Border.all(
          color: Colors.grey[500]!,
        ),
      ),
      dropdownDecoration: BoxDecoration(
        
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
          
        ),
        color: AppColors.defaultFieldsColor,
        border: Border.all(
          color: Colors.grey[500]!,
        ),
      ),
      currentCity: currentCity,
      currentCountry: currentCountry,
      currentState: currentState,
      flagState: CountryFlag.DISABLE,
      onCountryChanged: onCountryChanged,
      onStateChanged: onStateChanged,
      onCityChanged: onCityChanged,
    );
  }
}
