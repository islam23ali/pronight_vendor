import 'package:dio/dio.dart';

import '../../core/app_url/app_url.dart';
import '../../injection.dart';
import '../datasource/remote/dio/dio_client.dart';
import '../datasource/remote/exception/api_error_handler.dart';
import '../models/api_response.dart';
import '../models/selected_row_model.dart';

class RankRepo {
  final DioClient _dioClient=getIt();

  Future<ApiResponse> getRankRepo () async {
    try {
      Response response = await _dioClient
          .get(AppUrls.rankUrl);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.handleError(e));
    }
  }
  Future<ApiResponse> addRankType (rankName) async {
    try {
      Response response = await
      _dioClient.post(AppUrls.rankUrl,formData: FormData.fromMap({
        'name':rankName
      }));
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.handleError(e));
    }
  }
  Future<ApiResponse> updateRank (rankId,rankName) async {
    try {
      Response response = await
      _dioClient.put('${AppUrls.rankUrl}/$rankId?name=$rankName',);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.handleError(e));
    }
  }
  Future<ApiResponse> deleteRank (rankId) async {
    try {
      Response response = await
      _dioClient.delete('${AppUrls.rankUrl}/$rankId');
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.handleError(e));
    }
  }
  Future<ApiResponse> multiDeleteRank (List<SelectedRowModel> ids) async {
    Map<String, dynamic> body = {};
    for (int i = 0; i < (ids.length??0); i++) {
      if(ids[i].isSelected==true){
        body["ids[$i]"] = ids[i].id;
      }
    }
    try {
      Response response = await _dioClient.post('${AppUrls.rankUrl}/multi_delete',
          formData: FormData.fromMap(body));
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.handleError(e));
    }
  }
}
