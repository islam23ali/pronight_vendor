
class PayContractModel {
  Data? data;
  String? message;
  int? code;

  PayContractModel({
    this.data,
    this.message,
    this.code,
  });

  factory PayContractModel.fromJson(Map<String, dynamic> json) => PayContractModel(
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
  String? paymentUrl;
  String? callBackUrl;
  String? errorUrl;

  Data({
    this.paymentUrl,
    this.callBackUrl,
    this.errorUrl,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    paymentUrl: json["payment_url"],
    callBackUrl: json["CallBackUrl"],
    errorUrl: json["ErrorUrl"],
  );

  Map<String, dynamic> toJson() => {
    "payment_url": paymentUrl,
    "CallBackUrl": callBackUrl,
    "ErrorUrl": errorUrl,
  };
}
