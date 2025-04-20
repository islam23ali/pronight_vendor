import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';
import 'package:pronight_vendor/data/models/body_or_quary/add_visit_permit_body.dart';
import 'package:pronight_vendor/data/models/response/one_visit_permit_model.dart';
import 'package:pronight_vendor/data/repositories/visit_permit_repo.dart';

import '../../../../../core/navigator/navigator.dart';
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

  OneSector? selectedSector;
  OneVilla? selectedVilla;
  OneVilla? selectedBeach;

  List<String>? cityList = ['القاهرة', 'المنوفية'];
  String? value;

  OneVisitPermitModel? _oneVisitPermitModel;
  OneVisitPermitModel? get oneVisitPermitModel => _oneVisitPermitModel;


  AddContractViewModel addContractProvider=getIt();
  void initAddVisitPermit(){
    addContractProvider.getAllSectors();
    selectedVilla=null;
    selectedSector=null;
    addContractProvider.villasModel?.data=null;
    addContractProvider.beachesModel?.data=null;

  }
  Future<void> addVisitPermit () async {
    notifyListeners();
    AddVisitPermitBody addContractBody = AddVisitPermitBody();
    addContractBody.visitDate=visitDateController.text;
    addContractBody.daysCount=numberOfDaysController.text;


    ProgressDialog dialog = createProgressDialog(msg: "${AppTranslate.addVisitPermit.tr()} ...");
    await dialog.show();
    ApiResponse responseModel = await _visitPermitRepo.addVisitPermitRepo(addContractBody);
    await dialog.hide();
    if (responseModel.response != null && responseModel.response?.statusCode == 200) {
      _oneVisitPermitModel = OneVisitPermitModel.fromJson(responseModel.response?.data);
      notifyListeners();
      if (_oneVisitPermitModel != null && _oneVisitPermitModel?.code == 200) {
        NavigatorHandler.pushAndRemoveUntil(BottomNavBar(bottomNavIndex: 1));
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



  void refreshData(){
  notifyListeners();
}

}