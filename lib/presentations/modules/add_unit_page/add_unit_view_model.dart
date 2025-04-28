import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pronight_vendor/data/repositories/units_repo.dart';

import '../../../data/models/api_response.dart';
import '../../../data/models/response/cities_model.dart';
import '../../../injection.dart';
import '../../components/loadings/custom_scaffold_messanger.dart';

class AddUnitViewModel extends ChangeNotifier{
final UnitsRepo _unitsRepo = getIt();
  int currentPage = 0;
  final PageController pageController = PageController(initialPage: 0);



   CitiesModel? _citiesModel;
   bool? _isLoading = false;

   CitiesModel? get citiesModel => _citiesModel;
   bool? get isLoading => _isLoading;



  //page one data ...
  TextEditingController arabicUnitNameController =TextEditingController();
  TextEditingController englishUnitNameController =TextEditingController();
  TextEditingController unitPriceController =TextEditingController();
  TextEditingController arabicUnitDescriptionController =TextEditingController();
  TextEditingController englishUnitDescriptionController =TextEditingController();
  TextEditingController notesController =TextEditingController();
   // page two data ....
  OneCity? selectedCity;
  String? latitude;
  String? longitude;
  String? address;


initAddUnit(){

  selectedCity=null;
  getAllCities();
  notifyListeners();
}

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
  Future<void> getAllCities () async {
    _isLoading = true;
    notifyListeners();
    ApiResponse responseModel = await _unitsRepo.citiesRepo();

    if (responseModel.response != null && responseModel.response?.statusCode == 200) {
      _citiesModel = CitiesModel.fromJson(responseModel.response?.data);
      _isLoading = false;
      notifyListeners();
      if (_citiesModel != null && _citiesModel?.code == 200) {
        if(kDebugMode){
          CustomScaffoldMessanger.showToast(title: _citiesModel?.message??'');
        }
      } else{
        CustomScaffoldMessanger.showToast(title: _citiesModel?.message??'');
      }
      notifyListeners();
    }
    else {
      CustomScaffoldMessanger.showScaffoledMessanger(title: responseModel.error,bg: Colors.red,fontColor: Colors.white);
    }
    notifyListeners();
  }
}