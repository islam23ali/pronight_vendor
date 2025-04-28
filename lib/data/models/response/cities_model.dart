
class CitiesModel {
  List<OneCity>? data;
  String? message;
  int? code;

  CitiesModel({
    this.data,
    this.message,
    this.code,
  });

  factory CitiesModel.fromJson(Map<String, dynamic> json) => CitiesModel(
    data: json["data"] == null ? [] : List<OneCity>.from(json["data"]!.map((x) => OneCity.fromJson(x))),
    message: json["message"],
    code: json["code"],
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "message": message,
    "code": code,
  };
}

class Unit {
  int? id;
  int? cityId;
  OneCity? city;
  String? title;
  String? image;
  int? rate;
  int? ratesCount;
  int? oldPrice;
  int? price;
  bool? hasOffer;
  String? offerType;
  int? offerValue;
  bool? isFavorite;
  List<OneCity>? contents;

  Unit({
    this.id,
    this.cityId,
    this.city,
    this.title,
    this.image,
    this.rate,
    this.ratesCount,
    this.oldPrice,
    this.price,
    this.hasOffer,
    this.offerType,
    this.offerValue,
    this.isFavorite,
    this.contents,
  });

  factory Unit.fromJson(Map<String, dynamic> json) => Unit(
    id: json["id"],
    cityId: json["city_id"],
    city: json["city"] == null ? null : OneCity.fromJson(json["city"]),
    title: json["title"],
    image: json["image"],
    rate: json["rate"],
    ratesCount: json["rates_count"],
    oldPrice: json["old_price"],
    price: json["price"],
    hasOffer: json["has_offer"],
    offerType:json["offer_type"],
    offerValue: json["offer_value"],
    isFavorite: json["is_favorite"],
    contents: json["contents"] == null ? [] : List<OneCity>.from(json["contents"]!.map((x) => OneCity.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "city_id": cityId,
    "city": city?.toJson(),
    "title": title,
    "image": image,
    "rate": rate,
    "rates_count": ratesCount,
    "old_price": oldPrice,
    "price": price,
    "has_offer": hasOffer,
    "offer_type": offerType,
    "offer_value": offerValue,
    "is_favorite": isFavorite,
    "contents": contents == null ? [] : List<dynamic>.from(contents!.map((x) => x.toJson())),
  };
}

class OneCity {
  int? id;
  String? title;
  String? image;
  int? unitsCount;
  List<Unit>? units;
  String? value;

  OneCity({
    this.id,
    this.title,
    this.image,
    this.unitsCount,
    this.units,
    this.value,
  });

  factory OneCity.fromJson(Map<String, dynamic> json) => OneCity(
    id: json["id"],
    title: json["title"]!,
    image: json["image"],
    unitsCount: json["units_count"],
    units: json["units"] == null ? [] : List<Unit>.from(json["units"]!.map((x) => Unit.fromJson(x))),
    value: json["value"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "image": image,
    "units_count": unitsCount,
    "units": units == null ? [] : List<dynamic>.from(units!.map((x) => x.toJson())),
    "value": value,
  };
}


