import '../../../../Domain/entities/Order Registration API/paymentKey/request/billingData.dart';

class BillingDataModel extends BillingData {
  BillingDataModel({
    super.apartment,
    required super.email,
    super.floor,
    required super.firstName,
    super.street,
    super.building,
    required super.phoneNumber,
    super.shippingMethod,
    super.postalCode,
    super.city,
    super.country,
    required super.lastName,
    super.state,
  });

  factory BillingDataModel.fromJson(Map<String, dynamic> json) =>
      BillingDataModel(
        email: json['email'],
        firstName: json['firstName'],
        phoneNumber: json['phoneNumber'],
        lastName: json['lastName'],
        apartment: json['apartment'],
        building: json['building'],
        city: json['city'],
        country: json['country'],
        floor: json['floor'],
        postalCode: json['postalCode'],
        shippingMethod: json['shippingMethod'],
        street: json['street'],
        state: json['state'],
      );

   
  Map<String, dynamic> toJson() => {
        "apartment": apartment??'NA',
        "email": email,
        "floor": floor??'NA',
        "first_name": firstName,
        "street": street??'NA',
        "building": building??'NA',
        "phone_number": phoneNumber,
        "shipping_method": shippingMethod??'NA',
        "postal_code": postalCode??'NA',
        "city": city??'NA',
        "country": country??'NA',
        "last_name": lastName,
        "state": state??'NA',
      };   
}
