
class SendCodeModel {
  dynamic? data;
  String? message;
  int? code;

  SendCodeModel({
    this.data,
    this.message,
    this.code,
  });

  factory SendCodeModel.fromJson(Map<String, dynamic> json) => SendCodeModel(
    data: json["data"],
    message: json["message"],
    code: json["code"],
  );

  Map<String, dynamic> toJson() => {
    "data": data,
    "message": message,
    "code": code,
  };
}
