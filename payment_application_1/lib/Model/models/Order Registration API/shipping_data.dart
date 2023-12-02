class ShippingData {
  int? id;
  String? firstName;
  String? lastName;
  String? street;
  String? building;
  String? floor;
  String? apartment;
  String? city;
  String? state;
  String? country;
  String? email;
  String? phoneNumber;
  String? postalCode;
  String? extraDescription;
  String? shippingMethod;
  int? orderId;

  ShippingData({
    this.id,
    this.firstName,
    this.lastName,
    this.street,
    this.building,
    this.floor,
    this.apartment,
    this.city,
    this.state,
    this.country,
    this.email,
    this.phoneNumber,
    this.postalCode,
    this.extraDescription,
    this.shippingMethod,
    this.orderId,
  });

  factory ShippingData.fromJson(Map<String, dynamic> json) => ShippingData(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        street: json["street"],
        building: json["building"],
        floor: json["floor"],
        apartment: json["apartment"],
        city: json["city"],
        state: json["state"],
        country: json["country"],
        email: json["email"],
        phoneNumber: json["phone_number"],
        postalCode: json["postal_code"],
        extraDescription: json["extra_description"],
        shippingMethod: json["shipping_method"],
        orderId: json["order_id"],
      );

  Map<String, dynamic> toJson() => {
        "apartment": apartment,
        "email": email,
        "floor": floor,
        "first_name": firstName,
        "street": street,
        "building": building,
        "phone_number": phoneNumber,
        "postal_code": postalCode,
        "extra_description": extraDescription,
        "city": city,
        "country": country,
        "last_name": lastName,
        "state": state,
      };
}
