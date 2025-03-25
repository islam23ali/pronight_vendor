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
import '../models/body_or_quary/add_contract_body.dart';

class ContractRepo {
  final DioClient _dioClient = getIt();

  Future<ApiResponse> allContractRepo(String search) async {
    try {
      Response response = await _dioClient.get(AppUrls.allContractUrl+search);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.handleError(e));
    }
  }
  Future<ApiResponse> oneContractRepo (String id) async {
    try {
      Response response = await _dioClient.get(AppUrls.oneContractUrl+id);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.handleError(e));
    }
  }
  Future<ApiResponse> printContractRepo (String id) async {
    try {
      Response response = await _dioClient.get(AppUrls.printContractUrl+id);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.handleError(e));
    }
  }

  Future<ApiResponse> deleteContractRepo (String id) async {
    try {
      Response response = await _dioClient.delete(AppUrls.oneContractUrl+id);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.handleError(e));
    }
  }

  Future<ApiResponse> addContractRepo (AddContractBody addContractBody) async {
    try {
      Response response = await _dioClient.post(AppUrls.addContractUrl,formData: FormData.fromMap(addContractBody.toJson()));
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.handleError(e));
    }
  }
  Future<ApiResponse> sectorsRepo () async {
    try {
      Response response = await _dioClient.get(AppUrls.sectorsUrl);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.handleError(e));
    }
  }
  Future<ApiResponse> villasRepo (sectorId) async {
    try {
      Response response = await _dioClient.get(AppUrls.villasUrl+sectorId);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.handleError(e));
    }
  }
  Future<ApiResponse> beachesRepo (sectorId) async {
    try {
      Response response = await _dioClient.get(AppUrls.beachesUrl+sectorId);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.handleError(e));
    }
  }
}
