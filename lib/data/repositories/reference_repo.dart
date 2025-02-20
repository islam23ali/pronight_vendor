import 'package:dio/dio.dart';

import '../../core/app_url/app_url.dart';
import '../../injection.dart';
import '../datasource/remote/dio/dio_client.dart';
import '../datasource/remote/exception/api_error_handler.dart';
import '../models/api_response.dart';
import '../models/body_or_quary/admins_body.dart';

class ReferenceRepo {
  final DioClient _dioClient = getIt();

  Future<ApiResponse> showReferenceRepo(int page) async {
    try {
      Response response = await _dioClient.get(AppUrls.logsUrl,queryParameters: {
        "page": page,
        "records_number":40,
        "pagination_status": "on"
      });
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.handleError(e));
    }
  }

  Future<ApiResponse> deleteReferenceRepo(int id) async {
    try {
      Response response = await _dioClient.delete('${AppUrls.logsUrl}/$id');
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.handleError(e));
    }
  }

  Future<ApiResponse> multiDeleteReferenceRepo(List<int> ids) async {
    try {
      Response response = await _dioClient.post(AppUrls.logsMultiDeleteUrl,
          formData: FormData.fromMap({"ids[]": ids}));
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.handleError(e));
    }
  }
}
