
import 'all_reservation_model.dart';

class ReservationDetailsModel {
  OneReservation? data;
  String? message;
  int? code;

  ReservationDetailsModel({
    this.data,
    this.message,
    this.code,
  });

  factory ReservationDetailsModel.fromJson(Map<String, dynamic> json) => ReservationDetailsModel(
    data: json["data"] == null ? null : OneReservation.fromJson(json["data"]),
    message: json["message"],
    code: json["code"],
  );

  Map<String, dynamic> toJson() => {
    "data": data?.toJson(),
    "message": message,
    "code": code,
  };
}

