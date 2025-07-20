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
import '../models/body_or_quary/add_visit_permit_body.dart';

class VisitPermitRepo {
  final DioClient _dioClient = getIt();


  Future<ApiResponse> addVisitPermitRepo (AddVisitPermitBody addVisitPermitBody) async {
    try {
      Map<String, dynamic> body = {};
      body["visit_date"] = addVisitPermitBody.visitDate;
      body["sector_id"] = addVisitPermitBody.sectorId;
      body["villa_id"] = addVisitPermitBody.villaId;
      body["beach_id"] = addVisitPermitBody.beachId;
      body["days_count"] = addVisitPermitBody.daysCount;
      body["status"] = addVisitPermitBody.status;
      body["driver_name"] = addVisitPermitBody.driverName;
      body["phone"] = addVisitPermitBody.phone;
      body["phone_code"] = addVisitPermitBody.phoneCode;
      body["visitors_switch"] = addVisitPermitBody.visitorsSwitch;
      body["materials_switch"] = addVisitPermitBody.materialsSwitch;
      body["send_client"] = addVisitPermitBody.sendClient;
      body["send_provider"] = addVisitPermitBody.sendProvider;

      if(addVisitPermitBody.note!=null||addVisitPermitBody.note!='')body['note']=addVisitPermitBody.note;
      if(addVisitPermitBody.visitorsSwitch=='1')
      for (int e = 0; e < (addVisitPermitBody.visitor??[]).length; e++) {
        body["visitors[$e][name]"] = addVisitPermitBody.visitor?[e].visitorNameController.text;
        body["visitors[$e][id_no]"] = addVisitPermitBody.visitor?[e].visitorIDNumberController.text;
        body["visitors[$e][phone_code]"] = addVisitPermitBody.visitor?[e].visitorPhoneCodeController.text;
        body["visitors[$e][phone]"] = addVisitPermitBody.visitor?[e].visitorPhoneController.text;
      }
      if(addVisitPermitBody.materialsSwitch=='1')
      for (int i = 0; i < (addVisitPermitBody.material??[]).length; i++) {
        body["materials[$i][name]"] = addVisitPermitBody.material?[i].materialNameController.text;
        body["materials[$i][qty]"] = addVisitPermitBody.material?[i].materialQtyController.text;
      }

      if(kDebugMode){
        print('addVisitPermitRepo BODY${addVisitPermitBody.toJson()}');
        print('addVisitPermitRepo CAR${addVisitPermitBody.visitor?[0].toJson()}');
        print('addVisitPermitRepo Escorts${addVisitPermitBody.material?[0].toJson()}');
      }
      Response response = await _dioClient.post(AppUrls.addVisitPermitUrl,formData: FormData.fromMap(body));
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.handleError(e));
    }
  }

  Future<ApiResponse> updateVisitPermitRepo (id,AddVisitPermitBody addVisitPermitBody) async {
    try {
      Map<String, dynamic> body = {};
      body["visit_date"] = addVisitPermitBody.visitDate;
      body["sector_id"] = addVisitPermitBody.sectorId;
      body["villa_id"] = addVisitPermitBody.villaId;
      body["beach_id"] = addVisitPermitBody.beachId;
      body["days_count"] = addVisitPermitBody.daysCount;
      body["status"] = addVisitPermitBody.status;
      body["driver_name"] = addVisitPermitBody.driverName;
      body["phone"] = addVisitPermitBody.phone;
      body["phone_code"] = addVisitPermitBody.phoneCode;
      body["visitors_switch"] = addVisitPermitBody.visitorsSwitch;
      body["materials_switch"] = addVisitPermitBody.materialsSwitch;
      body["send_client"] = (addVisitPermitBody.sendClient==true)?'1':'0';
      body["send_provider"] = (addVisitPermitBody.sendProvider==true)?'1':'0';

      if(addVisitPermitBody.note!=null||addVisitPermitBody.note!='')body['note']=addVisitPermitBody.note;
      if(addVisitPermitBody.visitorsSwitch=='1')
      for (int e = 0; e < (addVisitPermitBody.visitor??[]).length; e++) {
        body["visitors[$e][name]"] = addVisitPermitBody.visitor?[e].visitorNameController.text;
        body["visitors[$e][id_no]"] = addVisitPermitBody.visitor?[e].visitorIDNumberController.text;
        body["visitors[$e][phone_code]"] = addVisitPermitBody.visitor?[e].visitorPhoneCodeController.text;
        body["visitors[$e][phone]"] = addVisitPermitBody.visitor?[e].visitorPhoneController.text;
      }
      if(addVisitPermitBody.materialsSwitch=='1')
      for (int i = 0; i < (addVisitPermitBody.material??[]).length; i++) {
        body["materials[$i][name]"] = addVisitPermitBody.material?[i].materialNameController.text;
        body["materials[$i][qty]"] = addVisitPermitBody.material?[i].materialQtyController.text;
      }

      if(kDebugMode){
        print('addVisitPermitRepo BODY${addVisitPermitBody.toJson()}');
        print('addVisitPermitRepo CAR${addVisitPermitBody.visitor?[0].toJson()}');
        print('addVisitPermitRepo Escorts${addVisitPermitBody.material?[0].toJson()}');
      }
      Response response = await _dioClient.post(AppUrls.updateVisitPermitUrl+id,formData: FormData.fromMap(body));
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.handleError(e));
    }
  }

  Future<ApiResponse> deleteVisitorRepo(String visitorId) async {
    try {
      Response response = await _dioClient.delete(AppUrls.deleteVisitorPermitUrl+visitorId);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.handleError(e));
    }
  }

  Future<ApiResponse> deleteMaterialRepo(String materialId) async {
    try {
      Response response = await _dioClient.delete(AppUrls.deleteMaterialsPermitUrl+materialId);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.handleError(e));
    }
  }

  Future<ApiResponse> allVisitPermitRepo(String search,page) async {
    try {
      Response response = await _dioClient.get('${AppUrls.visitPermitsUrl}$search&limit=10&page=$page');
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.handleError(e));
    }
  }
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
