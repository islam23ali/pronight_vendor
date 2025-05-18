
class NotificationModel {
  List<OneNotification>? data;
  String? message;
  int? code;

  NotificationModel({
    this.data,
    this.message,
    this.code,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) => NotificationModel(
    data: json["data"] == null ? [] : List<OneNotification>.from(json["data"]!.map((x) => OneNotification.fromJson(x))),
    message: json["message"],
    code: json["code"],
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "message": message,
    "code": code,
  };
}

class OneNotification {
  int? id;
  String? title;
  String? body;
  String? action;
  bool? isRead;
  int? providerId;
  Provider? provider;
  int? userId;
  User? user;
  String? senderType;
  String? receiverType;
  int? operationId;
  DateTime? date;
  String? time;
  String? createdAt;

  OneNotification({
    this.id,
    this.title,
    this.body,
    this.action,
    this.isRead,
    this.providerId,
    this.provider,
    this.userId,
    this.user,
    this.senderType,
    this.receiverType,
    this.operationId,
    this.date,
    this.time,
    this.createdAt,
  });

  factory OneNotification.fromJson(Map<String, dynamic> json) => OneNotification(
    id: json["id"],
    title: json["title"],
    body: json["body"],
    action: json["action"],
    isRead: json["is_read"],
    providerId: json["provider_id"],
    provider: json["provider"] == null ? null : Provider.fromJson(json["provider"]),
    userId: json["user_id"],
    user: json["user"] == null ? null : User.fromJson(json["user"]),
    senderType: json["sender_type"],
    receiverType: json["receiver_type"],
    operationId: json["operation_id"],
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
    time: json["time"],
    createdAt: json["created_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "body": body,
    "action": action,
    "is_read": isRead,
    "provider_id": providerId,
    "provider": provider?.toJson(),
    "user_id": userId,
    "user": user?.toJson(),
    "sender_type": senderType,
    "receiver_type": receiverType,
    "operation_id": operationId,
    "date": "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
    "time": time,
    "created_at": createdAt,
  };
}

class Provider {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? phoneCode;
  String? image;
  dynamic token;

  Provider({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.phoneCode,
    this.image,
    this.token,
  });

  factory Provider.fromJson(Map<String, dynamic> json) => Provider(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
    phoneCode: json["phone_code"],
    image: json["image"],
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "phone": phone,
    "phone_code": phoneCode,
    "image": image,
    "token": token,
  };
}

class User {
  Provider? user;

  User({
    this.user,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    user: json["user"] == null ? null : Provider.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "user": user?.toJson(),
  };
}
