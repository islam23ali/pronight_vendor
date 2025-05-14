class NotificationModel {
  String? message;
  int? code;
  List<OneNotification>? data;
  int? currentPage;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  String? nextPageUrl;
  String? path;
  int? perPage;
  String? prevPageUrl;
  int? to;
  int? total;

  NotificationModel({
    this.message,
    this.code,
    this.data,
    this.currentPage,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) => NotificationModel(
    message: json["message"],
    code: json["code"],
    data: json["data"] == null ? [] : List<OneNotification>.from(json["data"]!.map((x) => OneNotification.fromJson(x))),
    currentPage: json["current_page"],
    firstPageUrl: json["first_page_url"],
    from: json["from"],
    lastPage: json["last_page"],
    lastPageUrl: json["last_page_url"],
    nextPageUrl: json["next_page_url"],
    path: json["path"],
    perPage: json["per_page"],
    prevPageUrl: json["prev_page_url"],
    to: json["to"],
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "code": code,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "current_page": currentPage,
    "first_page_url": firstPageUrl,
    "from": from,
    "last_page": lastPage,
    "last_page_url": lastPageUrl,
    "next_page_url": nextPageUrl,
    "path": path,
    "per_page": perPage,
    "prev_page_url": prevPageUrl,
    "to": to,
    "total": total,
  };
}

class OneNotification {
  String? id;
  String? fromUser;
  String? fromUserImage;
  String? toUser;
  String? title;
  String? message;
  bool? isRead;
  String? action;
  int? operationId;
  String? firebaseResponse;
  String? createdAt;

  OneNotification({
    this.id,
    this.fromUser,
    this.fromUserImage,
    this.toUser,
    this.title,
    this.message,
    this.isRead,
    this.action,
    this.operationId,
    this.firebaseResponse,
    this.createdAt,
  });

  factory OneNotification.fromJson(Map<String, dynamic> json) => OneNotification(
    id: json["id"],
    fromUser: json["from_user"],
    fromUserImage: json["from_user_image"],
    toUser: json["to_user"],
    title: json["title"],
    message: json["message"],
    isRead: json["is_read"],
    action: json["action"],
    operationId: json["operation_id"],
    firebaseResponse: json["firebase_response"],
    createdAt: json["created_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "from_user": fromUser,
    "from_user_image": fromUserImage,
    "to_user": toUser,
    "title": title,
    "message": message,
    "is_read": isRead,
    "action": action,
    "operation_id": operationId,
    "firebase_response": firebaseResponse,
    "created_at": createdAt,
  };
}
