import 'package:flutter/cupertino.dart';
import 'package:pronight_vendor/data/models/response/contens_model.dart';

class AddContent {
  int unitMainContentId;
  String value;

  OneConten oneContent;
  TextEditingController theValue;

  AddContent({
    required this.unitMainContentId,
    required this.value,

  }) :
        oneContent = OneConten(id:unitMainContentId ),
        theValue = TextEditingController(text: value);

  // Update all fields from controllers
  void updateFromControllers() {
    unitMainContentId = oneContent.id??0;
    value = theValue.text;
  }

  // Dispose all controllers
  void dispose() {
    oneContent=OneConten();
    theValue.dispose();

  }

  // Convert to Map
  Map<String, dynamic> toJson() =>
      {
        'unit_main_content_id': unitMainContentId,
        'value': value,

      };


  // Create from Map
  factory AddContent.fromJson(Map<String, dynamic> json) =>
      AddContent(
        unitMainContentId: json['unit_main_content_id'] ?? '',
        value: json['value'] ?? '',
      );

}