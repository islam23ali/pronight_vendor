import 'package:dio/dio.dart';
import 'package:pronight_vendor/core/app_url/app_url.dart';
import '../../injection.dart';
import '../datasource/remote/dio/dio_client.dart';
import '../datasource/remote/exception/api_error_handler.dart';
import '../models/api_response.dart';

class NotificationRepo {
  final DioClient _dioClient=getIt();


  Future<ApiResponse> notificationRepo (page) async {
    try {
      Response response = await _dioClient.get('${AppUrls.allNotificationUrl}?pagination_status=on&records_number=20&page=$page');
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.handleError(e));
    }
  }
  Future<ApiResponse> deleteNotificationRepo (notificationId) async {
    try {
      Response response = await _dioClient.delete('${AppUrls.deleteNotificationUrl}$notificationId');
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.handleError(e));
    }
  }
  Future<ApiResponse> deleteReferenceRepo(int id) async {
    try {
      Response response = await _dioClient.delete('${AppUrls.logsUrl}/$id');
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.handleError(e));
    }
  }

  Future<ApiResponse> multiDeleteReferenceRepo(List<int> ids) async {
    try {
      Response response = await _dioClient.post(AppUrls.notificationsMultiDeleteUrl,
          formData: FormData.fromMap({"ids[]": ids}));
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.handleError(e));
    }
  }
}