import 'dart:async';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';
import 'package:pronight_vendor/core/navigator/navigator.dart';
import 'package:pronight_vendor/core/resources/app_translate.dart';
import 'package:pronight_vendor/core/utils/social_media_helper.dart';
import 'package:pronight_vendor/data/datasource/local/LocalUserData.dart';
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


  final pageController = PageController(initialPage: 0);
  int isContract = 0;

  bool _isLoading = false;
  AllContractsModel? _allContractsModel;
  OneContractModel? _oneContractModel;
  SendCodeModel? _printContractModel;
  EmptyModel? _deleteContract;
  bool _isLoadMore = false;

  bool get isLoadMore => _isLoadMore;
  bool get isLoading => _isLoading;
  AllContractsModel? get allContractsModel => _allContractsModel;
  OneContractModel? get oneContractModel => _oneContractModel;
  SocialMediaHelper socialMediaHelper =SocialMediaHelper();
  initContracts(){
    page = 1;
    controller.addListener(listener);
    cancelToken = null;
    cancelTokenLoadMore = null;
    allContractsList=[];
    searchController.clear();
    WidgetsBinding.instance.addPostFrameCallback((_){
      allContracts();
    });
  }
  final ScrollController controller = ScrollController();
  int page = 1;
  CancelToken? cancelToken, cancelTokenLoadMore;


  List<OneContract?>? allContractsList =[];
  Future<void> allContracts () async {
    _isLoading = true;
    allContractsList = [];
    cancelToken ??= CancelToken();
    notifyListeners();
    ApiResponse responseModel = await _contractRepo.allContractRepo(searchController.text,page.toString());
    if (responseModel.response != null && responseModel.response?.statusCode == 200) {
      _allContractsModel = AllContractsModel.fromJson(responseModel.response?.data);
      _isLoading = false;
      notifyListeners();
      if (_allContractsModel != null && _allContractsModel?.code == 200) {
        allContractsList?.addAll(_allContractsModel?.data??[]);
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

  Future<void> loadMoreUnits(int page) async {
    try {
      _isLoadMore = true;

      allContractsList?.add(null);
      cancelTokenLoadMore ??= CancelToken();
      notifyListeners();

      ApiResponse responseModel = await _contractRepo.allContractRepo(searchController.text,page.toString());
      if (allContractsList?.last == null) {
        allContractsList?.removeLast();
      }
      cancelTokenLoadMore = null;
      if (responseModel.response != null &&
          responseModel.response?.statusCode == 200) {
        AllContractsModel notificationModel =
        AllContractsModel.fromJson(responseModel.response?.data);
        if (notificationModel.code == 200) {
          List<OneContract> list = [];
          list.addAll(notificationModel.data ?? []);
          if (list.isNotEmpty) {
            allContractsList?.addAll(list);
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
      if (allContractsList?.last == null) {
        allContractsList?.removeLast();
      }
      _isLoadMore = false;
      cancelTokenLoadMore = null;
      notifyListeners();
      print('getnotificationLoadMoreError=>>>$e');
    }
    return;
  }
  void listener() {
    if (controller.position.pixels == controller.position.maxScrollExtent && isLoadMore == false && (allContractsList?.length??0) > 9) {
      int p = page + 1;
      loadMoreUnits(p);
    }
  }
}