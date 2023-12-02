class User {
  int? id;
  String? username;
  String? firstName;
  String? lastName;
  DateTime? dateJoined;
  String? email;
  bool? isActive;
  bool? isStaff;
  bool? isSuperuser;
  dynamic lastLogin;
  List<dynamic>? groups;
  List<int>? userPermissions;

  User({
    this.id,
    this.username,
    this.firstName,
    this.lastName,
    this.dateJoined,
    this.email,
    this.isActive,
    this.isStaff,
    this.isSuperuser,
    this.lastLogin,
    this.groups,
    this.userPermissions,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['id'],
        username: json['username'],
        firstName: json['firstName'],
        lastName: json['lastName'],
        dateJoined: json['dateJoined'],
        email: json['email'],
        isActive: json['isActive'],
        isStaff: json['isStaff'],
        isSuperuser: json['isSuperuser'],
        lastLogin: json['lastLogin'],
        groups: json['groups'],
        userPermissions: json['userPermissions']);
  }
}
