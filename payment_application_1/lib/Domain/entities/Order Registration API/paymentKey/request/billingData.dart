class BillingData {
  String? apartment,
      floor,
      street,
      building,
      shippingMethod,
      postalCode,
      city,
      country,
      state;

  String email, firstName, lastName, phoneNumber;
  BillingData({
    this.apartment,
    required this.email,
    this.floor,
    required this.firstName,
    this.street,
    this.building,
    required this.phoneNumber,
    this.shippingMethod,
    this.postalCode,
    this.city,
    this.country,
    required this.lastName,
    required this.state,
  });
}
