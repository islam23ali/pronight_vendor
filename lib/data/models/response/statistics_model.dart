
class StatisticsModel {
  Data? data;
  String? message;
  int? code;

  StatisticsModel({
    this.data,
    this.message,
    this.code,
  });

  factory StatisticsModel.fromJson(Map<String, dynamic> json) => StatisticsModel(
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
  List<int>? unitsData;
  int? unitsCount;
  num? unitsPercent;
  int? contractsCount;
  num? contractsPercent;

  Data({
    this.unitsData,
    this.unitsCount,
    this.unitsPercent,
    this.contractsCount,
    this.contractsPercent,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    unitsData: json["units_data"] == null ? [] : List<int>.from(json["units_data"]!.map((x) => x)),
    unitsCount: json["units_count"],
    unitsPercent: json["units_percent"]?.toDouble(),
    contractsCount: json["contracts_count"],
    contractsPercent: json["contracts_percent"],
  );

  Map<String, dynamic> toJson() => {
    "units_data": unitsData == null ? [] : List<dynamic>.from(unitsData!.map((x) => x)),
    "units_count": unitsCount,
    "units_percent": unitsPercent,
    "contracts_count": contractsCount,
    "contracts_percent": contractsPercent,
  };
}
