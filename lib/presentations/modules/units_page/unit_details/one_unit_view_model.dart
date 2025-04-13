import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pronight_vendor/data/datasource/local/LocalUserData.dart';
import 'package:pronight_vendor/data/repositories/units_repo.dart';
import '../../../../data/models/api_response.dart';
import '../../../../data/models/response/one_unit_model.dart';
import '../../../../injection.dart';
import '../../../components/loadings/custom_scaffold_messanger.dart';
class OneUnitViewModel extends ChangeNotifier{

  final UnitsRepo _unitsRepo = getIt();
  final LocalUserData saveUserData = getIt();

  bool _isLoading = false;
  OneUnitModel? _oneUnitModel;

  bool get isLoading => _isLoading;
  OneUnitModel? get oneUnitModel => _oneUnitModel;

  initOneUnit(String id){
 WidgetsBinding.instance.addPostFrameCallback((timeStamp){
  getOneUnit(id);
  });
  }

  Future<void> getOneUnit (String id) async {
    _isLoading = true;
    notifyListeners();
    ApiResponse responseModel = await _unitsRepo.oneUnitsRepo(id);

    if (responseModel.response != null && responseModel.response?.statusCode == 200) {
      _oneUnitModel = OneUnitModel.fromJson(responseModel.response?.data);
      _isLoading = false;
      notifyListeners();
      if (_oneUnitModel != null && _oneUnitModel?.code == 200) {
        if(kDebugMode){
          CustomScaffoldMessanger.showToast(title: _oneUnitModel?.message??'');
        }
      } else{
        CustomScaffoldMessanger.showToast(title: _oneUnitModel?.message??'');
      }
      notifyListeners();
    }
    else {
      CustomScaffoldMessanger.showScaffoledMessanger(title: responseModel.error,bg: Colors.red,fontColor: Colors.white);
    }
    notifyListeners();
  }


}