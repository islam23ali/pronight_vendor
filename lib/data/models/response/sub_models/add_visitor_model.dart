import 'package:flutter/cupertino.dart';

class AddVisitor {
  int? id;
  String? name;
  String? idNo;
  String? phoneCode='+966';
  String? phone;
  TextEditingController visitorNameController;
  TextEditingController visitorIDNumberController;
  TextEditingController visitorPhoneCodeController;
  TextEditingController visitorPhoneController;
  AddVisitor({
    this.id,
    this.name,
    this.idNo,
    this.phoneCode,
    this.phone,
  }) :
        visitorNameController = TextEditingController(text: name??''),
        visitorIDNumberController = TextEditingController(text: idNo??''),
        visitorPhoneCodeController = TextEditingController(text: phoneCode??''),
        visitorPhoneController = TextEditingController(text: phone??'');
  // Update all fields from controllers
  void updateFromControllers() {
    name = visitorNameController.text;
    idNo = visitorIDNumberController.text;
    phoneCode = visitorPhoneCodeController.text;
    phone = visitorPhoneController.text;
  }

  factory AddVisitor.fromJson(Map<String, dynamic> json) => AddVisitor(
    id: json["id"],
    name: json["name"],
    idNo: json["id_no"],
    phoneCode: json["phone_code"],
    phone: json["phone"],
  );
  // Dispose all controllers
  void dispose() {
    visitorNameController.dispose();
    visitorIDNumberController.dispose();
    visitorPhoneCodeController.dispose();
    visitorPhoneController.dispose();
  }
  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "id_no": idNo,
    "phone_code": phoneCode,
    "phone": phone,
  };
}