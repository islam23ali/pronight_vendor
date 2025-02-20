import 'package:dio/dio.dart';

import '../../core/app_url/app_url.dart';
import '../../injection.dart';
import '../datasource/remote/dio/dio_client.dart';
import '../datasource/remote/exception/api_error_handler.dart';
import '../models/api_response.dart';
import '../models/body_or_quary/add_user_body.dart';

class AppUsersRepo {
  final DioClient _dioClient = getIt();

  Future<ApiResponse> showUsersRepo() async {
    try {
      Response response = await _dioClient.get(AppUrls.usersUrl);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.handleError(e));
    }
  }

  Future<ApiResponse> addUserRepo( AppUserBody appUser) async {
    try {
      Response response = await _dioClient.post(AppUrls.usersUrl,
          formData: FormData.fromMap(appUser.toJson()));
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.handleError(e));
    }
  }

  Future<ApiResponse> updateUserRepo(int id,
      AppUserBody appUser) async {
    try {
      Response response = await _dioClient.put('${AppUrls.usersUrl}/$id',
          queryParameters: appUser.toJson());
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.handleError(e));
    }
  }

  Future<ApiResponse> deleteUserRepo(int id) async {
    try {
      Response response = await _dioClient.delete('${AppUrls.usersUrl}/$id');
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.handleError(e));
    }
  }

  Future<ApiResponse> multiDeleteUserRepo(List<int> ids) async {
    try {
      Response response = await _dioClient.post(AppUrls.usersMultiDeleteUrl,
          formData: FormData.fromMap({"ids[]": ids}));
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.handleError(e));
    }
  }
}
