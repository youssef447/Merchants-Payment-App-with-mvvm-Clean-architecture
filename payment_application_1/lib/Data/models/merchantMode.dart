import '../../Domain/entities/merchant.dart';

class MerchantModel extends Merchant {
  MerchantModel({
    required super.email,
    required super.firstName,
    required super.lastName,
    required super.phone,
    required super.address,
    super.profileIimageUrl,
  });

  factory MerchantModel.fromJson(Map<String, dynamic> json) {
    return MerchantModel(
      email: json['email'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      profileIimageUrl: json['profile_image_url'],
      address: json['address'],
      phone: json['phone'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'profile_image_url': profileIimageUrl,
      'address': address,
      'phone': phone,
    };
  }
}
