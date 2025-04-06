import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';

import '../../../../../core/resources/app_translate.dart';
import '../../../../../data/datasource/local/LocalUserData.dart';
import '../../../../../data/models/api_response.dart';
import '../../../../../data/models/body_or_quary/add_contract_body.dart';
import '../../../../../data/models/response/empty_model.dart';
import '../../../../../data/models/response/sectors_model.dart';
import '../../../../../data/models/response/sub_models/add_car_model.dart';
import '../../../../../data/models/response/sub_models/add_escort_model.dart';
import '../../../../../data/models/response/villas_model.dart';
import '../../../../../data/repositories/contract_repo.dart';
import '../../../../../injection.dart';
import '../../../../components/loadings/custom_scaffold_messanger.dart';
import '../../../../components/loadings/progress_dialog.dart';

class AddContractViewModel extends ChangeNotifier{
  final ContractRepo _contractRepo = getIt();
  final LocalUserData saveUserData = getIt();
  int currentPage = 0;
  final PageController pageController = PageController(initialPage: 0);

  //page one data ...
  TextEditingController arrivalDateController =TextEditingController();
  TextEditingController exitDateController =TextEditingController();
  // page two data ...
  TextEditingController tenantNameController =TextEditingController();
  TextEditingController iDNumberController =TextEditingController();
  TextEditingController nationalityController =TextEditingController();
  TextEditingController mobileNumberController =TextEditingController();
  TextEditingController rentalValueController =TextEditingController();
  TextEditingController insuranceValueController =TextEditingController();
  TextEditingController contractFeesController =TextEditingController();
  // page three data ...
  List<AddEscort> escorts = [AddEscort(name: '', idNo: '', nationality: '', kinship: '')];
  // TextEditingController companionNameController =TextEditingController();
  // TextEditingController iDNumberCompanionsController =TextEditingController();
  // TextEditingController nationalityCompanionsController =TextEditingController();
  // TextEditingController facilitiesProximityController =TextEditingController();
  // page four data ...
  List<Car> cars = [Car(type: '',plateNo: '',driverName: '',driverIdNo: '',)];
  // TextEditingController carTypeController =TextEditingController();
  // TextEditingController plateNumberController =TextEditingController();
  // TextEditingController driverNameController =TextEditingController();
  // TextEditingController driverIDNumberController =TextEditingController();

  int? isSelected;
  bool ? _isLoading;
  bool ? _isVilLoading;
  bool ? _isBeaLoading;
  EmptyModel? _emptyModel;
  SectorsModel ? _sectorsModel;
  OneSector? selectedSector;
  VillasModel ? _villasModel;
  VillasModel ? _beachesModel;
  OneVilla? selectedVilla;
  OneVilla? selectedBeach;

  bool? get isLoading => _isLoading;
  bool? get isVilLoading => _isVilLoading;
  bool? get isBeaLoading => _isBeaLoading;
  SectorsModel? get sectorsModel => _sectorsModel;
  VillasModel? get villasModel => _villasModel;
  VillasModel? get beachesModel => _beachesModel;


  void refreshData(){
  notifyListeners();
}
void initAddContract(){
  getAllSectors();
    selectedVilla=null;
    selectedSector=null;
    villasModel?.data=null;
    beachesModel?.data=null;

}
  Future<void> addContract () async {
    notifyListeners();
    AddContractBody addContractBody = AddContractBody();
    addContractBody.startDate=arrivalDateController.text;
    addContractBody.endDate=exitDateController.text;
    addContractBody.sectorId=selectedSector?.id.toString();
    addContractBody.villaId=selectedVilla?.id.toString();
    addContractBody.beachId=selectedBeach?.id.toString();

    addContractBody.tenantName=tenantNameController.text;
    addContractBody.tenantIdNo=iDNumberController.text;
    addContractBody.tenantNationality=nationalityController.text;
    addContractBody.tenantPhoneCode='+966';
    addContractBody.tenantPhone=mobileNumberController.text;
    addContractBody.rentValue=rentalValueController.text;
    addContractBody.insuranceValue=insuranceValueController.text;
    addContractBody.price=contractFeesController.text;

    addContractBody.escorts=escorts;
    addContractBody.cars=cars;
    // for(int i=0;i<(escorts.length);i++){
    // for(int e=0;e<(addContractBody.escorts?.length??0);e++){
    //   addContractBody.escorts?[e].name=escorts[i].name;
    //   addContractBody.escorts?[e].nationality=escorts[i].nationality;
    //   addContractBody.escorts?[e].idNo=escorts[i].idNo;
    //   addContractBody.escorts?[e].kinship=escorts[i].kinship;
    // }
    // }
    // for(int i=0;i<(cars.length);i++){
    // for(int e=0;e<(addContractBody.escorts?.length??0);e++){
    //   addContractBody.escorts?[e].name=cars[i].name;
    // }
    // }



    ProgressDialog dialog = createProgressDialog(msg: "${AppTranslate.addContract.tr()} ...");
    await dialog.show();
    ApiResponse responseModel = await _contractRepo.addContractRepo(addContractBody);
    await dialog.hide();
    if (responseModel.response != null && responseModel.response?.statusCode == 200) {
      _emptyModel = EmptyModel.fromJson(responseModel.response?.data);
      notifyListeners();
      if (_emptyModel != null && _emptyModel?.code == 200) {
        if(kDebugMode){
          CustomScaffoldMessanger.showToast(title: 'الله ينور ياعمناااا <<<<<<<<<<');
        }
        notifyListeners();
      } else{
        CustomScaffoldMessanger.showToast(title: _emptyModel?.message??'');
      }
      notifyListeners();
    }
    else {
      CustomScaffoldMessanger.showScaffoledMessanger(title: responseModel.error,bg: Colors.red,fontColor: Colors.white);
    }
    notifyListeners();
  }


  Future<void> getAllSectors () async {
    _isLoading = true ;
    notifyListeners();
    ApiResponse responseModel = await _contractRepo.sectorsRepo();
    if (responseModel.response != null && responseModel.response?.statusCode == 200) {
      _sectorsModel = SectorsModel.fromJson(responseModel.response?.data);
      _isLoading = false;
      notifyListeners();
      if (_sectorsModel != null && _sectorsModel?.code == 200) {

        notifyListeners();
      } else{
        CustomScaffoldMessanger.showToast(title: _sectorsModel?.message??'');
      }
      notifyListeners();
    }
    else {
      CustomScaffoldMessanger.showScaffoledMessanger(title: responseModel.error,bg: Colors.red,fontColor: Colors.white);
    }
    notifyListeners();
  }
  Future<void> getAllVillas (sectorId) async {
    _isVilLoading = true ;
    notifyListeners();
    ApiResponse responseModel = await _contractRepo.villasRepo(sectorId);
    if (responseModel.response != null && responseModel.response?.statusCode == 200) {
      _villasModel = VillasModel.fromJson(responseModel.response?.data);
      _isVilLoading = false;
      notifyListeners();
      if (_villasModel != null && _villasModel?.code == 200) {

        notifyListeners();
      } else{
        CustomScaffoldMessanger.showToast(title: _villasModel?.message??'');
      }
      notifyListeners();
    }
    else {
      CustomScaffoldMessanger.showScaffoledMessanger(title: responseModel.error,bg: Colors.red,fontColor: Colors.white);
    }
    notifyListeners();
  }
  Future<void> getAllBeaches (sectorId) async {
    _isBeaLoading = true ;
    notifyListeners();
    ApiResponse responseModel = await _contractRepo.beachesRepo(sectorId);
    if (responseModel.response != null && responseModel.response?.statusCode == 200) {
      _beachesModel = VillasModel.fromJson(responseModel.response?.data);
      _isBeaLoading = false;
      notifyListeners();
      if (_beachesModel != null && _beachesModel?.code == 200) {

        notifyListeners();
      } else{
        CustomScaffoldMessanger.showToast(title: _beachesModel?.message??'');
      }
      notifyListeners();
    }
    else {
      CustomScaffoldMessanger.showScaffoledMessanger(title: responseModel.error,bg: Colors.red,fontColor: Colors.white);
    }
    notifyListeners();
  }
}