import 'user.dart';

class Profile {
  int? id;
  User? user;
  DateTime? createdAt;
  bool? active;
  String? profileType;
  List<String>? phones;
  List<String>? companyEmails;
  String? companyName;
  String? state;
  String? country;
  String? city;
  String? postalCode;
  String? street;
  bool? emailNotification;

  String? sector;
  bool? is2FaEnabled;
  int? activationMethod;
  int? signedUpThrough;
  int? failedAttempts;
  List<dynamic>? customExportColumns;
  List<dynamic>? serverIp;
  dynamic username;
  String? primaryPhoneNumber;
  bool? primaryPhoneVerified;
  bool? isTempPassword;
  dynamic otp2FaSentAt;
  dynamic otp2FaAttempt;
  DateTime? otpSentAt;
  String? otpSentTo;
  DateTime? otpValidatedAt;
  dynamic awbBanner;
  dynamic emailBanner;
  dynamic identificationNumber;
  String? deliveryStatusCallback;
  dynamic merchantExternalLink;
  int? merchantStatus;
  bool? deactivatedByBank;
  dynamic bankDeactivationReason;
  int? bankMerchantStatus;
  dynamic nationalId;

  dynamic address;
  dynamic commercialRegistration;
  dynamic commercialRegistrationArea;
  dynamic distributorCode;
  dynamic distributorBranchCode;
  bool? allowTerminalOrderId;
  bool? allowEncryptionBypass;
  dynamic walletPhoneNumber;

  dynamic dom;
  dynamic bankRelated;
  List<dynamic>? permissions;

  Profile({
    this.id,
    this.user,
    this.createdAt,
    this.active,
    this.profileType,
    this.phones,
    this.companyEmails,
    this.companyName,
    this.state,
    this.country,
    this.city,
    this.postalCode,
    this.street,
    this.emailNotification,
    this.sector,
    this.is2FaEnabled,
    this.activationMethod,
    this.signedUpThrough,
    this.failedAttempts,
    this.customExportColumns,
    this.serverIp,
    this.username,
    this.primaryPhoneNumber,
    this.primaryPhoneVerified,
    this.isTempPassword,
    this.otp2FaSentAt,
    this.otp2FaAttempt,
    this.otpSentAt,
    this.otpSentTo,
    this.otpValidatedAt,
    this.awbBanner,
    this.emailBanner,
    this.identificationNumber,
    this.deliveryStatusCallback,
    this.merchantExternalLink,
    this.merchantStatus,
    this.deactivatedByBank,
    this.bankDeactivationReason,
    this.bankMerchantStatus,
    this.nationalId,
    this.address,
    this.commercialRegistration,
    this.commercialRegistrationArea,
    this.distributorCode,
    this.distributorBranchCode,
    this.allowTerminalOrderId,
    this.allowEncryptionBypass,
    this.walletPhoneNumber,
    this.permissions,
  });

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        id: json["id"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        active: json["active"],
        profileType: json["profile_type"],
        phones: json["phones"] == null
            ? []
            : List<String>.from(json["phones"]!.map((x) => x)),
        companyEmails: json["company_emails"] == null
            ? []
            : List<String>.from(json["company_emails"]!.map((x) => x)),
        companyName: json["company_name"],
        state: json["state"],
        country: json["country"],
        city: json["city"],
        postalCode: json["postal_code"],
        street: json["street"],
        emailNotification: json["email_notification"],
        sector: json["sector"],
        is2FaEnabled: json["is_2fa_enabled"],
        activationMethod: json["activation_method"],
        signedUpThrough: json["signed_up_through"],
        failedAttempts: json["failed_attempts"],
        customExportColumns: json["custom_export_columns"] == null
            ? []
            : List<dynamic>.from(json["custom_export_columns"]!.map((x) => x)),
        serverIp: json["server_IP"] == null
            ? []
            : List<dynamic>.from(json["server_IP"]!.map((x) => x)),
        username: json["username"],
        primaryPhoneNumber: json["primary_phone_number"],
        primaryPhoneVerified: json["primary_phone_verified"],
        isTempPassword: json["is_temp_password"],
        otp2FaSentAt: json["otp_2fa_sent_at"],
        otp2FaAttempt: json["otp_2fa_attempt"],
        otpSentAt: json["otp_sent_at"] == null
            ? null
            : DateTime.parse(json["otp_sent_at"]),
        otpSentTo: json["otp_sent_to"],
        otpValidatedAt: json["otp_validated_at"] == null
            ? null
            : DateTime.parse(json["otp_validated_at"]),
        awbBanner: json["awb_banner"],
        emailBanner: json["email_banner"],
        identificationNumber: json["identification_number"],
        deliveryStatusCallback: json["delivery_status_callback"],
        merchantExternalLink: json["merchant_external_link"],
        merchantStatus: json["merchant_status"],
        deactivatedByBank: json["deactivated_by_bank"],
        bankDeactivationReason: json["bank_deactivation_reason"],
        bankMerchantStatus: json["bank_merchant_status"],
        nationalId: json["national_id"],
        address: json["address"],
        commercialRegistration: json["commercial_registration"],
        commercialRegistrationArea: json["commercial_registration_area"],
        distributorCode: json["distributor_code"],
        distributorBranchCode: json["distributor_branch_code"],
        allowTerminalOrderId: json["allow_terminal_order_id"],
        allowEncryptionBypass: json["allow_encryption_bypass"],
        walletPhoneNumber: json["wallet_phone_number"],
        permissions: json["permissions"] == null
            ? []
            : List<dynamic>.from(json["permissions"]!.map((x) => x)),
      );
}
