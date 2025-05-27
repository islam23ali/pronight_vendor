
class ReservationDaysModel {
  List<String>? data;
  String? message;
  int? code;

  ReservationDaysModel({
    this.data,
    this.message,
    this.code,
  });

  factory ReservationDaysModel.fromJson(Map<String, dynamic> json) => ReservationDaysModel(
    data: json["data"] == null ? [] : List<String>.from(json["data"]!.map((x) => x)),
    message: json["message"],
    code: json["code"],
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x)),
    "message": message,
    "code": code,
  };
}
