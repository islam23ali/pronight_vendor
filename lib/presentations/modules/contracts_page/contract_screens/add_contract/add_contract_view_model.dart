import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';
import 'package:pronight_vendor/core/navigator/navigator.dart';
import 'package:pronight_vendor/presentations/modules/contracts_page/contracts_view_model.dart';

import '../../../../../core/resources/app_assets.dart';
import '../../../../../core/resources/app_translate.dart';
import '../../../../../data/datasource/local/LocalUserData.dart';
import '../../../../../data/models/api_response.dart';
import '../../../../../data/models/body_or_quary/add_contract_body.dart';
import '../../../../../data/models/response/empty_model.dart';
import '../../../../../data/models/response/pay_contract_model.dart';
import '../../../../../data/models/response/sectors_model.dart';
import '../../../../../data/models/response/sub_models/add_car_model.dart';
import '../../../../../data/models/response/sub_models/add_escort_model.dart';
import '../../../../../data/models/response/villas_model.dart';
import '../../../../../data/repositories/contract_repo.dart';
import '../../../../../injection.dart';
import '../../../../components/loadings/custom_scaffold_messanger.dart';
import '../../../../components/loadings/progress_dialog.dart';
import '../../../layout/bottom_nav_bar_app.dart';
import '../pay_contract/paymentScreen.dart';

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
  // TextEditingController contractFeesController =TextEditingController();
  TextEditingController detailsController =TextEditingController();
  // page three data ...
  List<AddEscort> escorts = [AddEscort(name: '', idNo: '', nationality: '',)];
  // page four data ...
  List<Car> cars = [Car(type: '',plateNo: '',driverName: '',driverIdNo: '',)];

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
  PayContractModel? _payContractModel;
  bool sendClient=false;
  bool sendProvider=false;

  bool? get isLoading => _isLoading;
  bool? get isVilLoading => _isVilLoading;
  bool? get isBeaLoading => _isBeaLoading;
  SectorsModel? get sectorsModel => _sectorsModel;
  VillasModel? get villasModel => _villasModel;
  VillasModel? get beachesModel => _beachesModel;

  String phoneCode = '+966';
  String flag = AppAssets.flagIcon ;
  void selectedCountryCodeAndFlag (String newPhoneCode,newFlag) {
    phoneCode = newPhoneCode;
    flag = newFlag;
    notifyListeners();
  }

  void refreshData(){
  notifyListeners();
}
  void initAddContract(){
    // getAllSectors();
    sectorsModel?.data=null;
    selectedVilla=null;
    selectedSector=null;
    villasModel?.data=null;
    beachesModel?.data=null;
    arrivalDateController.clear();
    exitDateController.clear();
    tenantNameController.clear();
    iDNumberController.clear();
    nationalityController.clear();
    mobileNumberController.clear();
    rentalValueController.clear();
    insuranceValueController.clear();
    // contractFeesController.clear();
    detailsController.clear();
     escorts = [AddEscort(name: '', idNo: '', nationality: '',)];
     cars = [Car(type: '',plateNo: '',driverName: '',driverIdNo: '',)];
    notifyListeners();
  }

  Future<void> addContract () async {
    notifyListeners();
    AddContractBody addContractBody = AddContractBody();
    addContractBody.startDate=arrivalDateController.text;
    addContractBody.endDate=exitDateController.text;
    addContractBody.sectorId=selectedSector?.id.toString();
    addContractBody.villaId=selectedVilla?.id.toString();
    // addContractBody.beachId=selectedBeach?.id.toString();
    addContractBody.tenantName=tenantNameController.text;
    addContractBody.tenantIdNo=iDNumberController.text;
    addContractBody.tenantNationality=nationalityController.text;
    addContractBody.tenantPhoneCode=phoneCode;
    addContractBody.tenantPhone=mobileNumberController.text;
    addContractBody.rentValue=rentalValueController.text;
    addContractBody.insuranceValue=insuranceValueController.text;
    // addContractBody.price=contractFeesController.text;
    addContractBody.note=detailsController.text;
    addContractBody.sendClient=sendClient;
    addContractBody.sendProvider=sendProvider;
    addContractBody.escorts=escorts;
    addContractBody.cars=cars;

    ProgressDialog dialog = createProgressDialog(msg: "${AppTranslate.addContract.tr()} ...");
    await dialog.show();
    ApiResponse responseModel = await _contractRepo.addContractRepo(addContractBody);
    await dialog.hide();
    if (responseModel.response != null && responseModel.response?.statusCode == 200) {
      _emptyModel = EmptyModel.fromJson(responseModel.response?.data);
      notifyListeners();
      if (_emptyModel != null && _emptyModel?.code == 200) {
        NavigatorHandler.pushAndRemoveUntil(BottomNavBar(bottomNavIndex: 1));
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
  ContractViewModel contractProvider = getIt();

  void initUpdateContract(String id){
    contractProvider.oneContractDetails(id);
    getAllSectors();
    arrivalDateController.text=contractProvider.oneContractModel?.data?.startDate??'';
    exitDateController.text=contractProvider.oneContractModel?.data?.endDate??'';
    selectedSector=contractProvider.oneContractModel?.data?.sector;
    selectedVilla=contractProvider.oneContractModel?.data?.villa;
    selectedBeach=contractProvider.oneContractModel?.data?.beach;
    tenantNameController.text=contractProvider.oneContractModel?.data?.tenant?.name??'';
    iDNumberController.text=contractProvider.oneContractModel?.data?.tenant?.idNo??'';
    nationalityController.text=contractProvider.oneContractModel?.data?.tenant?.nationality??'';
    mobileNumberController.text=contractProvider.oneContractModel?.data?.tenant?.phone??'';
    rentalValueController.text=contractProvider.oneContractModel?.data?.rentValue.toString()??'';
    insuranceValueController.text=contractProvider.oneContractModel?.data?.insuranceValue.toString()??'';
    // contractFeesController.text=contractProvider.oneContractModel?.data?.price.toString()??'';
    detailsController.text=contractProvider.oneContractModel?.data?.note.toString()??'';
    // sendClient=contractProvider.oneContractModel?.data?.;
    // sendProvider=contractProvider.oneContractModel?.data?.;
    escorts =contractProvider.oneContractModel!.data!.escorts!;
    cars =contractProvider.oneContractModel!.data!.cars!;

  }
  Future<void> updateContract (String id) async {
    notifyListeners();
    AddContractBody addContractBody = AddContractBody();
    addContractBody.startDate=arrivalDateController.text;
    addContractBody.endDate=exitDateController.text;
    addContractBody.sectorId=selectedSector?.id.toString();
    addContractBody.villaId=selectedVilla?.id.toString();
    // addContractBody.beachId=selectedBeach?.id.toString();
    addContractBody.tenantName=tenantNameController.text;
    addContractBody.tenantIdNo=iDNumberController.text;
    addContractBody.tenantNationality=nationalityController.text;
    addContractBody.tenantPhoneCode=phoneCode;
    addContractBody.tenantPhone=mobileNumberController.text;
    addContractBody.rentValue=rentalValueController.text;
    addContractBody.insuranceValue=insuranceValueController.text;
    // addContractBody.price=contractFeesController.text;
    addContractBody.note=detailsController.text;
    addContractBody.sendClient=sendClient;
    addContractBody.sendProvider=sendProvider;
    addContractBody.escorts=escorts;
    addContractBody.cars=cars;

    ProgressDialog dialog = createProgressDialog(msg: "${AppTranslate.addContract.tr()} ...");
    await dialog.show();
    ApiResponse responseModel = await _contractRepo.updateContractRepo(id,addContractBody);
    await dialog.hide();
    if (responseModel.response != null && responseModel.response?.statusCode == 200) {
      _emptyModel = EmptyModel.fromJson(responseModel.response?.data);
      notifyListeners();
      if (_emptyModel != null && _emptyModel?.code == 200) {
        NavigatorHandler.pushAndRemoveUntil(BottomNavBar(bottomNavIndex: 1));
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
    ApiResponse responseModel = await _contractRepo.sectorsRepo(arrivalDateController.text,exitDateController.text);
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
    ApiResponse responseModel = await _contractRepo.villasRepo(sectorId,arrivalDateController.text,exitDateController.text);
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

  Future<void> payContract (contractId) async {

    notifyListeners();
    ProgressDialog dialog = createProgressDialog(msg: "${AppTranslate.payment.tr()} ...");
    await dialog.show();
    ApiResponse responseModel = await _contractRepo.payContractRepo(contractId.toString());
    await dialog.hide();
    if (responseModel.response != null && responseModel.response?.statusCode == 200) {
      _payContractModel = PayContractModel.fromJson(responseModel.response?.data);
      notifyListeners();
      if (_payContractModel != null && _payContractModel?.code == 200) {
      await  NavigatorHandler.push(PaymentWebView(paymentLink: _payContractModel?.data?.paymentUrl??'', successLink: _payContractModel?.data?.callBackUrl??'', failedLink: _payContractModel?.data?.errorUrl??'', contractId: contractId));
        notifyListeners();
      } else{
        CustomScaffoldMessanger.showToast(title: _payContractModel?.message??'');
      }
      notifyListeners();
    }
    else {
      CustomScaffoldMessanger.showScaffoledMessanger(title: responseModel.error,bg: Colors.red,fontColor: Colors.white);
    }
    notifyListeners();
  }

}