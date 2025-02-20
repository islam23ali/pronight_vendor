import 'package:dio/dio.dart';

import '../../core/app_url/app_url.dart';
import '../../injection.dart';
import '../datasource/remote/dio/dio_client.dart';
import '../datasource/remote/exception/api_error_handler.dart';
import '../models/api_response.dart';
import '../models/selected_row_model.dart';

class NatureWorkRepo {
  final DioClient _dioClient=getIt();

  Future<ApiResponse> workNatureRepo () async {
    try {
      Response response = await _dioClient
          .get(AppUrls.workNatureUrl);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.handleError(e));
    }
  }
  Future<ApiResponse> addWorkNature (reportName) async {
    try {
      Response response = await
      _dioClient.post(AppUrls.workNatureUrl,formData: FormData.fromMap({
        'name':reportName
      }));
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.handleError(e));
    }
  }
  Future<ApiResponse> updateWorkNature (reportNatureId,reportName) async {
    try {
      Response response = await
      _dioClient.put('${AppUrls.workNatureUrl}/$reportNatureId?name=$reportName',);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.handleError(e));
    }
  }
  Future<ApiResponse> deleteWorkNature (reportNatureId) async {
    try {
      Response response = await
      _dioClient.delete('${AppUrls.workNatureUrl}/$reportNatureId');
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.handleError(e));
    }
  }
  Future<ApiResponse> multiDeleteWorkNatureRepo(List<SelectedRowModel> ids) async {
    Map<String, dynamic> body = {};
    for (int i = 0; i < (ids.length??0); i++) {
      if(ids[i].isSelected==true){
        body["ids[$i]"] = ids[i].id;
      }
    }
    try {
      Response response = await _dioClient.post('${AppUrls.workNatureUrl}/multi_delete',
          formData: FormData.fromMap(body));
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.handleError(e));
    }
  }
}
