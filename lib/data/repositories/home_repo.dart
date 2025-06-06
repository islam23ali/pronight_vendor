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

class HomeRepo {
  final DioClient _dioClient = getIt();

  Future<ApiResponse> allReportsRepo(String search) async {
    try {
      Response response = await _dioClient.get('${AppUrls.reportsUrl}?title=$search');
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.handleError(e));
    }
  }

  Future<ApiResponse> allReservationRepo(String type) async {
    try {
      Response response = await _dioClient.get('${AppUrls.reservationUrl}$type');
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.handleError(e));
    }
  }

  Future<ApiResponse> updateReservationStatusRepo(String id,String status) async {
    try {
      Response response = await _dioClient.post('${AppUrls.updateReservationStatusUrl}$id',formData: FormData.fromMap(
          {
            'status':status,
          }));
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.handleError(e));
    }
  }

  Future<ApiResponse> reservationDetailsRepo (String id) async {
    try {
      Response response = await _dioClient.get('${AppUrls.updateReservationStatusUrl}$id');
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.handleError(e));
    }
  }

  Future<ApiResponse> homeDataRepo () async {
    try {
      Response response = await _dioClient.get(AppUrls.homeDataUrl);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.handleError(e));
    }
  }

  Future<ApiResponse> notificationsRepo (page) async {
    try {
      Response response = await _dioClient.get(AppUrls.notificationsUrl+page);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.handleError(e));
    }
  }


  Future<ApiResponse> unReadNotificationsRepo () async {
    try {
      Response response = await _dioClient.get(AppUrls.unReadNotificationsUrl);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.handleError(e));
    }
  }


  Future<ApiResponse> readNotificationsRepo (id) async {
    try {
      Response response = await _dioClient.get(AppUrls.readNotificationsUrl+id);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.handleError(e));
    }
  }

}
