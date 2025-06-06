import 'dart:async';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';
import 'package:pronight_vendor/data/datasource/local/LocalUserData.dart';
import 'package:pronight_vendor/data/repositories/visit_permit_repo.dart';
import '../../../../core/navigator/navigator.dart';
import '../../../../core/resources/app_translate.dart';
import '../../../../data/models/api_response.dart';
import '../../../../data/models/response/all_visit_permits_model.dart';
import '../../../../data/models/response/empty_model.dart';
import '../../../../data/models/response/one_visit_permit_model.dart';
import '../../../../data/models/response/send_code_model.dart';
import '../../../../injection.dart';
import '../../../components/loadings/custom_scaffold_messanger.dart';
import '../../../components/loadings/progress_dialog.dart';
import '../contract_screens/print_wepview/print_item_wep_view.dart';

class VisitPermitViewModel extends ChangeNotifier{
  TextEditingController searchVisitPermitController =TextEditingController();
  final VisitPermitRepo _visitPermitRepo = getIt();
  final LocalUserData saveUserData = getIt();

  bool _isLoading = false;

  VisitPermitsModel? _visitPermitsModel;
  OneVisitPermitModel? _oneVisitPermitModel;
  SendCodeModel? _printVisitPermit;
  EmptyModel? _deleteVisitPermit;
  EmptyModel? _deleteVisitor;
  EmptyModel? _deleteMaterial;
  bool _isLoadMore = false;

  bool get isLoadMore => _isLoadMore;
  bool get isLoading => _isLoading;
  OneVisitPermitModel? get oneVisitPermitModel => _oneVisitPermitModel;
  VisitPermitsModel? get visitPermitsModel => _visitPermitsModel;
  SendCodeModel? get printVisitPermit => _printVisitPermit;
  EmptyModel? get deleteVisitPermit => _deleteVisitPermit;

  final ScrollController controller = ScrollController();
  int page = 1;
  CancelToken? cancelToken, cancelTokenLoadMore;
  List<OneVisitPermit?>? allVisitPermitList =[];

  initVisitPermit(){
    page = 1;
    controller.addListener(listener);
    cancelToken = null;
    cancelTokenLoadMore = null;
    allVisitPermitList=[];
    searchVisitPermitController.clear();
    allVisitPermit();
  }

  Future<void> allVisitPermit () async {
    _isLoading = true;
    allVisitPermitList = [];
    cancelToken ??= CancelToken();
    notifyListeners();
    ApiResponse responseModel = await _visitPermitRepo.allVisitPermitRepo(searchVisitPermitController.text,page.toString());
    if (responseModel.response != null && responseModel.response?.statusCode == 200) {
      _visitPermitsModel = VisitPermitsModel.fromJson(responseModel.response?.data);
      _isLoading = false;
      notifyListeners();
      if (_visitPermitsModel != null && _visitPermitsModel?.code == 200) {
        allVisitPermitList?.addAll(_visitPermitsModel?.data??[]);
      } else{
        CustomScaffoldMessanger.showToast(title: _visitPermitsModel?.message??'');
      }
      notifyListeners();
    }
    else {
      CustomScaffoldMessanger.showScaffoledMessanger(title: responseModel.error,bg: Colors.red,fontColor: Colors.white);
    }
    notifyListeners();
  }

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

  Future<void> deleteVisitorApi (String visitorId) async {
    notifyListeners();
    ProgressDialog dialog = createProgressDialog(msg: "${AppTranslate.delete.tr()} ...");
    await dialog.show();
    ApiResponse responseModel = await _visitPermitRepo.deleteVisitorRepo(visitorId);
    await dialog.hide();
    if (responseModel.response != null && responseModel.response?.statusCode == 200) {
      _deleteVisitor = EmptyModel.fromJson(responseModel.response?.data);
      notifyListeners();
      if (_deleteVisitor != null && _deleteVisitor?.code == 200) {
        NavigatorHandler.pop();
        // allVisitPermit();
        notifyListeners();
      } else{
        CustomScaffoldMessanger.showToast(title: _deleteVisitor?.message??'');
      }
      notifyListeners();
    }
    else {
      CustomScaffoldMessanger.showScaffoledMessanger(title: responseModel.error,bg: Colors.red,fontColor: Colors.white);
    }
    notifyListeners();
  }

  Future<void> deleteMaterialApi (String visitorId) async {
    notifyListeners();
    ProgressDialog dialog = createProgressDialog(msg: "${AppTranslate.delete.tr()} ...");
    await dialog.show();
    ApiResponse responseModel = await _visitPermitRepo.deleteMaterialRepo(visitorId);
    await dialog.hide();
    if (responseModel.response != null && responseModel.response?.statusCode == 200) {
      _deleteMaterial = EmptyModel.fromJson(responseModel.response?.data);
      notifyListeners();
      if (_deleteMaterial != null && _deleteMaterial?.code == 200) {
        NavigatorHandler.pop();
        // allVisitPermit();
        notifyListeners();
      } else{
        CustomScaffoldMessanger.showToast(title: _deleteMaterial?.message??'');
      }
      notifyListeners();
    }
    else {
      CustomScaffoldMessanger.showScaffoledMessanger(title: responseModel.error,bg: Colors.red,fontColor: Colors.white);
    }
    notifyListeners();
  }

  Future<void> loadMoreUnits(int page) async {
    try {
      _isLoadMore = true;

      allVisitPermitList?.add(null);
      cancelTokenLoadMore ??= CancelToken();
      notifyListeners();

      ApiResponse responseModel = await _visitPermitRepo.allVisitPermitRepo(searchVisitPermitController.text,page.toString());
      if (allVisitPermitList?.last == null) {
        allVisitPermitList?.removeLast();
      }
      cancelTokenLoadMore = null;
      if (responseModel.response != null &&
          responseModel.response?.statusCode == 200) {
        VisitPermitsModel notificationModel =
        VisitPermitsModel.fromJson(responseModel.response?.data);
        if (notificationModel.code == 200) {
          List<OneVisitPermit> list = [];
          list.addAll(notificationModel.data ?? []);
          if (list.isNotEmpty) {
            allVisitPermitList?.addAll(list);
            this.page = page;
          }
        } else {
          CustomScaffoldMessanger.showToast(title: notificationModel.message ?? '');
        }
      } else {
        CustomScaffoldMessanger.showToast(title: responseModel.error,bg: Colors.red,fontColor: Colors.white);
      }
      _isLoadMore = false;
      notifyListeners();
    } catch (e) {
      if (allVisitPermitList?.last == null) {
        allVisitPermitList?.removeLast();
      }
      _isLoadMore = false;
      cancelTokenLoadMore = null;
      notifyListeners();
      print('getnotificationLoadMoreError=>>>$e');
    }
    return;
  }
  void listener() {
    if (controller.position.pixels == controller.position.maxScrollExtent && isLoadMore == false && (allVisitPermitList?.length??0) > 9) {
      int p = page + 1;
      loadMoreUnits(p);
    }
  }

}