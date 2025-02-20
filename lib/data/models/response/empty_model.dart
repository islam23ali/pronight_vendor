class EmptyModel {
  Data? data;
  dynamic message;
  int? code;

  EmptyModel({
    this.data,
    this.message,
    this.code,
  });

  factory EmptyModel.fromJson(Map<String, dynamic> json) => EmptyModel(
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
  bool? isSerial;

  Data({
    this.isSerial,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    isSerial: json["is_serial"],
  );

  Map<String, dynamic> toJson() => {
    "is_serial": isSerial,
  };
}
