class UserModel {
  Data? data;
  String? message;
  int? code;

  UserModel({
    this.data,
    this.message,
    this.code,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
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
  String? userName;
  String? shopName;
  String? shopAddress;
  String? nationalId;
  String? address;
  String? phone;
  int? cityId;
  int? areaId;
  int? active;
  int? deviceNumber;
  dynamic emailVerifiedAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? token;

  Data({
    this.id,
    this.name,
    this.userName,
    this.shopName,
    this.shopAddress,
    this.nationalId,
    this.address,
    this.phone,
    this.cityId,
    this.areaId,
    this.active,
    this.deviceNumber,
    this.emailVerifiedAt,
    this.createdAt,
    this.updatedAt,
    this.token,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    name: json["name"],
    userName: json["user_name"],
    shopName: json["shop_name"],
    shopAddress: json["shop_address"],
    nationalId: json["national_id"],
    address: json["address"],
    phone: json["phone"],
    cityId: json["city_id"],
    areaId: json["area_id"],
    active: json["active"],
    deviceNumber: json["device_number"],
    emailVerifiedAt: json["email_verified_at"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "user_name": userName,
    "shop_name": shopName,
    "shop_address": shopAddress,
    "national_id": nationalId,
    "address": address,
    "phone": phone,
    "city_id": cityId,
    "area_id": areaId,
    "active": active,
    "device_number": deviceNumber,
    "email_verified_at": emailVerifiedAt,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "token": token,
  };
}
