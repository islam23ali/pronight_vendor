
class SectorsModel {
  List<OneSector>? data;
  String? message;
  int? code;

  SectorsModel({
    this.data,
    this.message,
    this.code,
  });

  factory SectorsModel.fromJson(Map<String, dynamic> json) => SectorsModel(
    data: json["data"] == null ? [] : List<OneSector>.from(json["data"]!.map((x) => OneSector.fromJson(x))),
    message: json["message"],
    code: json["code"],
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "message": message,
    "code": code,
  };
}

class OneSector {
  int? id;
  String? name;

  OneSector({
    this.id,
    this.name,
  });

  factory OneSector.fromJson(Map<String, dynamic> json) => OneSector(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
