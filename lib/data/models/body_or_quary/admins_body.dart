class AdminBody {
  String? name;
  String? userName;
  String? phone;
  String? password;
  int? cityId;
  int? areaId;
  int? jopNatureId;
  int? positionId;
  String? deviceNumber;
  int? active;
  String? roleId;
  String? roleOn;



  AdminBody({
    this.name,
    this.userName,
    this.password,
    this.phone,
    this.cityId,
    this.areaId,
    this.jopNatureId,
    this.positionId,
    this.deviceNumber,
    this.active,
    this.roleId,
    this.roleOn,

  });


  Map<String, dynamic> toJson() => {
    "name": name,
    "user_name": userName,
    "password": password,
    "phone": phone,
    if(cityId != null) "city_id": cityId,
    if(areaId != null) "area_id": areaId,
    "jop_nature_id": jopNatureId,
    "position_id": positionId,
    "device_number": deviceNumber,
    "active": active,
    "role_on": roleOn,
    "role_id": roleId,
  };
}
