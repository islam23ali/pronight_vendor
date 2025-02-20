class MinutesBody {
  String? number;
  String? year;
  int? cityId;
  int? areaId;
  int? reportTypeId;
  int? reportCategoryId;
  String? date;
  String? serial1;
  String? serial2;
  String? details;
  String? action;
  String? address;
  String? notes;
  String? reporterDetails;
  int? status;


  MinutesBody({
    this.number,
    this.year,
    this.cityId,
    this.areaId,
    this.reportTypeId,
    this.reportCategoryId,
    this.date,
    this.serial1,
    this.serial2,
    this.details,
    this.action,
    this.address,
    this.notes,
    this.reporterDetails,
    this.status,

  });


  Map<String, dynamic> toJson() => {
    "number": number,
    "year": year,
    "city_id": cityId,
    "area_id": areaId,
    "report_type_id": reportTypeId,
    "report_category_id": reportCategoryId,
    "date": date,
    "address": address,
    "serial1": serial1,
    "serial2": serial2,
    "details": details,
    "action": action,
    "notes": notes,
    "reporter_details": reporterDetails,
    "status": status,
  };
}
