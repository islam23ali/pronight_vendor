import 'package:dio/dio.dart';

import '../../core/app_url/app_url.dart';
import '../../injection.dart';
import '../datasource/remote/dio/dio_client.dart';
import '../datasource/remote/exception/api_error_handler.dart';
import '../models/api_response.dart';
import '../models/body_or_quary/admins_body.dart';

class AdminsRepo {
  final DioClient _dioClient = getIt();

  Future<ApiResponse> showAdminsRepo([id]) async {
    try {
      Response response = await _dioClient.get('${AppUrls.adminsUrl}/${id??''}');
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.handleError(e));
    }
  }

  Future<ApiResponse> addAdminRepo( AdminBody appAdmin) async {
    try {
      Response response = await _dioClient.post(AppUrls.adminsUrl,
          formData: FormData.fromMap(appAdmin.toJson()));
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.handleError(e));
    }
  }

  Future<ApiResponse> updateAdminRepo(int id,
      AdminBody appAdmin) async {
    try {
      Response response = await _dioClient.put('${AppUrls.adminsUrl}/$id',
          queryParameters: appAdmin.toJson());
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.handleError(e));
    }
  }

  Future<ApiResponse> deleteAdminRepo(int id) async {
    try {
      Response response = await _dioClient.delete('${AppUrls.adminsUrl}/$id');
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.handleError(e));
    }
  }

  Future<ApiResponse> multiDeleteAdminRepo(List<int> ids) async {
    try {
      Response response = await _dioClient.post(AppUrls.adminsMultiDeleteUrl,
          formData: FormData.fromMap({"ids[]": ids}));
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.handleError(e));
    }
  }
}
