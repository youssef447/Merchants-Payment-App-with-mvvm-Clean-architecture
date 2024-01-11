class Merchant {
  late String email;
  late String firstName;
  late String lastName;
  late Map<String,dynamic> phone;
  String? profileIimageUrl;
  late String address;



  Merchant({
    required this. email,
    required this.firstName,
    required this. lastName,
    required this.phone,
    required this. address,
    this. profileIimageUrl,
  }) ;
 
}
