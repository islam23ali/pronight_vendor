
import 'notification_model.dart.dart';

class OneNotificationModel {
  OneNotification? data;
  String? message;
  int? code;

  OneNotificationModel({
    this.data,
    this.message,
    this.code,
  });

  factory OneNotificationModel.fromJson(Map<String, dynamic> json) => OneNotificationModel(
    data: json["data"] == null ? null : OneNotification.fromJson(json["data"]),
    message: json["message"],
    code: json["code"],
  );

  Map<String, dynamic> toJson() => {
    "data": data?.toJson(),
    "message": message,
    "code": code,
  };
}
