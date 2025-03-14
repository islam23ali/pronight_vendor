import 'package:flutter/cupertino.dart';

class AddUnitViewModel extends ChangeNotifier{

  int currentPage = 0;
  final PageController pageController = PageController(initialPage: 0);

  //page one data ...
  TextEditingController arrivalDateController =TextEditingController();
  TextEditingController exitDateController =TextEditingController();
  List<String>? cityList = ['القاهرة', 'المنوفية'];
  String? value;

  bool isSwitchOffer = false;

  bool openMaterial = true;

  TextEditingController nameOfTheFacilityController =TextEditingController();
  TextEditingController companionIDNumberController =TextEditingController();
  TextEditingController facilitiesPhoneNumberController =TextEditingController();

  void refreshData(){
  notifyListeners();
}

}