import 'profile.dart';

class AuthTokenResponse {
    Profile ?profile;
    String token;

    AuthTokenResponse({
        required this.profile,
        required this.token,
    });

    factory AuthTokenResponse.fromJson(Map<String, dynamic> json) => AuthTokenResponse(
        profile: json["profile"] == null ? null : Profile.fromJson(json["profile"]),
        token: json["token"],
    );

}





