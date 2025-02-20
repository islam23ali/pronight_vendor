import 'package:dio/dio.dart';

import '../../core/app_url/app_url.dart';
import '../../injection.dart';
import '../datasource/remote/dio/dio_client.dart';
import '../datasource/remote/exception/api_error_handler.dart';
import '../models/api_response.dart';

class SectionsRepo {
  final DioClient _dioClient = getIt();

  Future<ApiResponse> showSectionsRepo() async {
    try {
      Response response = await _dioClient.get(AppUrls.areasUrl);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.handleError(e));
    }
  }

  Future<ApiResponse> addSectionRepo(int cityId, String name) async {
    try {
      print('cityId$cityId');
      Response response = await _dioClient.post(AppUrls.areasUrl,
          formData: FormData.fromMap({"city_id": cityId, "name": name}));
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.handleError(e));
    }
  }

  Future<ApiResponse> updateSectionRepo(
      int id, int cityId, String name) async {
    try {
      Response response = await _dioClient.put('${AppUrls.areasUrl}/$id',
          queryParameters: {"city_id": cityId, "name": name});
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.handleError(e));
    }
  }

  Future<ApiResponse> deleteSectionRepo(int id) async {
    try {
      Response response = await _dioClient.delete('${AppUrls.areasUrl}/$id');
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.handleError(e));
    }
  }

  Future<ApiResponse> multiDeleteSectionRepo(List<int> ids) async {
    try {
      Response response = await _dioClient.post(AppUrls.areasMultiDeleteUrl,
          formData: FormData.fromMap({"ids[]": ids}));
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.handleError(e));
    }
  }
}
