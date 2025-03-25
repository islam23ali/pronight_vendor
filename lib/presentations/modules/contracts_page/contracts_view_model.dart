import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';
import 'package:pronight_vendor/core/navigator/navigator.dart';
import 'package:pronight_vendor/core/resources/app_translate.dart';
import 'package:pronight_vendor/core/utils/social_media_helper.dart';
import 'package:pronight_vendor/data/datasource/local/LocalUserData.dart';
import 'package:pronight_vendor/data/models/body_or_quary/add_contract_body.dart';
import 'package:pronight_vendor/data/models/response/empty_model.dart';
import 'package:pronight_vendor/data/repositories/contract_repo.dart';
import '../../../../data/models/api_response.dart';
import '../../../../injection.dart';
import '../../../data/models/response/all_conntracts_model.dart';
import '../../../data/models/response/one_contract_model.dart';
import '../../../data/models/response/send_code_model.dart';
import '../../components/loadings/custom_scaffold_messanger.dart';
import '../../components/loadings/progress_dialog.dart';
import 'contract_screens/print_wepview/print_item_wep_view.dart';

class ContractViewModel extends ChangeNotifier{
  TextEditingController searchController =TextEditingController();
  final ContractRepo _contractRepo = getIt();
  final LocalUserData saveUserData = getIt();

  bool _isLoading = false;
  AllContractsModel? _allContractsModel;
  OneContractModel? _oneContractModel;
  SendCodeModel? _printContractModel;
  EmptyModel? _deleteContract;

  bool get isLoading => _isLoading;
  AllContractsModel? get allContractsModel => _allContractsModel;
  OneContractModel? get oneContractModel => _oneContractModel;
  SocialMediaHelper socialMediaHelper =SocialMediaHelper();
  initContracts(){
    allContractsList=[];
    searchController.clear();
    allContracts();
  }
  List<OneContract>? allContractsList =[];
  Future<void> allContracts () async {
    _isLoading = true;
    notifyListeners();
    ApiResponse responseModel = await _contractRepo.allContractRepo(searchController.text);
    if (responseModel.response != null && responseModel.response?.statusCode == 200) {
      _allContractsModel = AllContractsModel.fromJson(responseModel.response?.data);
      _isLoading = false;
      notifyListeners();
      if (_allContractsModel != null && _allContractsModel?.code == 200) {
        allContractsList=_allContractsModel?.data;
      } else{
        CustomScaffoldMessanger.showToast(title: _allContractsModel?.message??'');
      }
      notifyListeners();
    }
    else {
      CustomScaffoldMessanger.showScaffoledMessanger(title: responseModel.error,bg: Colors.red,fontColor: Colors.white);
    }
    notifyListeners();
  }
  Future<void> oneContractDetails (String id) async {
    _isLoading = true;
    notifyListeners();
    ApiResponse responseModel = await _contractRepo.oneContractRepo(id);
    if (responseModel.response != null && responseModel.response?.statusCode == 200) {
      _oneContractModel = OneContractModel.fromJson(responseModel.response?.data);
      _isLoading = false;
      notifyListeners();
      if (_oneContractModel != null && _oneContractModel?.code == 200) {

      } else{
        CustomScaffoldMessanger.showToast(title: _oneContractModel?.message??'');
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
    ApiResponse responseModel = await _contractRepo.printContractRepo(id);
    await dialog.hide();
    if (responseModel.response != null && responseModel.response?.statusCode == 200) {
      _printContractModel = SendCodeModel.fromJson(responseModel.response?.data);
      notifyListeners();
      if (_printContractModel != null && _printContractModel?.code == 200) {
        NavigatorHandler.push(WebViewScreen(title: AppTranslate.print.tr(),
            url:_printContractModel?.data??''));
      } else{
        CustomScaffoldMessanger.showToast(title: _printContractModel?.message??'');
      }
      notifyListeners();
    }
    else {
      CustomScaffoldMessanger.showScaffoledMessanger(title: responseModel.error,bg: Colors.red,fontColor: Colors.white);
    }
    notifyListeners();
  }

  Future<void> deleteContract (String id) async {
    notifyListeners();
    ProgressDialog dialog = createProgressDialog(msg: "${AppTranslate.delete.tr()} ...");
    await dialog.show();
    ApiResponse responseModel = await _contractRepo.deleteContractRepo(id);
    await dialog.hide();
    if (responseModel.response != null && responseModel.response?.statusCode == 200) {
      _deleteContract = EmptyModel.fromJson(responseModel.response?.data);
      notifyListeners();
      if (_deleteContract != null && _deleteContract?.code == 200) {
        NavigatorHandler.pop();
        allContracts();
        notifyListeners();
      } else{
        CustomScaffoldMessanger.showToast(title: _deleteContract?.message??'');
      }
      notifyListeners();
    }
    else {
      CustomScaffoldMessanger.showScaffoledMessanger(title: responseModel.error,bg: Colors.red,fontColor: Colors.white);
    }
    notifyListeners();
  }

}