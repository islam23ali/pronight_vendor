import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pronight_vendor/data/datasource/local/LocalUserData.dart';
import 'package:pronight_vendor/data/repositories/contract_repo.dart';
import '../../../../data/models/api_response.dart';
import '../../../../injection.dart';
import '../../../data/models/response/all_conntracts_model.dart';
import '../../../data/models/response/one_contract_model.dart';
import '../../components/loadings/custom_scaffold_messanger.dart';

class ContractViewModel extends ChangeNotifier{
  TextEditingController searchController =TextEditingController();
  final ContractRepo _contractRepo = getIt();
  final LocalUserData saveUserData = getIt();

  bool _isLoading = false;
  AllContractsModel? _allContractsModel;
  OneContractModel? _oneContractModel;

  bool get isLoading => _isLoading;
  AllContractsModel? get allContractsModel => _allContractsModel;
  OneContractModel? get oneContractModel => _oneContractModel;

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
}