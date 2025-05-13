import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pronight_vendor/data/datasource/local/LocalUserData.dart';
import 'package:pronight_vendor/data/models/response/home_model.dart';
import 'package:pronight_vendor/data/repositories/home_repo.dart';
import '../../../../data/models/api_response.dart';
import '../../../../injection.dart';
import '../../../data/models/response/reports_model.dart';
import '../../components/loadings/custom_scaffold_messanger.dart';

class HomeViewModel extends ChangeNotifier{
  TextEditingController searchController =TextEditingController();
  final HomeRepo _homeRepo = getIt();
  final LocalUserData saveUserData = getIt();


  bool _isLoading = false;
   ReportsModel? _reportsModel;
   HomeModel? _homeModel;

  bool get isLoading => _isLoading;
  ReportsModel? get reportsModel => _reportsModel;
  HomeModel? get homeModel => _homeModel;
  initHome(){
    searchController.clear();
    WidgetsBinding.instance.addPostFrameCallback((_){
      allReports();
      getHomeData();
    });}

  Future<void> allReports () async {
    _isLoading = true;
    notifyListeners();
    ApiResponse responseModel = await _homeRepo.allReportsRepo(searchController.text);
    if (responseModel.response != null && responseModel.response?.statusCode == 200) {
      _reportsModel = ReportsModel.fromJson(responseModel.response?.data);
      _isLoading = false;
      notifyListeners();
      if (_reportsModel != null && _reportsModel?.code == 200) {
        // allContractsList=_reportsModel?.data;
      } else{
        CustomScaffoldMessanger.showToast(title: _reportsModel?.message??'');
      }
      notifyListeners();
    }
    else {
      CustomScaffoldMessanger.showScaffoledMessanger(title: responseModel.error,bg: Colors.red,fontColor: Colors.white);
    }
    notifyListeners();
  }

  Future<void> getHomeData () async {
    _isLoading = true;
    notifyListeners();
    ApiResponse responseModel = await _homeRepo.homeDataRepo();
    if (responseModel.response != null && responseModel.response?.statusCode == 200) {
      _homeModel = HomeModel.fromJson(responseModel.response?.data);
      _isLoading = false;
      notifyListeners();
      if (_homeModel != null && _homeModel?.code == 200) {
        if(kDebugMode){
          CustomScaffoldMessanger.showToast(title: _homeModel?.message??'');
        }
        // allContractsList=_reportsModel?.data;
      } else{
        CustomScaffoldMessanger.showToast(title: _homeModel?.message??'');
      }
      notifyListeners();
    }
    else {
      CustomScaffoldMessanger.showScaffoledMessanger(title: responseModel.error,bg: Colors.red,fontColor: Colors.white);
    }
    notifyListeners();
  }




}