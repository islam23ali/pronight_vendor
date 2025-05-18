
import 'package:pronight_vendor/data/models/response/sectors_model.dart';
import 'package:pronight_vendor/data/models/response/sub_models/add_car_model.dart';
import 'package:pronight_vendor/data/models/response/sub_models/add_escort_model.dart';
import 'package:pronight_vendor/data/models/response/villas_model.dart';

class OneContractModel {
  Data? data;
  String? message;
  int? code;

  OneContractModel({
    this.data,
    this.message,
    this.code,
  });

  factory OneContractModel.fromJson(Map<String, dynamic> json) => OneContractModel(
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
  OneSector? sector;
  OneVilla? villa;
  OneVilla? beach;
  Provider? provider;
  int? rentValue;
  String? note;
  int? insuranceValue;
  int? price;
  double? taxValue;
  double? total;
  Tenant? tenant;
  String? startDate;
  String? endDate;
  bool? isPaid;
  bool? isConfirmed;
  String? confirmCode;
  String? createdAt;
  String? updatedAt;
  // List<Escort>? escorts;
  List<AddEscort>? escorts;
  List<Car>? cars;

  Data({
    this.id,
    this.slug,
    this.sector,
    this.villa,
    this.beach,
    this.provider,
    this.rentValue,
    this.insuranceValue,
    this.price,
    this.taxValue,
    this.note,
    this.total,
    this.tenant,
    this.startDate,
    this.endDate,
    this.isPaid,
    this.isConfirmed,
    this.confirmCode,
    this.createdAt,
    this.updatedAt,
    this.escorts,
    this.cars,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    slug: json["slug"],
    sector: json["sector"] == null ? null : OneSector.fromJson(json["sector"]),
    villa: json["villa"] == null ? null : OneVilla.fromJson(json["villa"]),
    beach: json["beach"] == null ? null : OneVilla.fromJson(json["beach"]),
    provider: json["provider"] == null ? null : Provider.fromJson(json["provider"]),
    rentValue: json["rent_value"],
    note: json["note"],
    insuranceValue: json["insurance_value"],
    price: json["price"],
    taxValue: json["tax_value"]?.toDouble(),
    total: json["total"]?.toDouble(),
    tenant: json["tenant"] == null ? null : Tenant.fromJson(json["tenant"]),
    startDate: json["start_date"],
    endDate: json["end_date"],
    isPaid: json["is_paid"],
    isConfirmed: json["is_confirmed"],
    confirmCode: json["confirm_code"],
    createdAt: json["created_at"] ,
    updatedAt: json["updated_at"],
    // escorts: json["escorts"] == null ? [] : List<Escort>.from(json["escorts"]!.map((x) => Escort.fromJson(x))),
    escorts: json["escorts"] == null ? [] : List<AddEscort>.from(json["escorts"]!.map((x) => AddEscort.fromJson(x))),
    cars: json["cars"] == null ? [] : List<Car>.from(json["cars"]!.map((x) => Car.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "slug": slug,
    "sector": sector?.toJson(),
    "villa": villa?.toJson(),
    "beach": beach?.toJson(),
    "provider": provider?.toJson(),
    "rent_value": rentValue,
    "note": note,
    "insurance_value": insuranceValue,
    "price": price,
    "tax_value": taxValue,
    "total": total,
    "tenant": tenant?.toJson(),
    "start_date": startDate,
    "end_date": endDate,
    "is_paid": isPaid,
    "is_confirmed": isConfirmed,
    "confirm_code": confirmCode,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "escorts": escorts == null ? [] : List<dynamic>.from(escorts!.map((x) => x.toJson())),
    "cars": cars == null ? [] : List<dynamic>.from(cars!.map((x) => x.toJson())),
  };
}

// class Beach {
//   int? id;
//   String? name;
//   OneSector? sector;
//
//   Beach({
//     this.id,
//     this.name,
//     this.sector,
//   });
//
//   factory Beach.fromJson(Map<String, dynamic> json) => Beach(
//     id: json["id"],
//     name: json["name"],
//     sector: json["sector"] == null ? null : OneSector.fromJson(json["sector"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "name": name,
//     "sector": sector?.toJson(),
//   };
// }


// class Car {
//   int? id;
//   int? contractId;
//   String? type;
//   String? plateNo;
//   dynamic driverName;
//   dynamic driverIdNo;
//   String? createdAt;
//   String? updatedAt;
//
//   Car({
//     this.id,
//     this.contractId,
//     this.type,
//     this.plateNo,
//     this.driverName,
//     this.driverIdNo,
//     this.createdAt,
//     this.updatedAt,
//   });
//
//   factory Car.fromJson(Map<String, dynamic> json) => Car(
//     id: json["id"],
//     contractId: json["contract_id"],
//     type: json["type"],
//     plateNo: json["plate_no"],
//     driverName: json["driver_name"],
//     driverIdNo: json["driver_id_no"],
//     createdAt: json["created_at"],
//     updatedAt: json["updated_at"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "contract_id": contractId,
//     "type": type,
//     "plate_no": plateNo,
//     "driver_name": driverName,
//     "driver_id_no": driverIdNo,
//     "created_at": createdAt,
//     "updated_at": updatedAt,
//   };
// }

// class Escort {
//   int? id;
//   int? contractId;
//   String? name;
//   String? idNo;
//   String? nationality;
//   String? kinship;
//   String? createdAt;
//   String? updatedAt;
//
//   Escort({
//     this.id,
//     this.contractId,
//     this.name,
//     this.idNo,
//     this.nationality,
//     this.kinship,
//     this.createdAt,
//     this.updatedAt,
//   });
//
//   factory Escort.fromJson(Map<String, dynamic> json) => Escort(
//     id: json["id"],
//     contractId: json["contract_id"],
//     name: json["name"],
//     idNo: json["id_no"],
//     nationality: json["nationality"],
//     kinship: json["kinship"],
//     createdAt: json["created_at"],
//     updatedAt: json["updated_at"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "contract_id": contractId,
//     "name": name,
//     "id_no": idNo,
//     "nationality": nationality,
//     "kinship": kinship,
//     "created_at": createdAt,
//     "updated_at": updatedAt,
//   };
// }

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

class Tenant {
  String? name;
  String? phone;
  String? phoneCode;
  String? idNo;
  String? nationality;

  Tenant({
    this.name,
    this.phone,
    this.phoneCode,
    this.idNo,
    this.nationality,
  });

  factory Tenant.fromJson(Map<String, dynamic> json) => Tenant(
    name: json["name"],
    phone: json["phone"],
    phoneCode: json["phone_code"],
    idNo: json["id_no"],
    nationality: json["nationality"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "phone": phone,
    "phone_code": phoneCode,
    "id_no": idNo,
    "nationality": nationality,
  };
}
