class BillingData {
  String? apartment;
  String? email;
  String? floor;
  String? firstName;
  String? street;
  String? building;
  String? phoneNumber;
  String? shippingMethod;
  String? postalCode;
  String? city;
  String? country;
  String? lastName;
  String? state;

  BillingData({
    this.apartment,
    this.email,
    this.floor,
    this.firstName,
    this.street,
    this.building,
    this.phoneNumber,
    this.shippingMethod,
    this.postalCode,
    this.city,
    this.country,
    this.lastName,
    this.state,
  });

  Map<String, dynamic> toJson() => {
        "apartment": apartment,
        "email": email,
        "floor": floor,
        "first_name": firstName,
        "street": street,
        "building": building,
        "phone_number": phoneNumber,
        "shipping_method": shippingMethod,
        "postal_code": postalCode,
        "city": city,
        "country": country,
        "last_name": lastName,
        "state": state,
      };
}