import 'package:dio/dio.dart';

import '../../core/app_url/app_url.dart';
import '../../injection.dart';
import '../datasource/remote/dio/dio_client.dart';
import '../datasource/remote/exception/api_error_handler.dart';
import '../models/api_response.dart';

class GovernoratesRepo {
  final DioClient _dioClient = getIt();

  Future<ApiResponse> showGovernoratesRepo() async {
    try {
      Response response = await _dioClient.get(AppUrls.citiesUrl);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.handleError(e));
    }
  }

  Future<ApiResponse> addGovernorateRepo(String name) async {
    try {
      Response response = await _dioClient.post(AppUrls.citiesUrl,
          formData: FormData.fromMap({ "name": name}));
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.handleError(e));
    }
  }

  Future<ApiResponse> updateGovernorateRepo(
      int id, String name) async {
    try {
      Response response = await _dioClient.put('${AppUrls.citiesUrl}/$id',
          queryParameters: {"name": name});
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.handleError(e));
    }
  }

  Future<ApiResponse> deleteGovernorateRepo(int id) async {
    try {
      Response response = await _dioClient.delete('${AppUrls.citiesUrl}/$id');
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.handleError(e));
    }
  }

  Future<ApiResponse> multiDeleteGovernorateRepo(List<int> ids) async {
    try {
      Response response = await _dioClient.post(AppUrls.citiesMultiDeleteUrl,
          formData: FormData.fromMap({"ids[]": ids}));
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.handleError(e));
    }
  }
}
