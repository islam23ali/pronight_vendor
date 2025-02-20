import 'package:dio/dio.dart';
import 'package:pronight_vendor/injection.dart';

import '../../core/app_url/app_url.dart';
import '../datasource/remote/dio/dio_client.dart';
import '../datasource/remote/exception/api_error_handler.dart';
import '../models/api_response.dart';

class LogoutRepo {
  final DioClient _dioClient=getIt();
  Future<ApiResponse> logoutRepo(String token) async {
    try {
      Response response = await _dioClient.post(AppUrls.logoutUrl,formData: FormData.fromMap({
        'token':token,
      }));
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.handleError(e));
    }
  }
}
