
class ContentsModel {
  List<OneConten>? data;
  String? message;
  int? code;

  ContentsModel({
    this.data,
    this.message,
    this.code,
  });

  factory ContentsModel.fromJson(Map<String, dynamic> json) => ContentsModel(
    data: json["data"] == null ? [] : List<OneConten>.from(json["data"]!.map((x) => OneConten.fromJson(x))),
    message: json["message"],
    code: json["code"],
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "message": message,
    "code": code,
  };
}

class OneConten {
  int? id;
  String? title;
  String? image;

  OneConten({
    this.id,
    this.title,
    this.image,
  });

  factory OneConten.fromJson(Map<String, dynamic> json) => OneConten(
    id: json["id"],
    title: json["title"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "image": image,
  };
}
