
import 'package:pronight_vendor/data/models/response/sectors_model.dart';

class VillasModel {
  List<OneVilla>? data;
  String? message;
  int? code;

  VillasModel({
    this.data,
    this.message,
    this.code,
  });

  factory VillasModel.fromJson(Map<String, dynamic> json) => VillasModel(
    data: json["data"] == null ? [] : List<OneVilla>.from(json["data"]!.map((x) => OneVilla.fromJson(x))),
    message: json["message"],
    code: json["code"],
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "message": message,
    "code": code,
  };
}

class OneVilla {
  int? id;
  String? name;
  OneSector? sector;

  OneVilla({
    this.id,
    this.name,
    this.sector,
  });

  factory OneVilla.fromJson(Map<String, dynamic> json) => OneVilla(
    id: json["id"],
    name: json["name"],
    sector: json["sector"] == null ? null : OneSector.fromJson(json["sector"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "sector": sector?.toJson(),
  };
}

// class Sector {
//   int? id;
//   String? name;
//
//   Sector({
//     this.id,
//     this.name,
//   });
//
//   factory Sector.fromJson(Map<String, dynamic> json) => Sector(
//     id: json["id"],
//     name: json["name"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "name": name,
//   };
// }
