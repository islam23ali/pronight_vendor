import 'package:dio/dio.dart';

import '../../core/app_url/app_url.dart';
import '../../injection.dart';
import '../datasource/remote/dio/dio_client.dart';
import '../datasource/remote/exception/api_error_handler.dart';
import '../models/api_response.dart';
import '../models/selected_row_model.dart';

class ReportCategoryRepo {
  final DioClient _dioClient=getIt();

  Future<ApiResponse> getReportCategoryRepo () async {
    try {
      Response response = await _dioClient
          .get(AppUrls.reportCategoryUrl);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.handleError(e));
    }
  }
  Future<ApiResponse> addReportCategoryType (reportName) async {
    try {
      Response response = await
      _dioClient.post(AppUrls.reportCategoryUrl,formData: FormData.fromMap({
        'name':reportName
      }));
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.handleError(e));
    }
  }
  Future<ApiResponse> updateReportCategory (reportTypeId,reportName) async {
    try {
      Response response = await
      _dioClient.put('${AppUrls.reportCategoryUrl}/$reportTypeId?name=$reportName',);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.handleError(e));
    }
  }
  Future<ApiResponse> deleteReportCategory (reportTypeId) async {
    try {
      Response response = await
      _dioClient.delete('${AppUrls.reportCategoryUrl}/$reportTypeId');
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.handleError(e));
    }
  }
  Future<ApiResponse> multiDeleteReportCategory(List<SelectedRowModel> ids) async {
    Map<String, dynamic> body = {};
    for (int i = 0; i < (ids.length??0); i++) {
      if(ids[i].isSelected==true){
        body["ids[$i]"] = ids[i].id;
      }
    }
    try {
      Response response = await _dioClient.post('${AppUrls.reportCategoryUrl}/multi_delete',
          formData: FormData.fromMap(body));
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.handleError(e));
    }
  }
}
