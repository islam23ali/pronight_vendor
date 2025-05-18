
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
  String? lastUnitsAdded;
  int? reservationsCount;
  String? lastReservationsAdded;
  int? visitPermitCount;
  int? contractsCount;
  String? lastContractAdded;
  String? lastVisitPermitAdded;
  List<OneReservation>? reservations;

  Data({
    this.unitsCount,
    this.lastUnitsAdded,
    this.reservationsCount,
    this.lastReservationsAdded,
    this.visitPermitCount,
    this.contractsCount,
    this.lastContractAdded,
    this.lastVisitPermitAdded,
    this.reservations,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    unitsCount: json["units_count"],
    lastUnitsAdded:json["last_units_added"],
    reservationsCount: json["reservations_count"],
    lastReservationsAdded:json["last_reservations_added"],
    visitPermitCount: json["visit_permit_count"],
    contractsCount: json["contracts_count"],
    lastContractAdded: json["last_contract_added"],
    lastVisitPermitAdded: json["last_visit_permit_added"],
    reservations: json["reservations"] == null ? [] : List<OneReservation>.from(json["reservations"]!.map((x) => OneReservation.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "units_count": unitsCount,
    "last_units_added": lastUnitsAdded,
    "reservations_count": reservationsCount,
    "last_reservations_added": lastReservationsAdded,
    "visit_permit_count": visitPermitCount,
    "contracts_count": contractsCount,
    "last_contract_added": lastContractAdded,
    "last_visit_permit_added": lastVisitPermitAdded,
    "reservations": reservations == null ? [] : List<dynamic>.from(reservations!.map((x) => x.toJson())),
  };
}

