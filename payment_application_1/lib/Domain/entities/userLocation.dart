class UserLocation {
  late final double _latitude;
  late final double _longitude;
  double get latitude => _latitude;

  double get longitude => _longitude;

  UserLocation({required double latitude, required double longitude}) {
    _latitude = latitude;
    _longitude = longitude;
  }
}
