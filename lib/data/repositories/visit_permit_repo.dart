import 'dart:convert';

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

class VisitPermitRepo {
  final DioClient _dioClient = getIt();

  Future<ApiResponse> oneVisitPermitRepo (String id) async {
    try {
      Response response = await _dioClient.get(AppUrls.oneVisitPermitUrl+id);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.handleError(e));
    }
  }
  Future<ApiResponse> printVisitPermitRepo (String id) async {
    try {
      Response response = await _dioClient.get(AppUrls.printVisitPermitUrl+id);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.handleError(e));
    }
  }
  Future<ApiResponse> deleteVisitPermitRepo (String id) async {
    try {
      Response response = await _dioClient.delete(AppUrls.deleteVisitPermitUrl+id);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.handleError(e));
    }
  }
}
