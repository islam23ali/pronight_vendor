import 'package:flutter/cupertino.dart';

class AddContractViewModel extends ChangeNotifier{

  int currentPage = 0;
  final PageController pageController = PageController(initialPage: 0);

  //page one data ...
  TextEditingController arrivalDateController =TextEditingController();
  TextEditingController exitDateController =TextEditingController();
  List<String>? cityList = ['القاهرة', 'المنوفية'];
  String? value;
  // page two data ...
  TextEditingController tenantNameController =TextEditingController();
  TextEditingController iDNumberController =TextEditingController();
  TextEditingController nationalityController =TextEditingController();
  TextEditingController mobileNumberController =TextEditingController();
  TextEditingController rentalValueController =TextEditingController();
  TextEditingController insuranceValueController =TextEditingController();
  TextEditingController contractFeesController =TextEditingController();
  // page three data ...
  TextEditingController companionNameController =TextEditingController();
  TextEditingController iDNumberCompanionsController =TextEditingController();
  TextEditingController nationalityCompanionsController =TextEditingController();
  TextEditingController facilitiesProximityController =TextEditingController();
  // page four data ...
  TextEditingController carTypeController =TextEditingController();
  TextEditingController plateNumberController =TextEditingController();
  TextEditingController driverNameController =TextEditingController();
  TextEditingController driverIDNumberController =TextEditingController();


  void refreshData(){
  notifyListeners();
}

}