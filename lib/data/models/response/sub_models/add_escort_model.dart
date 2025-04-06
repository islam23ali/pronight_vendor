import 'package:flutter/cupertino.dart';

class AddEscort {
  String name;
  String idNo;
  String nationality;
  String kinship;

  TextEditingController companionNameController;
  TextEditingController iDNumberCompanionsController;
  TextEditingController nationalityCompanionsController;
  TextEditingController facilitiesProximityController;

  AddEscort({
    required this.name,
    required this.idNo,
    required this.nationality,
    required this.kinship,
  }) :
        companionNameController = TextEditingController(text: name),
        iDNumberCompanionsController = TextEditingController(text: idNo),
        nationalityCompanionsController = TextEditingController(text: nationality),
        facilitiesProximityController = TextEditingController(text: kinship);

  // Update all fields from controllers
  void updateFromControllers() {
    name = companionNameController.text;
    idNo = iDNumberCompanionsController.text;
    nationality = nationalityCompanionsController.text;
    kinship = facilitiesProximityController.text;
  }

  // Dispose all controllers
  void dispose() {
    companionNameController.dispose();
    iDNumberCompanionsController.dispose();
    nationalityCompanionsController.dispose();
    facilitiesProximityController.dispose();
  }

  // Convert to Map
  Map<String, dynamic> toJson() =>
     {
      'name': name,
      'id_no': idNo,
      'nationality': nationality,
      'kinship': kinship,
    };


  // Create from Map
  factory AddEscort.fromJson(Map<String, dynamic> json) =>
     AddEscort(
      name: json['name'] ?? '',
      idNo: json['id_no'] ?? '',
      nationality: json['nationality'] ?? '',
      kinship: json['kinship'] ?? '',
    );

}