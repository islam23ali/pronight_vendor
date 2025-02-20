import 'package:dio/dio.dart';

import '../../core/app_url/app_url.dart';
import '../../injection.dart';
import '../datasource/remote/dio/dio_client.dart';
import '../datasource/remote/exception/api_error_handler.dart';
import '../models/api_response.dart';
import '../models/body_or_quary/admins_body.dart';
import '../models/body_or_quary/reports_body.dart';

class ReviewReportsRepo {
  final DioClient _dioClient = getIt();

  Future<ApiResponse> showReviewReportsRepo(ReportsBody body) async {
    try {
      Response response = await _dioClient.get(AppUrls.reviewReportsUrl,queryParameters: body.toJson());
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.handleError(e));
    }
  }
  Future<ApiResponse> multiPrintsReportsRepo(List<int> ids) async {
    try {
      Response response = await _dioClient.post(AppUrls.multiPrintUrl,
          formData: FormData.fromMap({"ids[]": ids}));
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.handleError(e));
    }
  }
}
