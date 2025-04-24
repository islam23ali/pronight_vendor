import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart';
// import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pronight_vendor/injection.dart';
import 'package:pronight_vendor/main.dart';

import '../../core/app_url/app_url.dart';
import '../datasource/remote/dio/dio_client.dart';
import '../datasource/remote/exception/api_error_handler.dart';
import '../models/api_response.dart';

class LoginRepo {
  final DioClient _dioClient = getIt();

  Future<ApiResponse> sendCodeRepo(String phone,phoneCode,type) async {
    try {
      Response response = await _dioClient.post(AppUrls.sendCodeUrl,
          formData: FormData.fromMap({
            'phone': phone,
            'phone_code': phoneCode,
            'type': type,
          }));
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.handleError(e));
    }
  }
  Future<ApiResponse> confirmCodeRepo(String phone,phoneCode,code,type) async {
    try {
      Response response = await _dioClient.post(AppUrls.confirmCodeUrl,
          formData: FormData.fromMap({
            'phone': phone,
            'phone_code': phoneCode,
            'code': code,
            'type': type,
          }));
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.handleError(e));
    }
  }

  Future<ApiResponse> registerRepo(String phone,phoneCode,name,image) async {
    try {
      Response response = await _dioClient.post(AppUrls.registerUrl,
          formData: FormData.fromMap({
            'phone': phone,
            'phone_code': phoneCode,
            'name': name,
            if(image!=null)'image':image == null ? null: await MultipartFile.fromFile(image),
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
