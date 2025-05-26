import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart';
// import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pronight_vendor/injection.dart';
import 'package:pronight_vendor/main.dart';

import '../../core/app_url/app_url.dart';
import '../datasource/remote/dio/dio_client.dart';
import '../datasource/remote/exception/api_error_handler.dart';
import '../models/api_response.dart';
import '../models/body_or_quary/add_contract_body.dart';
import '../models/body_or_quary/add_unit_body.dart';

class SettingRepo {
  final DioClient _dioClient = getIt();

  Future<ApiResponse> settingRepo() async {
    try {
      Response response = await _dioClient.get(AppUrls.settingUrl);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.handleError(e));
    }
  }

  Future<ApiResponse> statisticsRepo() async {
    try {
      Response response = await _dioClient.get(AppUrls.statisticsUrl);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.handleError(e));
    }
  }

  Future<ApiResponse> sendComplaintsRepo(name,email,message) async {
    try {
      Response response = await _dioClient.post(AppUrls.sendComplaintsUrl,formData: FormData.fromMap(
          {
            'name':name,
            'email':email,
            'message':message,
          }));
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.handleError(e));
    }
  }

  Future<ApiResponse> contactUsRepo(name,email,title,message) async {
    try {
      Response response = await _dioClient.post(AppUrls.contactUsUrl,formData: FormData.fromMap(
          {
            'name':name,
            'email':email,
            'subject':title,
            'message':message,
          }));
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.handleError(e));
    }
  }

}
