class AppUrls {
  static String baseUrl = "https://pro-night.com/api";
  static String sendCodeUrl = "/provider/send-code";
  static String confirmCodeUrl = "/provider/confirm-code";

  static String registerUrl = "/provider/register";

  static String allContractUrl = "/provider/contracts?name=";
  static String oneContractUrl = "/provider/contracts/";      //for details and delete contract
  static String printContractUrl = "/provider/print-contracts/";
  static String addContractUrl = "/provider/contracts";
  static String sectorsUrl = "/provider/sectors";
  static String villasUrl = "/provider/villas?sector_id=";
  static String beachesUrl = "/provider/beaches?sector_id=";

  static String visitPermitsUrl = "/provider/visit-permits?search=";
  static String oneVisitPermitUrl = "/provider/visit-permits/";
  static String printVisitPermitUrl = "/provider/print-visit-permits/";
  static String deleteVisitPermitUrl = "/provider/visit-permits/";
  static String addVisitPermitUrl = "/provider/visit-permits";

  static String allUnitsUrl = "/provider/units?limit=";
  static String oneUnitsUrl = "/provider/unit/";
  static String citiesUrl = "/provider/cities";

  static String contentsUrl = "/provider/main-contents";
  static String facilitiesUrl = "/provider/main-facilities";


  static String reportsUrl = "/provider/all-reservations";

  static String addUnitUrl = "/provider/create-unit";
}
