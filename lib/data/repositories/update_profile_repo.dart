import 'package:dio/dio.dart';
import 'package:pronight_vendor/injection.dart';
import '../../core/app_url/app_url.dart';
import '../../core/firebase_notification/notification_services.dart';
import '../datasource/remote/dio/dio_client.dart';
import '../datasource/remote/exception/api_error_handler.dart';
import '../models/api_response.dart';


class UpdateProfileRepo {
  final DioClient _dioClient =getIt();
  Future<ApiResponse> updateProfileRepo(String password) async {
    try {
      Response response = await _dioClient.post(AppUrls.updateProfileUrl, formData: FormData.fromMap({
        'password':password,
      }
      ));
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.handleError(e));
    }
  }

}
