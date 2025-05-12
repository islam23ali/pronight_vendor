import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';
import 'package:pronight_vendor/data/datasource/local/LocalUserData.dart';
import 'package:pronight_vendor/data/models/response/empty_model.dart';
import 'package:pronight_vendor/data/repositories/home_repo.dart';
import '../../../../data/models/api_response.dart';
import '../../../../injection.dart';
import '../../../core/resources/app_translate.dart';
import '../../../data/models/response/all_reservation_model.dart';
import '../../../data/models/response/reports_model.dart';
import '../../../data/models/response/reservation_details_model.dart';
import '../../components/loadings/custom_scaffold_messanger.dart';
import '../../components/loadings/progress_dialog.dart';

class HomeViewModel extends ChangeNotifier{
  TextEditingController searchController =TextEditingController();
  final HomeRepo _homeRepo = getIt();
  final LocalUserData saveUserData = getIt();


  bool _isLoading = false;
  bool _isReservationLoading = false;
   ReportsModel? _reportsModel;
   EmptyModel? _emptyModel;
   ReservationsModel? _reservationsModel;
   ReservationDetailsModel? _reservationDetailsModel;


  bool get isLoading => _isLoading;
  bool get isReservationLoading => _isReservationLoading;
  ReportsModel? get reportsModel => _reportsModel;
  ReservationsModel? get reservationsModel => _reservationsModel;
  ReservationDetailsModel? get reservationDetailsModel => _reservationDetailsModel;

  initHome(){
    searchController.clear();
    WidgetsBinding.instance.addPostFrameCallback((_){
      allReports();
    });
    initReservation();
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

  String reservationType ='new';
  updateReservationType(String type){
    reservationType=type;
    notifyListeners();
  }

  initReservation(){
WidgetsBinding.instance.addPostFrameCallback((_){
  updateReservationType('new');
  allReservation();
});

  }
  Future<void> allReservation () async {
    _isReservationLoading = true;
    notifyListeners();
    ApiResponse responseModel = await _homeRepo.allReservationRepo(reservationType);
    if (responseModel.response != null && responseModel.response?.statusCode == 200) {
      _reservationsModel = ReservationsModel.fromJson(responseModel.response?.data);
      _isReservationLoading = false;
      notifyListeners();
      if (_reservationsModel != null && _reservationsModel?.code == 200) {
        if(kDebugMode){
          CustomScaffoldMessanger.showToast(title: _reservationsModel?.message??'');
        }
        // allContractsList=_reportsModel?.data;
      } else{
        CustomScaffoldMessanger.showToast(title: _reservationsModel?.message??'');
      }
      notifyListeners();
    }
    else {
      CustomScaffoldMessanger.showScaffoledMessanger(title: responseModel.error,bg: Colors.red,fontColor: Colors.white);
    }
    notifyListeners();
  }

  Future<void> reservationDetails (id) async {
    _isLoading = true;
    notifyListeners();
    ApiResponse responseModel = await _homeRepo.reservationDetailsRepo(id);
    if (responseModel.response != null && responseModel.response?.statusCode == 200) {
      _reservationDetailsModel = ReservationDetailsModel.fromJson(responseModel.response?.data);
      _isLoading = false;
      notifyListeners();
      if (_reservationDetailsModel != null && _reservationDetailsModel?.code == 200) {
        if(kDebugMode){
          CustomScaffoldMessanger.showToast(title: _reservationDetailsModel?.message??'');
        }
        // allContractsList=_reportsModel?.data;
      } else{
        CustomScaffoldMessanger.showToast(title: _reservationDetailsModel?.message??'');
      }
      notifyListeners();
    }
    else {
      CustomScaffoldMessanger.showScaffoledMessanger(title: responseModel.error,bg: Colors.red,fontColor: Colors.white);
    }
    notifyListeners();
  }

  Future<void> updateReservationStatus (id,status) async {
    notifyListeners();
    ProgressDialog dialog = createProgressDialog(msg: "${AppTranslate.send.tr()} ...");
    await dialog.show();
    ApiResponse responseModel = await _homeRepo.updateReservationStatusRepo(id,status);
    await dialog.hide();
    if (responseModel.response != null && responseModel.response?.statusCode == 200) {
      _emptyModel = EmptyModel.fromJson(responseModel.response?.data);
      notifyListeners();
      if (_emptyModel != null && _emptyModel?.code == 200) {
        allReservation();
        if(kDebugMode){
          CustomScaffoldMessanger.showToast(title: _emptyModel?.message??'');
        }
        // allContractsList=_reportsModel?.data;
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


}