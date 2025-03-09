import 'package:flutter/cupertino.dart';

class AddVisitPermitViewModel extends ChangeNotifier{

  bool isSwitchVisitors = false;
  bool isSwitchMaterials = false;
  bool openVisitor = true;
  bool openMaterial = true;

  TextEditingController visitDateController =TextEditingController();
  TextEditingController numberOfDaysController =TextEditingController();
  TextEditingController permitStatusController =TextEditingController();
  TextEditingController driverNameController =TextEditingController();
  TextEditingController nameOfTheFacilityController =TextEditingController();
  TextEditingController companionIDNumberController =TextEditingController();
  TextEditingController facilitiesPhoneNumberController =TextEditingController();
  TextEditingController theNameController =TextEditingController();
  TextEditingController quantityController =TextEditingController();
  List<String>? cityList = ['القاهرة', 'المنوفية'];
  String? value;

  void refreshData(){
  notifyListeners();
}

}