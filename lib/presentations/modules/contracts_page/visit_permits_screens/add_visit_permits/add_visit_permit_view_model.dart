import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';
import 'package:pronight_vendor/data/models/body_or_quary/add_visit_permit_body.dart';
import 'package:pronight_vendor/data/models/response/one_visit_permit_model.dart';
import 'package:pronight_vendor/data/models/response/sub_models/add_material.dart';
import 'package:pronight_vendor/data/models/response/sub_models/add_visitor_model.dart';
import 'package:pronight_vendor/data/repositories/visit_permit_repo.dart';
import 'package:pronight_vendor/presentations/modules/contracts_page/visit_permits_screens/visit_permit_view_model.dart';
import '../../../../../core/navigator/navigator.dart';
import '../../../../../core/resources/app_assets.dart';
import '../../../../../core/resources/app_translate.dart';
import '../../../../../data/datasource/local/LocalUserData.dart';
import '../../../../../data/models/api_response.dart';
import '../../../../../data/models/response/sectors_model.dart';
import '../../../../../data/models/response/villas_model.dart';
import '../../../../../injection.dart';
import '../../../../components/loadings/custom_scaffold_messanger.dart';
import '../../../../components/loadings/progress_dialog.dart';
import '../../../layout/bottom_nav_bar_app.dart';
import '../../contract_screens/add_contract/add_contract_view_model.dart';

class AddVisitPermitViewModel extends ChangeNotifier{
  final VisitPermitRepo _visitPermitRepo = getIt();
  final LocalUserData saveUserData = getIt();

  TextEditingController visitDateController =TextEditingController();
  TextEditingController numberOfDaysController =TextEditingController();
  TextEditingController permitStatusController =TextEditingController();
  TextEditingController driverNameController =TextEditingController();
  TextEditingController detailsController =TextEditingController();
  TextEditingController mobileNumberController =TextEditingController();

  OneSector? selectedSector;
  OneVilla? selectedVilla;
  OneVilla? selectedBeach;

  bool openVisitor = true;   // for open visitor card
  bool openMaterial = true;    // for open material card

  // for show or hide visitors and materials
  bool isSwitchVisitors = false;
  bool isSwitchMaterials = false;

  List<AddVisitor> visitorsList = [AddVisitor(name: '', idNo: '',phoneCode:'',phone: '')];
  List<AddMaterial> materialList = [AddMaterial(name: '',qty:'' )];

  bool sendClient=false;
  bool sendProvider=false;

  OneVisitPermitModel? _oneVisitPermitModel;
  OneVisitPermitModel? get oneVisitPermitModel => _oneVisitPermitModel;


  AddContractViewModel addContractProvider=getIt();
  void initAddVisitPermit(){
    WidgetsBinding.instance.addPostFrameCallback((_){
      addContractProvider.getAllSectors();
    });
    visitDateController.clear();
    selectedSector=null;
    selectedVilla=null;
    selectedBeach=null;
    numberOfDaysController.clear();
    permitStatusController.clear();
    driverNameController.clear();
    detailsController.clear();
    mobileNumberController.clear();
    isSwitchVisitors = false;
    isSwitchMaterials = false;
    visitorsList.clear();
    materialList.clear();
    visitorsList = [AddVisitor(name: '', idNo: '',phoneCode:'',phone: '')];
    materialList = [AddMaterial(name: '',qty:'' )];
    sendClient=false;
    sendProvider=false;
  }
  String phoneCode = '+966';
  String flag = AppAssets.flagIcon ;
  void selectedCountryCodeAndFlag (String newPhoneCode,newFlag) {
    phoneCode = newPhoneCode;
    flag = newFlag;
    notifyListeners();
  }
  Future<void> addVisitPermit () async {
    notifyListeners();
    AddVisitPermitBody addVisitPermitBody = AddVisitPermitBody();
    addVisitPermitBody.visitDate=visitDateController.text;
    addVisitPermitBody.sectorId=selectedSector?.id.toString();
    addVisitPermitBody.villaId=selectedVilla?.id.toString();
    addVisitPermitBody.beachId=selectedBeach?.id.toString();
    addVisitPermitBody.daysCount=numberOfDaysController.text;
    addVisitPermitBody.status=permitStatusController.text;
    addVisitPermitBody.driverName=driverNameController.text;
    addVisitPermitBody.note=detailsController.text;
    addVisitPermitBody.phone=mobileNumberController.text;
    addVisitPermitBody.phoneCode=phoneCode;
    addVisitPermitBody.visitorsSwitch=(isSwitchVisitors==true)?1.toString():0.toString();
    addVisitPermitBody.materialsSwitch=(isSwitchMaterials==true)?1.toString():0.toString();
    addVisitPermitBody.visitor=visitorsList;
    addVisitPermitBody.material=materialList;
    addVisitPermitBody.sendClient=sendClient;
    addVisitPermitBody.sendProvider=sendProvider;


    ProgressDialog dialog = createProgressDialog(msg: "${AppTranslate.addVisitPermit.tr()} ...");
    await dialog.show();
    ApiResponse responseModel = await _visitPermitRepo.addVisitPermitRepo(addVisitPermitBody);
    await dialog.hide();
    if (responseModel.response != null && responseModel.response?.statusCode == 200) {
      _oneVisitPermitModel = OneVisitPermitModel.fromJson(responseModel.response?.data);
      notifyListeners();
      if (_oneVisitPermitModel != null && _oneVisitPermitModel?.code == 200) {
        VisitPermitViewModel visitPermitProvider =getIt();
        visitPermitProvider.initVisitPermit();
        NavigatorHandler.pushAndRemoveUntil(BottomNavBar(bottomNavIndex: 1));
        // contractProvider.isContract=1;
        // await contractProvider.pageController.animateToPage(contractProvider.isContract,
        //     duration: const Duration(seconds: 1),
        //     curve: Curves.easeInOut);
        if(kDebugMode){
          CustomScaffoldMessanger.showToast(title: 'الله ينور ياعمناااا <<<<<<<<<<');
        }
        notifyListeners();
      } else{
        CustomScaffoldMessanger.showToast(title: _oneVisitPermitModel?.message??'');
      }
      notifyListeners();
    }
    else {
      CustomScaffoldMessanger.showScaffoledMessanger(title: responseModel.error,bg: Colors.red,fontColor: Colors.white);
    }
    notifyListeners();
  }
 VisitPermitViewModel visitPermitProvider = getIt();

  initUpdateVisitPermit(String id){
    // visitPermitProvider.oneVisitPermit(id);
    visitDateController.text=visitPermitProvider.oneVisitPermitModel?.data?.visitDate??'';
    selectedSector=visitPermitProvider.oneVisitPermitModel?.data?.sector;
    selectedVilla=visitPermitProvider.oneVisitPermitModel?.data?.villa;
    selectedBeach=visitPermitProvider.oneVisitPermitModel?.data?.beach;
    numberOfDaysController.text=visitPermitProvider.oneVisitPermitModel?.data?.daysCount.toString()??'';
    permitStatusController.text=visitPermitProvider.oneVisitPermitModel?.data?.status??'';
    driverNameController.text=visitPermitProvider.oneVisitPermitModel?.data?.driverName??'';
    isSwitchVisitors=visitPermitProvider.oneVisitPermitModel?.data?.visitors==[]?false:true;
    isSwitchMaterials=visitPermitProvider.oneVisitPermitModel?.data?.materials==[]?false:true;
    visitorsList=visitPermitProvider.oneVisitPermitModel!.data!.visitors!;
    // materialList=visitPermitProvider.oneVisitPermitModel!.data!.materials!;

  }
  Future<void> updateVisitPermit (id) async {
    notifyListeners();
    AddVisitPermitBody addVisitPermitBody = AddVisitPermitBody();
    addVisitPermitBody.visitDate=visitDateController.text;
    addVisitPermitBody.sectorId=selectedSector?.id.toString();
    addVisitPermitBody.villaId=selectedVilla?.id.toString();
    addVisitPermitBody.beachId=selectedBeach?.id.toString();
    addVisitPermitBody.daysCount=numberOfDaysController.text;
    addVisitPermitBody.status=permitStatusController.text;
    addVisitPermitBody.driverName=driverNameController.text;
    addVisitPermitBody.note=detailsController.text;
    addVisitPermitBody.phone=mobileNumberController.text;
    addVisitPermitBody.phoneCode=phoneCode;
    addVisitPermitBody.visitorsSwitch=(isSwitchVisitors==true)?1.toString():0.toString();
    addVisitPermitBody.materialsSwitch=(isSwitchMaterials==true)?1.toString():0.toString();
    addVisitPermitBody.visitor=visitorsList;
    addVisitPermitBody.material=materialList;
    addVisitPermitBody.sendClient=sendClient;
    addVisitPermitBody.sendProvider=sendProvider;


    ProgressDialog dialog = createProgressDialog(msg: "${AppTranslate.confirm.tr()} ...");
    await dialog.show();
    ApiResponse responseModel = await _visitPermitRepo.updateVisitPermitRepo(id,addVisitPermitBody);
    await dialog.hide();
    if (responseModel.response != null && responseModel.response?.statusCode == 200) {
      _oneVisitPermitModel = OneVisitPermitModel.fromJson(responseModel.response?.data);
      notifyListeners();
      if (_oneVisitPermitModel != null && _oneVisitPermitModel?.code == 200) {
        VisitPermitViewModel visitPermitProvider =getIt();
        visitPermitProvider.initVisitPermit();
        NavigatorHandler.pushAndRemoveUntil(BottomNavBar(bottomNavIndex: 1));
        // contractProvider.isContract=1;
        // await contractProvider.pageController.animateToPage(contractProvider.isContract,
        //     duration: const Duration(seconds: 1),
        //     curve: Curves.easeInOut);
        if(kDebugMode){
          CustomScaffoldMessanger.showToast(title: 'الله ينور ياعمناااا <<<<<<<<<<');
        }
        notifyListeners();
      } else{
        CustomScaffoldMessanger.showToast(title: _oneVisitPermitModel?.message??'');
      }
      notifyListeners();
    }
    else {
      CustomScaffoldMessanger.showScaffoledMessanger(title: responseModel.error,bg: Colors.red,fontColor: Colors.white);
    }
    notifyListeners();
  }

addVisitPermitValidation(){
    if(visitDateController.text.isEmpty){
      CustomScaffoldMessanger.showToast(title: AppTranslate.enterDateOfVisit.tr());
    }else if(selectedSector==null){
      CustomScaffoldMessanger.showToast(title: AppTranslate.selectSector.tr());
    }else if(selectedVilla==null){
      CustomScaffoldMessanger.showToast(title: AppTranslate.villaIsRequired.tr());
    }else if( selectedBeach==null){
      CustomScaffoldMessanger.showToast(title: AppTranslate.beachIsRequired.tr());
    }else if( numberOfDaysController.text.isEmpty){
      CustomScaffoldMessanger.showToast(title: AppTranslate.enterNumberOfDays.tr());
    }else if( permitStatusController.text.isEmpty){
      CustomScaffoldMessanger.showToast(title: AppTranslate.enterPermitStatus.tr());
    }else if( driverNameController.text.isEmpty){
      CustomScaffoldMessanger.showToast(title: AppTranslate.enterDriverName.tr());
    }else if(mobileNumberController.text.isEmpty){
      CustomScaffoldMessanger.showToast(title: AppTranslate.phoneNumberRequired.tr());
    }else{
      addVisitPermit();
    }
}

  void refreshData(){
  notifyListeners();
}

}