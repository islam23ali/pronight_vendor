
class ReportsModel {
  List<OneReport>? data;
  String? message;
  int? code;

  ReportsModel({
    this.data,
    this.message,
    this.code,
  });

  factory ReportsModel.fromJson(Map<String, dynamic> json) => ReportsModel(
    data: json["data"] == null ? [] : List<OneReport>.from(json["data"]!.map((x) => OneReport.fromJson(x))),
    message: json["message"],
    code: json["code"],
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "message": message,
    "code": code,
  };
}

class OneReport {
  int? id;
  String? code;
  int? userId;
  User? user;
  int? unitId;
  Unit? unit;
  num? unitPrice;
  num? totalPrice;
  String? status;
  String? entryDate;
  String? exitDate;
  int? adultsCount;
  int? childrenCount;
  bool? isPaid;
  List<Detail>? details;

  OneReport({
    this.id,
    this.code,
    this.userId,
    this.user,
    this.unitId,
    this.unit,
    this.unitPrice,
    this.totalPrice,
    this.status,
    this.entryDate,
    this.exitDate,
    this.adultsCount,
    this.childrenCount,
    this.isPaid,
    this.details,
  });

  factory OneReport.fromJson(Map<String, dynamic> json) => OneReport(
    id: json["id"],
    code: json["code"],
    userId: json["user_id"],
    user: json["user"] == null ? null : User.fromJson(json["user"]),
    unitId: json["unit_id"],
    unit: json["unit"] == null ? null : Unit.fromJson(json["unit"]),
    unitPrice: json["unit_price"],
    totalPrice: json["total_price"],
    status: json["status"],
    entryDate: json["entry_date"],
    exitDate: json["exit_date"],
    adultsCount: json["adults_count"],
    childrenCount: json["children_count"],
    isPaid: json["is_paid"],
    details: json["details"] == null ? [] : List<Detail>.from(json["details"]!.map((x) => Detail.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "code": code,
    "user_id": userId,
    "user": user?.toJson(),
    "unit_id": unitId,
    "unit": unit?.toJson(),
    "unit_price": unitPrice,
    "total_price": totalPrice,
    "status": status,
    "entry_date":entryDate,
    "exit_date": exitDate,
    "adults_count": adultsCount,
    "children_count": childrenCount,
    "is_paid": isPaid,
    "details": details == null ? [] : List<dynamic>.from(details!.map((x) => x.toJson())),
  };
}

class Detail {
  int? id;
  int? additionServiceId;
  AdditionService? additionService;
  num? price;
  num? totalPrice;

  Detail({
    this.id,
    this.additionServiceId,
    this.additionService,
    this.price,
    this.totalPrice,
  });

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
    id: json["id"],
    additionServiceId: json["addition_service_id"],
    additionService: json["additionService"] == null ? null : AdditionService.fromJson(json["additionService"]),
    price: json["price"],
    totalPrice: json["total_price"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "addition_service_id": additionServiceId,
    "additionService": additionService?.toJson(),
    "price": price,
    "total_price": totalPrice,
  };
}

class AdditionService {
  int? id;
  String? title;
  num? price;
  bool? forPerson;

  AdditionService({
    this.id,
    this.title,
    this.price,
    this.forPerson,
  });

  factory AdditionService.fromJson(Map<String, dynamic> json) => AdditionService(
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

class Unit {
  int? id;
  int? cityId;
  City? city;
  int? providerId;
  Provider? provider;
  String? title;
  String? desc;
  int? area;
  bool? isConfirmed;
  bool? isAccepted;
  String? image;
  String? identityImage;
  String? licenseImage;
  String? commercialRegisterImage;
  String? address;
  double? latitude;
  double? longitude;
  int? rate;
  int? ratesCount;
  num? oldPrice;
  num? price;
  bool? hasOffer;
  String? offerType;
  int? offerValue;
  bool? isFavorite;
  List<City>? contents;
  List<City>? facilities;
  List<AdditionService>? additionalServices;
  List<dynamic>? images;

  Unit({
    this.id,
    this.cityId,
    this.city,
    this.providerId,
    this.provider,
    this.title,
    this.desc,
    this.area,
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

  factory Unit.fromJson(Map<String, dynamic> json) => Unit(
    id: json["id"],
    cityId: json["city_id"],
    city: json["city"] == null ? null : City.fromJson(json["city"]),
    providerId: json["provider_id"],
    provider: json["provider"] == null ? null : Provider.fromJson(json["provider"]),
    title: json["title"],
    desc: json["desc"],
    area: json["area"],
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
    additionalServices: json["additional_services"] == null ? [] : List<AdditionService>.from(json["additional_services"]!.map((x) => AdditionService.fromJson(x))),
    images: json["images"] == null ? [] : List<dynamic>.from(json["images"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "city_id": cityId,
    "city": city?.toJson(),
    "provider_id": providerId,
    "provider": provider?.toJson(),
    "title": title,
    "desc": desc,
    "area": area,
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
    "images": images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
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
