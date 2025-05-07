import 'package:image_picker/image_picker.dart';
import 'package:pronight_vendor/data/models/response/sub_models/add_additional_service_model.dart';
import 'package:pronight_vendor/data/models/response/sub_models/add_facilitie_model.dart';
import 'package:pronight_vendor/data/models/response/sub_models/add_unit_content_model.dart';

class AddUnitBody {
  String? titleAr;
  String? titleEn;
  String? note;
  String? descAr;
  String? descEn;
  String? cityId;
  String? price;
  String? area;
  String? image;
  String? latitude;
  String? longitude;
  String? address;
  List<XFile>? images;
  String? maxAdultCount;
  String? adultPrice;
  String? maxChildCount;
  String? childPrice;
  String? hasOffer;
  String? offerStartDate;
  String? offerEndDate;
  String? offerType;
  String? offerValue;
  List<AddContent>? contents;
  List<AddFacilities>? facilities;
  List<AddAdditionalServices>? additionalServices;


  AddUnitBody({
    this.titleAr,
    this.titleEn,
    this.note,
    this.descAr,
    this.descEn,
    this.cityId,
    this.price,
    this.area,
    this.image,
    this.latitude,
    this.longitude,
    this.address,
    this.images,
    this.maxAdultCount,
    this.adultPrice,
    this.maxChildCount,
    this.childPrice,
    this.hasOffer,
    this.offerStartDate,
    this.offerEndDate,
    this.offerType,
    this.offerValue,
    this.contents,
    this.facilities,
    this.additionalServices,

  });


  Map<String, dynamic> toJson() => {
    "title[ar]": titleAr,
    "title[en]": titleEn,
    "note": note,
    "desc[ar]": descAr,
    "desc[en]": descEn,
    "city_id": cityId,
    "price": price,
    "area": area,
    "image": image,
    "latitude": latitude,
    "longitude": longitude,
    "address": address,
    "images[]": images,
    "max_adult_count": maxAdultCount,
    "adult_price": adultPrice,
    "max_child_count": maxChildCount,
    "child_price": childPrice,
    "has_offer": hasOffer,
    "offer_start_date": offerStartDate,
    "offer_end_date": offerEndDate,
    "offer_type": offerType,
    "offer_value": offerValue,
    "contents": contents == null ? [] : List<dynamic>.from(contents!.map((x) => x.toJson())),
    "facilities": facilities == null ? [] : List<dynamic>.from(facilities!.map((x) => x.toJson())),
    "additional_services": additionalServices == null ? [] : List<dynamic>.from(additionalServices!.map((x) => x.toJson())),


  };
}
