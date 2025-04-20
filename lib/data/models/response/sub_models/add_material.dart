import 'package:flutter/cupertino.dart';

class AddMaterial {
  int? id;
  String? name;
  String? qty;
  TextEditingController materialNameController;
  TextEditingController materialQtyController;

  AddMaterial({
    this.id,
    this.name,
    this.qty,
  }) :
        materialNameController = TextEditingController(text: name),
        materialQtyController = TextEditingController(text: qty);
  void updateFromControllers() {
    name = materialNameController.text;
    qty = materialQtyController.text;
  }
  factory AddMaterial.fromJson(Map<String, dynamic> json) => AddMaterial(
    id: json["id"],
    name: json["name"],
    qty: json["qty"],
  );
  void dispose() {
    materialNameController.dispose();
    materialQtyController.dispose();
  }
  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "qty": qty,
  };
}