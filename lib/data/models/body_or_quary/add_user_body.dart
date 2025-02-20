class AppUserBody {
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
  String? deviceNumber;


  AppUserBody({
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

  });


  Map<String, dynamic> toJson() => {
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
  };
}
