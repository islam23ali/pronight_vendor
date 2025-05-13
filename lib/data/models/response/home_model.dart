
import 'package:pronight_vendor/data/models/response/all_reservation_model.dart';

class HomeModel {
  Data? data;
  String? message;
  int? code;

  HomeModel({
    this.data,
    this.message,
    this.code,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
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
  int? unitsCount;
  int? reservationsCount;
  int? visitPermitCount;
  int? contractsCount;
  List<OneReservation>? reservations;

  Data({
    this.unitsCount,
    this.reservationsCount,
    this.visitPermitCount,
    this.contractsCount,
    this.reservations,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    unitsCount: json["units_count"],
    reservationsCount: json["reservations_count"],
    visitPermitCount: json["visit_permit_count"],
    contractsCount: json["contracts_count"],
    reservations: json["reservations"] == null ? [] : List<OneReservation>.from(json["reservations"]!.map((x) => OneReservation.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "units_count": unitsCount,
    "reservations_count": reservationsCount,
    "visit_permit_count": visitPermitCount,
    "contracts_count": contractsCount,
    "reservations": reservations == null ? [] : List<dynamic>.from(reservations!.map((x) => x.toJson())),
  };
}

