import 'package:dio/dio.dart';

import '../../core/app_url/app_url.dart';
import '../../injection.dart';
import '../datasource/remote/dio/dio_client.dart';
import '../datasource/remote/exception/api_error_handler.dart';
import '../models/api_response.dart';
import '../models/body_or_quary/minutes_body.dart';
import '../models/body_or_quary/minutes_q.dart';
import '../models/selected_row_model.dart';

class MinutesRepo {
  final DioClient _dioClient=getIt();

  Future<ApiResponse> getMinuteRepo (MinutesQ q) async {
    try {
      Response response = await _dioClient.get(AppUrls.reportsUrl,queryParameters: q.toJson());
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.handleError(e));
    }
  }
  Future<ApiResponse> addMinute (MinutesBody body) async {
    try {
      Response response = await
      _dioClient.post(AppUrls.reportsUrl,formData: FormData.fromMap(
        body.toJson()
      ));
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.handleError(e));
    }
  }
  Future<ApiResponse> updateMinute (String rankId,MinutesBody body) async {
    try {
      Response response = await
      _dioClient.put('${AppUrls.reportsUrl}/$rankId',queryParameters: body.toJson());
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.handleError(e));
    }
  }
  Future<ApiResponse> deleteMinute (String rankId) async {
    try {
      Response response = await
      _dioClient.delete('${AppUrls.reportsUrl}/$rankId');
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.handleError(e));
    }
  }
  Future<ApiResponse> multiDeleteMinute (List<int> ids) async {
    try {
      Response response = await _dioClient.post('${AppUrls.reportsUrl}/multi_delete',
          formData: FormData.fromMap({"ids[]": ids}));
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.handleError(e));
    }
  }
  Future<ApiResponse> multiPrintsMinutesRepo(List<int> ids) async {
    try {
      Response response = await _dioClient.post(AppUrls.multiPrintUrl,
          formData: FormData.fromMap({"ids[]": ids}));
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.handleError(e));
    }
  }
}
