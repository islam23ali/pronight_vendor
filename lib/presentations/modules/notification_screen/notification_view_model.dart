import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pronight_vendor/data/datasource/local/LocalUserData.dart';
import 'package:pronight_vendor/data/models/response/empty_model.dart';
import 'package:pronight_vendor/data/models/response/home_model.dart';
import 'package:pronight_vendor/data/repositories/home_repo.dart';
import '../../../../data/models/api_response.dart';
import '../../../../injection.dart';
import '../../../data/models/response/notification_model.dart.dart';
import '../../../data/models/response/one_notification_model.dart';
import '../../../data/models/response/reports_model.dart';
import '../../components/loadings/custom_scaffold_messanger.dart';

class NotificationsViewModel extends ChangeNotifier{
  TextEditingController searchController =TextEditingController();
  final HomeRepo _homeRepo = getIt();
  final LocalUserData saveUserData = getIt();


  bool _isLoading = false;
  bool _isLoadMore = false;
  NotificationModel? _notificationModel;
  EmptyModel? _emptyModel;
  OneNotificationModel? _oneNotificationModel;

  bool get isLoading => _isLoading;
  bool get isLoadMore => _isLoadMore;
  NotificationModel? get notificationModel => _notificationModel;
  OneNotificationModel? get oneNotificationModel => _oneNotificationModel;

  final ScrollController scrollController = ScrollController();
  List<OneNotification?>? notificationsList;
  int page = 1;
  CancelToken? cancelToken, cancelTokenLoadMore;

  initNotifications() {
    page = 1;
    notificationsList =[];
    scrollController.addListener(listener);
    cancelToken = null;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp){
      getAllNotification();
    });
  }

  Future<void> getAllNotification() async {
    _isLoading = true;
    notificationsList = [];
    // controller.dispose();
    cancelToken ??= CancelToken();
    notifyListeners();
    ApiResponse responseModel = await _homeRepo.notificationsRepo(page.toString());
    cancelToken = null;
    notifyListeners();
    if (responseModel.response != null) {
      _notificationModel = NotificationModel.fromJson(responseModel.response?.data);
      if (_notificationModel != null && _notificationModel?.code == 200) {
        notificationsList?.addAll(_notificationModel?.data ?? []);
        notifyListeners();
      } else {
        CustomScaffoldMessanger.showToast(title: _notificationModel?.message ?? '');
      }
    }else {
      CustomScaffoldMessanger.showToast(title: responseModel.error,bg: Colors.red,fontColor: Colors.white);
    }
    _isLoading = false;
    notifyListeners();
  }

  Future<void> unReadNotification() async {
    // _isLoading = true;
    notifyListeners();
    ApiResponse responseModel = await _homeRepo.unReadNotificationsRepo();
    cancelToken = null;
    notifyListeners();
    if (responseModel.response != null && responseModel.response?.statusCode == 200) {
      await initNotifications();
      _emptyModel = EmptyModel.fromJson(responseModel.response?.data);
      if (_emptyModel != null && _emptyModel?.code == 200) {
        notifyListeners();
      } else {
        CustomScaffoldMessanger.showToast(title: _emptyModel?.message ?? '');
      }
    }else {
      CustomScaffoldMessanger.showToast(title: responseModel.error,bg: Colors.red,fontColor: Colors.white);
    }
    _isLoading = false;
    notifyListeners();
  }

  Future<void> readNotification(String id) async {
    // _isLoading = true;
    notifyListeners();
    ApiResponse responseModel = await _homeRepo.readNotificationsRepo(id);
    cancelToken = null;
    notifyListeners();
    if (responseModel.response != null) {
      _oneNotificationModel = OneNotificationModel.fromJson(responseModel.response?.data);
      if (_oneNotificationModel != null && _oneNotificationModel?.code == 200) {
        final notification = notificationsList?.firstWhere(
              (e) => e?.id == _oneNotificationModel?.data?.id,
          orElse: () => null,
        );
        if (notification != null) {
          notification.isRead = true;
          notifyListeners();
        }
        notifyListeners();
      } else {
        CustomScaffoldMessanger.showToast(title: _oneNotificationModel?.message ?? '');
      }
    }else {
      CustomScaffoldMessanger.showToast(title: responseModel.error,bg: Colors.red,fontColor: Colors.white);
    }
    _isLoading = false;
    notifyListeners();
  }

  Future<void> loadMoreNotification(page) async {
    try {
      _isLoadMore = true;

      notificationsList?.add(null);
      cancelTokenLoadMore ??= CancelToken();
      notifyListeners();

      ApiResponse responseModel = await _homeRepo.notificationsRepo(page.toString());
      if (notificationsList?.last == null) {
        notificationsList?.removeLast();
      }
      cancelTokenLoadMore = null;
      if (responseModel.response != null &&
          responseModel.response?.statusCode == 200) {
        NotificationModel model = NotificationModel.fromJson(responseModel.response?.data);
        if (model.code == 200) {
          List<OneNotification> list = [];
          list.addAll(model.data ?? []);
          if (list.isNotEmpty) {
            notificationsList?.addAll(list);
            this.page = page;
          }
        } else {
          CustomScaffoldMessanger.showToast(title: model.message ?? '');
        }
      } else {
        CustomScaffoldMessanger.showToast(title:responseModel.error);
      }
      _isLoadMore = false;
      notifyListeners();
    } catch (e) {
      if (notificationsList?.last == null) {
        notificationsList?.removeLast();
      }
      _isLoadMore = false;
      cancelTokenLoadMore = null;
      notifyListeners();
      print('getnotificationLoadMoreError=>>>$e');
    }
    return;
  }
  void listener() {
    if (scrollController.position.pixels == scrollController.position.maxScrollExtent && _isLoadMore== false &&( (notificationsList?.length)!>9)) {
      int p = page + 1;
      loadMoreNotification(p);
    }
  }


}