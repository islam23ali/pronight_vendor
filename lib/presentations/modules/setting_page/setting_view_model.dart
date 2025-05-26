import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';
import 'package:pronight_vendor/core/navigator/navigator.dart';
import 'package:pronight_vendor/data/datasource/local/LocalUserData.dart';
import 'package:pronight_vendor/data/models/response/empty_model.dart';
import 'package:pronight_vendor/data/models/response/home_model.dart';
import 'package:pronight_vendor/data/repositories/home_repo.dart';
import 'package:pronight_vendor/data/repositories/setting_repo.dart';
import '../../../../data/models/api_response.dart';
import '../../../../injection.dart';
import '../../../core/resources/app_translate.dart';
import '../../../data/models/response/all_reservation_model.dart';
import '../../../data/models/response/reservation_details_model.dart';
import '../../../data/models/response/setting_model.dart';
import '../../../data/models/response/statistics_model.dart';
import '../../components/loadings/custom_scaffold_messanger.dart';
import '../../components/loadings/progress_dialog.dart';

class SettingsViewModel extends ChangeNotifier{
  TextEditingController searchController =TextEditingController();
  final HomeRepo _homeRepo = getIt();
  final SettingRepo _settingRepo = getIt();
  final LocalUserData saveUserData = getIt();


  bool _isLoading = false;
  bool _isReservationLoading = false;
  EmptyModel? _emptyModel;
  EmptyModel? _sendComplains;
  SettingsModel? _settingsModel;
  ReservationsModel? _reservationsModel;
  ReservationDetailsModel? _reservationDetailsModel;
  StatisticsModel? _statisticsModel;


  bool get isLoading => _isLoading;
  bool get isReservationLoading => _isReservationLoading;
  ReservationsModel? get reservationsModel => _reservationsModel;
  ReservationDetailsModel? get reservationDetailsModel => _reservationDetailsModel;
  SettingsModel? get settingsModel => _settingsModel;
  StatisticsModel? get statisticsModel => _statisticsModel;

  // for send complains
  TextEditingController nameController=TextEditingController();   // for send complains and contact us
  TextEditingController emailController=TextEditingController();  // for send complains and contact us
  TextEditingController messageController=TextEditingController();  // for send complains and contact us
  TextEditingController titleController=TextEditingController();


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


  Future<void> getAllSetting () async {
    _isLoading=true;
    notifyListeners();
    ApiResponse responseModel = await _settingRepo.settingRepo();
    if (responseModel.response != null && responseModel.response?.statusCode == 200) {
      _isLoading=false;
      notifyListeners();
      _settingsModel = SettingsModel.fromJson(responseModel.response?.data);
      notifyListeners();
      if (_settingsModel != null && _settingsModel?.code == 200) {
        allReservation();
        if(kDebugMode){
          CustomScaffoldMessanger.showToast(title: _settingsModel?.message??'');
        }
        // allContractsList=_reportsModel?.data;
      } else{
        CustomScaffoldMessanger.showToast(title: _settingsModel?.message??'');
      }
      notifyListeners();
    }
    else {
      CustomScaffoldMessanger.showScaffoledMessanger(title: responseModel.error,bg: Colors.red,fontColor: Colors.white);
    }
    notifyListeners();
  }


  Future<void> copyToClipboard(String text) async {
    await Clipboard.setData(ClipboardData(text: text));
    CustomScaffoldMessanger.showToast(title: AppTranslate.copiedToClipboard.tr());
    notifyListeners();
  }
  Future<void> getAllStatistics () async {
    _isLoading=true;
    notifyListeners();
    ApiResponse responseModel = await _settingRepo.statisticsRepo();
    if (responseModel.response != null && responseModel.response?.statusCode == 200) {
      _isLoading=false;
      notifyListeners();
    _statisticsModel = StatisticsModel.fromJson(responseModel.response?.data);
      if (_statisticsModel != null && _statisticsModel?.code == 200) {

        if(kDebugMode){
          CustomScaffoldMessanger.showToast(title: _statisticsModel?.message??'');
        }

      } else{
        CustomScaffoldMessanger.showToast(title: _statisticsModel?.message??'');
      }
      notifyListeners();
    }
    else {
      CustomScaffoldMessanger.showScaffoledMessanger(title: responseModel.error,bg: Colors.red,fontColor: Colors.white);
    }
    notifyListeners();
  }

  initSendComplain(){
    nameController.clear();
    emailController.clear();
    messageController.clear();
    notifyListeners();
  }
  Future<void> sendComplaints () async {
    notifyListeners();
    ProgressDialog dialog = createProgressDialog(msg: "${AppTranslate.send.tr()} ...");
    await dialog.show();
    ApiResponse responseModel = await _settingRepo.sendComplaintsRepo(nameController.text,emailController.text,messageController.text);
    await dialog.hide();
    if (responseModel.response != null && responseModel.response?.statusCode == 200) {
      notifyListeners();
      _sendComplains = EmptyModel.fromJson(responseModel.response?.data);
      if (_sendComplains != null && _sendComplains?.code == 200) {
        NavigatorHandler.pop();
        if(kDebugMode){
          CustomScaffoldMessanger.showToast(title: _sendComplains?.message??'');
        }

      } else{
        CustomScaffoldMessanger.showToast(title: _sendComplains?.message??'');
      }
      notifyListeners();
    }
    else {
      CustomScaffoldMessanger.showScaffoledMessanger(title: responseModel.error,bg: Colors.red,fontColor: Colors.white);
    }
    notifyListeners();
  }

  initContactUs(){
    nameController.clear();
    emailController.clear();
    messageController.clear();
    titleController.clear();
    notifyListeners();
  }
  Future<void> contactUs () async {
    notifyListeners();
    ProgressDialog dialog = createProgressDialog(msg: "${AppTranslate.send.tr()} ...");
    await dialog.show();
    ApiResponse responseModel = await _settingRepo.contactUsRepo(nameController.text,emailController.text,titleController.text,messageController.text);
    await dialog.hide();
    if (responseModel.response != null && responseModel.response?.statusCode == 200) {
      notifyListeners();
      _sendComplains = EmptyModel.fromJson(responseModel.response?.data);
      if (_sendComplains != null && _sendComplains?.code == 200) {
        NavigatorHandler.pop();
        if(kDebugMode){
          CustomScaffoldMessanger.showToast(title: _sendComplains?.message??'');
        }

      } else{
        CustomScaffoldMessanger.showToast(title: _sendComplains?.message??'');
      }
      notifyListeners();
    }
    else {
      CustomScaffoldMessanger.showScaffoledMessanger(title: responseModel.error,bg: Colors.red,fontColor: Colors.white);
    }
    notifyListeners();
  }





}