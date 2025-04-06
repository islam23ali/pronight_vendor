import 'package:flutter/cupertino.dart';

class Car {
  String type;
  String plateNo;
  String driverName;
  String driverIdNo;

  TextEditingController carTypeController;
  TextEditingController plateNumberController;
  TextEditingController driverNameController;
  TextEditingController driverIDNumberController;

  Car({
    required this.type,
    required this.plateNo,
    required this.driverName,
    required this.driverIdNo,
  }) :
        carTypeController = TextEditingController(text: type),
        plateNumberController = TextEditingController(text: plateNo),
        driverNameController = TextEditingController(text: driverName),
        driverIDNumberController = TextEditingController(text: driverIdNo);

  // Update all fields from controllers
  void updateFromControllers() {
    type = carTypeController.text;
    plateNo = plateNumberController.text;
    driverName = driverNameController.text;
    driverIdNo = driverIDNumberController.text;
  }

  // Dispose all controllers
  void dispose() {
    carTypeController.dispose();
    plateNumberController.dispose();
    driverNameController.dispose();
    driverIDNumberController.dispose();
  }

  // Convert to Map
  Map<String, dynamic> toJson() =>
     {
      'type': type,
      'plate_no': plateNo,
      'driver_name': driverName,
      'driver_id_no': driverIdNo,
    };


  // Create from Map
  factory Car.fromJson(Map<String, dynamic> json) =>
     Car(
      type: json['type'] ?? '',
      plateNo: json['plate_no'] ?? '',
      driverName: json['driver_name'] ?? '',
      driverIdNo: json['driver_id_no'] ?? '',
    );
}