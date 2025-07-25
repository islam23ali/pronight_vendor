class AppUrls {
  // static String baseUrl = "https://pro-night.com/api";
  static String baseUrl = "https://business.pro-night.net/api";
  static String sendCodeUrl = "/provider/send-code";
  static String confirmCodeUrl = "/provider/confirm-code";

  static String deleteAccountUrl = "/provider/delete-account";

  static String registerUrl = "/provider/register";

  static String updateProfileUrl = "/provider/update-profile";
  static String logoutUrl = "/provider/logout";

  static String allContractUrl = "/provider/contracts?name=";
  static String oneContractUrl = "/provider/contracts/";      //for details and delete contract
  static String printContractUrl = "/provider/print-contracts/";
  static String addContractUrl = "/provider/contracts";
  static String updateContentsUrl = "/provider/contracts/";
  static String sectorsUrl = "/provider/sectors";
  static String villasUrl = "/provider/villas?sector_id=";
  static String beachesUrl = "/provider/beaches?sector_id=";
  static String payContractUrl = "/provider/pay-contract/";

  static String visitPermitsUrl = "/provider/visit-permits?search=";
  static String oneVisitPermitUrl = "/provider/visit-permits/";
  static String printVisitPermitUrl = "/provider/print-visit-permits/";
  static String deleteVisitPermitUrl = "/provider/visit-permits/";
  static String addVisitPermitUrl = "/provider/visit-permits";
  static String updateVisitPermitUrl = "/provider/visit-permits/";
  static String deleteVisitorPermitUrl = "/provider/delete-visitors/";
  static String deleteMaterialsPermitUrl = "/provider/delete-materials/";

  static String allUnitsUrl = "/provider/units?limit=";
  static String oneUnitsUrl = "/provider/unit/";
  static String citiesUrl = "/provider/cities";
  static String confirmAdditionUrl = "/provider/create-unit-addition/";

  static String contentsUrl = "/provider/main-contents";
  static String facilitiesUrl = "/provider/main-facilities";


  static String reportsUrl = "/provider/all-reservations";

  static String addUnitUrl = "/provider/create-unit";

  static String reservationUrl = "/provider/reservations?status=";
  static String updateReservationStatusUrl = "/provider/reservations/";

  static String homeDataUrl = "/provider/home";
  static String notificationsUrl = "/provider/notifications?limit=10&page=";
  static String unReadNotificationsUrl = "/provider/unread-notifications";
  static String readNotificationsUrl = "/provider/read-notifications/";
  static String updateFCMTokenUrl = "/provider/create-token";

  static String settingUrl = "/provider/settings";
  static String statisticsUrl = "/provider/statistics";
  static String sendComplaintsUrl = "/provider/complaints";
  static String contactUsUrl = "/provider/contact-us";

  // set price
  static String setPriceUrl = "/provider/units-special-prices";
  static String reservationDaysUrl = "/provider/reservations-days/";

}
