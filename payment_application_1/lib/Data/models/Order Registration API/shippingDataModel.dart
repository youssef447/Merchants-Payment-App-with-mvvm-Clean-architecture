
import '../../../Domain/entities/Order Registration API/shippingData.dart';

class ShippingDataModel extends ShippingData{

  ShippingDataModel({
    required super.phoneNumber,
    required super.email,
    required super.firstName,
    required super.lastName,
    required super.apartment,
    required super.country,
    required super.city,
     required super.postalCode,
    required super.street,
  });
  factory ShippingDataModel.fromJson(Map<String, dynamic> map) => ShippingDataModel(
        phoneNumber: map['phone_number'],
        email: map['email'],
        firstName: map['first_name'],
        lastName: map['last_name'],
        country: map['country'],
        city: map['city'],
        apartment: map['apartment'],
        postalCode: map['postal_code'],
        street: map['street'],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "postal_code": postalCode,
        "city": city,
        "street": street,
        "phone_number": phoneNumber,
        "first_name": firstName,
        "last_name": lastName,
        "country": country,
        'apartment': apartment ?? '',
      };
}
