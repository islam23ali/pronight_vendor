class MinutesQ {
  String? status;
  String? reportTo;
  String? reportFrom;
  int? cityId;
  int? areaId;
  int? reportCategoryId;




  MinutesQ({
    this.status,
    this.reportFrom,
    this.reportTo,
    this.cityId,
    this.areaId,
    this.reportCategoryId,

  });


  Map<String, dynamic> toJson() => {
    "status": status,
    "report_to": reportTo,
    "report_from": reportFrom,
    "city_id": cityId,
    "area_id": areaId,
    // "search_key": reportCategoryId,

  };
}
