
class OneVisitPermitModel {
  Data? data;
  String? message;
  int? code;

  OneVisitPermitModel({
    this.data,
    this.message,
    this.code,
  });

  factory OneVisitPermitModel.fromJson(Map<String, dynamic> json) => OneVisitPermitModel(
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
  String? slug;
  Sector? sector;
  Beach? villa;
  Beach? beach;
  String? visitDate;
  int? daysCount;
  String? status;
  String? driverName;
  Provider? provider;
  List<Visitor>? visitors;
  List<dynamic>? materials;
  String? createdAt;

  Data({
    this.id,
    this.slug,
    this.sector,
    this.villa,
    this.beach,
    this.visitDate,
    this.daysCount,
    this.status,
    this.driverName,
    this.provider,
    this.visitors,
    this.materials,
    this.createdAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    slug: json["slug"],
    sector: json["sector"] == null ? null : Sector.fromJson(json["sector"]),
    villa: json["villa"] == null ? null : Beach.fromJson(json["villa"]),
    beach: json["beach"] == null ? null : Beach.fromJson(json["beach"]),
    visitDate: json["visit_date"],
    daysCount: json["days_count"],
    status: json["status"],
    driverName: json["driver_name"],
    provider: json["provider"] == null ? null : Provider.fromJson(json["provider"]),
    visitors: json["visitors"] == null ? [] : List<Visitor>.from(json["visitors"]!.map((x) => Visitor.fromJson(x))),
    materials: json["materials"] == null ? [] : List<dynamic>.from(json["materials"]!.map((x) => x)),
    createdAt: json["created_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "slug": slug,
    "sector": sector?.toJson(),
    "villa": villa?.toJson(),
    "beach": beach?.toJson(),
    "visit_date": visitDate,
    "days_count": daysCount,
    "status": status,
    "driver_name": driverName,
    "provider": provider?.toJson(),
    "visitors": visitors == null ? [] : List<dynamic>.from(visitors!.map((x) => x.toJson())),
    "materials": materials == null ? [] : List<dynamic>.from(materials!.map((x) => x)),
    "created_at": createdAt,
  };
}

class Beach {
  int? id;
  String? name;
  Sector? sector;

  Beach({
    this.id,
    this.name,
    this.sector,
  });

  factory Beach.fromJson(Map<String, dynamic> json) => Beach(
    id: json["id"],
    name: json["name"],
    sector: json["sector"] == null ? null : Sector.fromJson(json["sector"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "sector": sector?.toJson(),
  };
}

class Sector {
  int? id;
  String? name;

  Sector({
    this.id,
    this.name,
  });

  factory Sector.fromJson(Map<String, dynamic> json) => Sector(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}

class Provider {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? phoneCode;
  String? image;
  dynamic token;

  Provider({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.phoneCode,
    this.image,
    this.token,
  });

  factory Provider.fromJson(Map<String, dynamic> json) => Provider(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
    phoneCode: json["phone_code"],
    image: json["image"],
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "phone": phone,
    "phone_code": phoneCode,
    "image": image,
    "token": token,
  };
}

class Visitor {
  int? id;
  String? name;
  String? idNo;
  dynamic phoneCode;
  String? phone;

  Visitor({
    this.id,
    this.name,
    this.idNo,
    this.phoneCode,
    this.phone,
  });

  factory Visitor.fromJson(Map<String, dynamic> json) => Visitor(
    id: json["id"],
    name: json["name"],
    idNo: json["id_no"],
    phoneCode: json["phone_code"],
    phone: json["phone"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "id_no": idNo,
    "phone_code": phoneCode,
    "phone": phone,
  };
}
