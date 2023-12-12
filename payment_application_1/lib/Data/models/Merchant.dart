class Merchant {
  late String _email;
  late String _firstName;
  late String _lastName;
  late String _phone;
  late String _token;
  String? _profileIimageUrl;

  String get email => _email;
  String get token => _token;

  String get firstName => _firstName;
  String get lastName => _lastName;

  String get phone => _phone;

  String? get profileIimageUrl => _profileIimageUrl;

  Merchant({
    required String email,
    required String firstName,
    required String lastName,
    required String phone,
    required String token,
    String? profileIimageUrl,
  }) {
    _email = email;
    _firstName = firstName;
    _lastName = lastName;
    _token = token;
    _phone = phone;
    _profileIimageUrl = profileIimageUrl;
  }
  Merchant.fromJson(Map<String, dynamic> json) {
    _email = json['email'];
    _firstName = json['firstName'];
    _lastName = json['lastName'];
    _phone = json['phone'];
    _token = json['token'];
    _profileIimageUrl = json['profile image url'];
  }
  Map<String, dynamic> toJson() {
    return {
      'firstName': _firstName,
      'lastName': lastName,
      'email': _email,
      'phone': _phone,
      'token': _token,
      'profile image url': _profileIimageUrl,
    };
  }
}
