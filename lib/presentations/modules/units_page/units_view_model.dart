import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pronight_vendor/data/datasource/local/LocalUserData.dart';
import 'package:pronight_vendor/data/repositories/units_repo.dart';
import '../../../../data/models/api_response.dart';
import '../../../../injection.dart';
import '../../../data/models/response/all_units_model.dart';
import '../../components/loadings/custom_scaffold_messanger.dart';

class UnitsViewModel extends ChangeNotifier{

  final UnitsRepo _unitsRepo = getIt();
  final LocalUserData saveUserData = getIt();

  TextEditingController searchController =TextEditingController();
  final ScrollController controller = ScrollController();

  bool _isLoading = false;
  AllUnitsModel? _allUnitsModel;
  bool _isLoadMore = false;

  bool get isLoadMore => _isLoadMore;
  bool get isLoading => _isLoading;
  // AllUnitsModel? get allUnitsModel => _allUnitsModel;

  int page = 1;
  CancelToken? cancelToken, cancelTokenLoadMore;

  initUnits(){
    page = 1;
    controller.addListener(listener);
    cancelToken = null;
    cancelTokenLoadMore = null;
    allUnitsList=[];
    searchController.clear();
    allUnits();
  }
  List<OneUnit?> allUnitsList =[];

  Future<void> allUnits () async {
    // try {
    //   if (cancelTokenLoadMore != null && !cancelTokenLoadMore!.isCancelled) {
    //     cancelTokenLoadMore!.cancel();
    //     cancelTokenLoadMore = null;
    //   }
      _isLoading = true;
      allUnitsList = [];
      cancelToken ??= CancelToken();
      notifyListeners();
    ApiResponse responseModel = await _unitsRepo.allUnitsRepo(page);
      cancelToken = null;
    if (responseModel.response != null && responseModel.response?.statusCode == 200) {
      _allUnitsModel = AllUnitsModel.fromJson(responseModel.response?.data);
      _isLoading = false;
      notifyListeners();
      if (_allUnitsModel != null && _allUnitsModel?.code == 200) {
        allUnitsList.addAll(_allUnitsModel?.data??[]);
      } else{
        CustomScaffoldMessanger.showToast(title: _allUnitsModel?.message??'');
      }
      notifyListeners();
    }
    else {
      CustomScaffoldMessanger.showScaffoledMessanger(title: responseModel.error,bg: Colors.red,fontColor: Colors.white);
    }
    // }catch(e){
    //   cancelToken = null;
    //   _isLoading = false;
    //   notifyListeners();
    //   print('getnotificationsError=>>>$e');
    // }
    notifyListeners();
  }

  Future<void> loadMoreUnits(int page) async {
    try {
      _isLoadMore = true;

      allUnitsList.add(null);
      cancelTokenLoadMore ??= CancelToken();
      notifyListeners();

      ApiResponse responseModel = await _unitsRepo.allUnitsRepo(page);
      if (allUnitsList.last == null) {
        allUnitsList.removeLast();
      }
      cancelTokenLoadMore = null;
      if (responseModel.response != null &&
          responseModel.response?.statusCode == 200) {
        AllUnitsModel notificationModel =
        AllUnitsModel.fromJson(responseModel.response?.data);
        if (notificationModel.code == 200) {
          List<OneUnit> list = [];
          list.addAll(notificationModel.data ?? []);
          if (list.isNotEmpty) {
            allUnitsList.addAll(list);
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
      if (allUnitsList.last == null) {
        allUnitsList.removeLast();
      }
      _isLoadMore = false;
      cancelTokenLoadMore = null;
      notifyListeners();
      print('getnotificationLoadMoreError=>>>$e');
    }
    return;
  }
  void listener() {
    if (controller.position.pixels == controller.position.maxScrollExtent && isLoadMore == false && allUnitsList.length > 9) {
      int p = page + 1;
      loadMoreUnits(p);
    }
  }
}