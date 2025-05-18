
class SettingsModel {
  Data? data;
  String? message;
  int? code;

  SettingsModel({
    this.data,
    this.message,
    this.code,
  });

  factory SettingsModel.fromJson(Map<String, dynamic> json) => SettingsModel(
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
    message: json["message"],
    code: json["code"],
  );

  Map<String, dynamic> toJson() => {
    "data": data?.toJson(),
    "message": message,
    "code": code,
  };
}

class Data {
  int? id;
  String? name;
  String? address;
  String? email;
  String? phone;
  String? whatsapp;
  String? googlePlayUrl;
  String? appleUrl;
  String? privacy;
  String? termsConditions;
  String? aboutApp;
  String? privacyLink;
  String? aboutLink;
  String? logo;

  Data({
    this.id,
    this.name,
    this.address,
    this.email,
    this.phone,
    this.whatsapp,
    this.googlePlayUrl,
    this.appleUrl,
    this.privacy,
    this.termsConditions,
    this.aboutApp,
    this.privacyLink,
    this.aboutLink,
    this.logo,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    name: json["name"],
    address: json["address"],
    email: json["email"],
    phone: json["phone"],
    whatsapp: json["whatsapp"],
    googlePlayUrl: json["google_play_url"],
    appleUrl: json["apple_url"],
    privacy: json["privacy"],
    termsConditions: json["terms_conditions"],
    aboutApp: json["about_app"],
    privacyLink: json["privacy_link"],
    aboutLink: json["about_link"],
    logo: json["logo"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "address": address,
    "email": email,
    "phone": phone,
    "whatsapp": whatsapp,
    "google_play_url": googlePlayUrl,
    "apple_url": appleUrl,
    "privacy": privacy,
    "terms_conditions": termsConditions,
    "about_app": aboutApp,
    "privacy_link": privacyLink,
    "about_link": aboutLink,
    "logo": logo,
  };
}
