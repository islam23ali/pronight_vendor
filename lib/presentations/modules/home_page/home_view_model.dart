import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pronight_vendor/data/datasource/local/LocalUserData.dart';
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


  bool get isLoading => _isLoading;
  ReportsModel? get reportsModel => _reportsModel;

  initHome(){
    searchController.clear();
    WidgetsBinding.instance.addPostFrameCallback((_){
      allReports();
    });
  }

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


}