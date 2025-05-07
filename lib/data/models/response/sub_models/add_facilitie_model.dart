import 'package:flutter/cupertino.dart';

import '../contens_model.dart';

class AddFacilities {
  int unitMainFacilityId;
  String textAr;
  String textEn;

  OneConten? selectedFacilities;
  TextEditingController textArController;
  TextEditingController textEnController;

  AddFacilities({
    required this.unitMainFacilityId,
    required this.textAr,
    required this.textEn,
  })  : selectedFacilities = OneConten(id: unitMainFacilityId),
        textArController = TextEditingController(text: textAr),
        textEnController = TextEditingController(text: textEn);

  // Update all fields from controllers
  void updateFromControllers() {
    unitMainFacilityId = selectedFacilities?.id??0;
    textAr = textArController.text;
    textEn = textEnController.text;
  }

  // Dispose all controllers
  void dispose() {
    selectedFacilities=null;
    textArController.dispose();
    textEnController.dispose();
  }

  // Convert to the nested JSON structure you need
  Map<String, dynamic> toJson() => {
    "facilities": [
      {
        "unit_main_facility_id": unitMainFacilityId,
        "text": {
          "ar": textAr,
          "en": textEn,
        }
      }
    ]
  };

  // Create from JSON
  factory AddFacilities.fromJson(Map<String, dynamic> json) {
    // Handle the nested structure
    final facilitiesList = json['facilities'] as List?;
    if (facilitiesList == null || facilitiesList.isEmpty) {
      return AddFacilities(
        unitMainFacilityId: -1,
        textAr: '',
        textEn: '',
      );
    }

    final firstFacility = facilitiesList.first as Map<String, dynamic>;
    final textMap = firstFacility['text'] as Map<String, dynamic>? ?? {};

    return AddFacilities(
      unitMainFacilityId: firstFacility['unit_main_facility_id'],
      textAr: textMap['ar']?.toString() ?? '',
      textEn: textMap['en']?.toString() ?? '',
    );
  }

  // Helper method to create a list of facilities (if you need multiple)
  static List<Map<String, dynamic>> facilitiesListToJson(List<AddFacilities> facilities) {
    return facilities.map((facility) => {
      "unit_main_facility_id": facility.unitMainFacilityId,
      "text": {
        "ar": facility.textAr,
        "en": facility.textEn,
      }
    }).toList();
  }
}