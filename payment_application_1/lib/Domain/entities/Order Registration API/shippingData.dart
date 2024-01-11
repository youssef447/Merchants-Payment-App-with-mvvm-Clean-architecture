class ShippingData {
  String phoneNumber;
  String email;
  String firstName;
  String lastName;

  String? apartment;
  String country;
  String city;
  String ?postalCode;
  String street;

  ShippingData({
    required this.phoneNumber,
    required this.email,
    required this.firstName,
    required this.lastName,
    this.apartment,
    required this.country,
    required this.city,
     this.postalCode,
    required this.street,
  });
  
}
