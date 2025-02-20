import 'dart:convert';

import 'package:crypto/crypto.dart';
// import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pronight_vendor/injection.dart';
import 'package:pronight_vendor/main.dart';

import '../../core/app_url/app_url.dart';
import '../datasource/remote/dio/dio_client.dart';
import '../datasource/remote/exception/api_error_handler.dart';
import '../models/api_response.dart';

class LoginRepo {
  final DioClient _dioClient = getIt();
  // DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  // String hashDeviceId(String deviceId) {     /// اسأل عن دي بتعمل ايه من عماد
  //   var bytes = utf8.encode(deviceId); // Convert to bytes
  //   var hash = sha256.convert(bytes); // Generate SHA-256 hash
  //   print("Hash: $hash");
  //   return hash.toString(); // Return hash as a hexadecimal string
  // }
  // Future<String?> _getDeviceToken() async {
  //   if (Theme.of(navigatorKey.currentContext!).platform == TargetPlatform.android) {
  //     AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
  //     print("Android ID: ${androidInfo.id}");
  //     return androidInfo.id; // Using Android ID as a device token (example)
  //   } else if (Theme.of(navigatorKey.currentContext!).platform == TargetPlatform.iOS) {
  //     IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
  //     print("IOS IDFV: ${iosInfo.identifierForVendor}");
  //     return iosInfo.identifierForVendor; // Using iOS IDFV as a device token (example)
  //   }
  //   return null;
  // }
  Future<ApiResponse> loginRepo(String phone, ) async {
    try {
      Response response = await _dioClient.post(AppUrls.loginUrl,
          formData: FormData.fromMap({
            'phone': phone,
            // 'device_token':hashDeviceId(await _getDeviceToken()??''),
          }));
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.handleError(e));
    }
  }
  // Future<ApiResponse> updateFCMToken(String userId) async {
  //   try {
  //     Response response = await _dioClient.post(AppUrls.insertPhoneTokenUrl,
  //         formData: FormData.fromMap({
  //           'device_token':hashDeviceId(await _getDeviceToken()??''),
  //           'user_id': userId
  //         }));
  //     return ApiResponse.withSuccess(response);
  //   } catch (e) {
  //     return ApiResponse.withError(ApiErrorHandler.handleError(e));
  //   }
  // }
}
