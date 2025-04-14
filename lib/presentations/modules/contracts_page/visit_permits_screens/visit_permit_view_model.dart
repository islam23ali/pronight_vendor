import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';
import 'package:pronight_vendor/data/datasource/local/LocalUserData.dart';
import 'package:pronight_vendor/data/repositories/visit_permit_repo.dart';
import '../../../../core/navigator/navigator.dart';
import '../../../../core/resources/app_translate.dart';
import '../../../../data/models/api_response.dart';
import '../../../../data/models/response/empty_model.dart';
import '../../../../data/models/response/one_visit_permit_model.dart';
import '../../../../data/models/response/send_code_model.dart';
import '../../../../injection.dart';
import '../../../components/loadings/custom_scaffold_messanger.dart';
import '../../../components/loadings/progress_dialog.dart';
import '../contract_screens/print_wepview/print_item_wep_view.dart';

class VisitPermitViewModel extends ChangeNotifier{
  TextEditingController searchController =TextEditingController();
  final VisitPermitRepo _visitPermitRepo = getIt();
  final LocalUserData saveUserData = getIt();

  bool _isLoading = false;

  OneVisitPermitModel? _oneVisitPermitModel;
  SendCodeModel? _printVisitPermit;
  EmptyModel? _deleteVisitPermit;

  bool get isLoading => _isLoading;
  OneVisitPermitModel? get oneVisitPermitModel => _oneVisitPermitModel;
  SendCodeModel? get printVisitPermit => _printVisitPermit;
  EmptyModel? get deleteVisitPermit => _deleteVisitPermit;

  Future<void> oneVisitPermit (String id) async {
    _isLoading = true;
    notifyListeners();
    ApiResponse responseModel = await _visitPermitRepo.oneVisitPermitRepo(id);
    if (responseModel.response != null && responseModel.response?.statusCode == 200) {
      _oneVisitPermitModel = OneVisitPermitModel.fromJson(responseModel.response?.data);
      _isLoading = false;
      notifyListeners();
      if (_oneVisitPermitModel != null && _oneVisitPermitModel?.code == 200) {

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

  Future<void> printContract (String id) async {
    notifyListeners();
    ProgressDialog dialog = createProgressDialog(msg: "${AppTranslate.confirm.tr()} ...");
    await dialog.show();
    ApiResponse responseModel = await _visitPermitRepo.printVisitPermitRepo(id);
    await dialog.hide();
    if (responseModel.response != null && responseModel.response?.statusCode == 200) {
      _printVisitPermit = SendCodeModel.fromJson(responseModel.response?.data);
      notifyListeners();
      if (_printVisitPermit != null && _printVisitPermit?.code == 200) {
        NavigatorHandler.push(WebViewScreen(title: AppTranslate.print.tr(),
            url:_printVisitPermit?.data??''));
      } else{
        CustomScaffoldMessanger.showToast(title: _printVisitPermit?.message??'');
      }
      notifyListeners();
    }
    else {
      CustomScaffoldMessanger.showScaffoledMessanger(title: responseModel.error,bg: Colors.red,fontColor: Colors.white);
    }
    notifyListeners();
  }

  Future<void> deleteVisitPermitApi (String id) async {
    notifyListeners();
    ProgressDialog dialog = createProgressDialog(msg: "${AppTranslate.delete.tr()} ...");
    await dialog.show();
    ApiResponse responseModel = await _visitPermitRepo.deleteVisitPermitRepo(id);
    await dialog.hide();
    if (responseModel.response != null && responseModel.response?.statusCode == 200) {
      _deleteVisitPermit = EmptyModel.fromJson(responseModel.response?.data);
      notifyListeners();
      if (_deleteVisitPermit != null && _deleteVisitPermit?.code == 200) {
        NavigatorHandler.pop();
        // allVisitPermit();
        notifyListeners();
      } else{
        CustomScaffoldMessanger.showToast(title: _deleteVisitPermit?.message??'');
      }
      notifyListeners();
    }
    else {
      CustomScaffoldMessanger.showScaffoledMessanger(title: responseModel.error,bg: Colors.red,fontColor: Colors.white);
    }
    notifyListeners();
  }

}