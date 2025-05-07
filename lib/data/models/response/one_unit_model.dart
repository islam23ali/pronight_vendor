
class OneUnitModel {
  Data? data;
  String? message;
  int? code;

  OneUnitModel({
    this.data,
    this.message,
    this.code,
  });

  factory OneUnitModel.fromJson(Map<String, dynamic> json) => OneUnitModel(
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
  int? id;
  int? cityId;
  City? city;
  int? providerId;
  Provider? provider;
  String? title;
  String? desc;
  String? note;
  num? area;
  num? maxAdultCount;
  num? maxChildCount;
  bool? isConfirmed;
  bool? isAccepted;
  String? image;
  String? identityImage;
  String? licenseImage;
  String? commercialRegisterImage;
  String? address;
  double? latitude;
  double? longitude;
  num? rate;
  num? ratesCount;
  num? oldPrice;
  num? price;
  bool? hasOffer;
  String? offerType;
  num? offerValue;
  bool? isFavorite;
  List<City>? contents;
  List<City>? facilities;
  List<AdditionalService>? additionalServices;
  List<OneUnitImage>? images;

  Data({
    this.id,
    this.cityId,
    this.city,
    this.providerId,
    this.provider,
    this.title,
    this.desc,
    this.note,
    this.area,
    this.maxAdultCount,
    this.maxChildCount,
    this.isConfirmed,
    this.isAccepted,
    this.image,
    this.identityImage,
    this.licenseImage,
    this.commercialRegisterImage,
    this.address,
    this.latitude,
    this.longitude,
    this.rate,
    this.ratesCount,
    this.oldPrice,
    this.price,
    this.hasOffer,
    this.offerType,
    this.offerValue,
    this.isFavorite,
    this.contents,
    this.facilities,
    this.additionalServices,
    this.images,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    cityId: json["city_id"],
    city: json["city"] == null ? null : City.fromJson(json["city"]),
    providerId: json["provider_id"],
    provider: json["provider"] == null ? null : Provider.fromJson(json["provider"]),
    title: json["title"],
    desc: json["desc"],
    note: json["note"],
    area: json["area"],
    maxAdultCount: json["max_adult_count"],
    maxChildCount: json["max_child_count"],
    isConfirmed: json["is_confirmed"],
    isAccepted: json["is_accepted"],
    image: json["image"],
    identityImage: json["identity_image"],
    licenseImage: json["license_image"],
    commercialRegisterImage: json["commercial_register_image"],
    address: json["address"],
    latitude: json["latitude"]?.toDouble(),
    longitude: json["longitude"]?.toDouble(),
    rate: json["rate"],
    ratesCount: json["rates_count"],
    oldPrice: json["old_price"],
    price: json["price"],
    hasOffer: json["has_offer"],
    offerType: json["offer_type"],
    offerValue: json["offer_value"],
    isFavorite: json["is_favorite"],
    contents: json["contents"] == null ? [] : List<City>.from(json["contents"]!.map((x) => City.fromJson(x))),
    facilities: json["facilities"] == null ? [] : List<City>.from(json["facilities"]!.map((x) => City.fromJson(x))),
    additionalServices: json["additional_services"] == null ? [] : List<AdditionalService>.from(json["additional_services"]!.map((x) => AdditionalService.fromJson(x))),
    images: json["images"] == null ? [] : List<OneUnitImage>.from(json["images"]!.map((x) => OneUnitImage.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "city_id": cityId,
    "city": city?.toJson(),
    "provider_id": providerId,
    "provider": provider?.toJson(),
    "title": title,
    "desc": desc,
    "note": note,
    "area": area,
    "max_adult_count": maxAdultCount,
    "max_child_count": maxChildCount,
    "is_confirmed": isConfirmed,
    "is_accepted": isAccepted,
    "image": image,
    "identity_image": identityImage,
    "license_image": licenseImage,
    "commercial_register_image": commercialRegisterImage,
    "address": address,
    "latitude": latitude,
    "longitude": longitude,
    "rate": rate,
    "rates_count": ratesCount,
    "old_price": oldPrice,
    "price": price,
    "has_offer": hasOffer,
    "offer_type": offerType,
    "offer_value": offerValue,
    "is_favorite": isFavorite,
    "contents": contents == null ? [] : List<dynamic>.from(contents!.map((x) => x.toJson())),
    "facilities": facilities == null ? [] : List<dynamic>.from(facilities!.map((x) => x.toJson())),
    "additional_services": additionalServices == null ? [] : List<dynamic>.from(additionalServices!.map((x) => x.toJson())),
    "images": images == null ? [] : List<dynamic>.from(images!.map((x) => x.toJson())),
  };
}

class AdditionalService {
  int? id;
  String? title;
  num? price;
  bool? forPerson;

  AdditionalService({
    this.id,
    this.title,
    this.price,
    this.forPerson,
  });

  factory AdditionalService.fromJson(Map<String, dynamic> json) => AdditionalService(
    id: json["id"],
    title: json["title"],
    price: json["price"],
    forPerson: json["for_person"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "price": price,
    "for_person": forPerson,
  };
}

class City {
  int? id;
  String? title;
  String? image;
  int? unitsCount;
  String? value;
  String? text;

  City({
    this.id,
    this.title,
    this.image,
    this.unitsCount,
    this.value,
    this.text,
  });

  factory City.fromJson(Map<String, dynamic> json) => City(
    id: json["id"],
    title: json["title"],
    image: json["image"],
    unitsCount: json["units_count"],
    value: json["value"],
    text: json["text"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "image": image,
    "units_count": unitsCount,
    "value": value,
    "text": text,
  };
}

class OneUnitImage {
  int? id;
  String? image;

  OneUnitImage({
    this.id,
    this.image,
  });

  factory OneUnitImage.fromJson(Map<String, dynamic> json) => OneUnitImage(
    id: json["id"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "image": image,
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
