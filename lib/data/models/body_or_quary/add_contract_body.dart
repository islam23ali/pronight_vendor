import 'package:pronight_vendor/data/models/response/sub_models/add_escort_model.dart' show AddEscort;

import '../response/sub_models/add_car_model.dart';

class AddContractBody {
  String? startDate;
  String? endDate;
  String? sectorId;
  String? villaId;
  String? beachId;
  String? tenantName;
  String? tenantIdNo;
  String? tenantNationality;
  String? tenantPhone;
  String? tenantPhoneCode;
  String? rentValue;
  String? insuranceValue;
  String? price;
  List<AddEscort>? escorts;
  List<Car>? cars;


  AddContractBody({
    this.startDate,
    this.endDate,
    this.sectorId,
    this.villaId,
    this.beachId,
    this.tenantName,
    this.tenantIdNo,
    this.tenantNationality,
    this.tenantPhone,
    this.tenantPhoneCode,
    this.rentValue,
    this.insuranceValue,
    this.price,
    this.escorts,
    this.cars,

  });


  Map<String, dynamic> toJson() => {
    "start_date": startDate,
    "end_date": endDate,
    "sector_id": sectorId,
    "villa_id": villaId,
    "beach_id": beachId,
    "tenant_name": tenantName,
    "tenant_id_no": tenantIdNo,
    "tenant_nationality": tenantNationality,
    "tenant_phone": tenantPhone,
    "tenant_phone_code": tenantPhoneCode,
    "rent_value": rentValue,
    "insurance_value": insuranceValue,
    "price": price,
    "escorts": escorts == null ? [] : List<dynamic>.from(escorts!.map((x) => x.toJson())),
    "cars": cars == null ? [] : List<dynamic>.from(cars!.map((x) => x.toJson())),


  };
}
// class Escort {
//   String? name;
//   String? idNo;
//   String? nationality;
//   String? kinship;
//
//   Escort({
//     this.name,
//     this.idNo,
//     this.nationality,
//     this.kinship,
//   });
//
//   factory Escort.fromJson(Map<String, dynamic> json) => Escort(
//     name: json["name"],
//     idNo: json["id_no"],
//     nationality: json["nationality"],
//     kinship: json["kinship"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "name": name,
//     "id_no": idNo,
//     "nationality": nationality,
//     "kinship": kinship,
//   };
// }