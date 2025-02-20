import 'package:dio/dio.dart';

import '../../core/app_url/app_url.dart';
import '../../injection.dart';
import '../datasource/remote/dio/dio_client.dart';
import '../datasource/remote/exception/api_error_handler.dart';
import '../models/api_response.dart';

class HomeRepo {
  final DioClient _dioClient=getIt();

  Future<ApiResponse> checkSerialRepo(String serial) async {
    try {
      Response response = await _dioClient
          .get(AppUrls.checkSerialUrl, queryParameters: {'serial': serial});
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.handleError(e));
    }
  }
  Future<ApiResponse> permissionsRepo() async {
    try {
      Response response = await _dioClient.get(AppUrls.permissionsUrl);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.handleError(e));
    }
  } Future<ApiResponse> notificationCount() async {
    try {
      Response response = await _dioClient.get(AppUrls.allNotificationCountUrl);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.handleError(e));
    }
  }

  Future<ApiResponse> homeRepo (String createdFrom,createdTo) async {
    try {
      Response response = await _dioClient
          .get('${AppUrls.homeUrl}?created_from=$createdFrom&created_to=$createdTo');
          // queryParameters: {'created_from':createdFrom,'created_to':createdTo});
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.handleError(e));
    }
  }
}
