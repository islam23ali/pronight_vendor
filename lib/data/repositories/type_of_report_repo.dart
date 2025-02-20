import 'package:dio/dio.dart';

import '../../core/app_url/app_url.dart';
import '../../injection.dart';
import '../datasource/remote/dio/dio_client.dart';
import '../datasource/remote/exception/api_error_handler.dart';
import '../models/api_response.dart';
import '../models/selected_row_model.dart';

class TypeOfReportRepo {
  final DioClient _dioClient=getIt();

  Future<ApiResponse> typeOfMinutesRepo () async {
    try {
      Response response = await _dioClient
          .get(AppUrls.reportTypeUrl);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.handleError(e));
    }
  }
  Future<ApiResponse> addReportType (reportName) async {
    try {
      Response response = await
      _dioClient.post(AppUrls.reportTypeUrl,formData: FormData.fromMap({
        'name':reportName
      }));
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.handleError(e));
    }
  }
  Future<ApiResponse> updateReportType (reportTypeId,reportName) async {
    try {
      Response response = await
      _dioClient.put('${AppUrls.reportTypeUrl}/$reportTypeId?name=$reportName',);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.handleError(e));
    }
  }
  Future<ApiResponse> deleteReportType (reportTypeId) async {
    try {
      Response response = await
      _dioClient.delete('${AppUrls.reportTypeUrl}/$reportTypeId');
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.handleError(e));
    }
  }
  Future<ApiResponse> multiDeleteReportRepo(List<int> ids) async {
    Map<String, dynamic> body = {};
    for (int i = 0; i < (ids.length??0); i++) {
      // if(ids[i].isSelected==true){
        body["ids[$i]"] = ids[i];
      // }
    }
    try {
      Response response = await _dioClient.post('${AppUrls.reportTypeUrl}/multi_delete',
          formData: FormData.fromMap(body));
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.handleError(e));
    }
  }
}
