
// import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pronight_vendor/injection.dart';
import '../../core/app_url/app_url.dart';
import '../datasource/remote/dio/dio_client.dart';
import '../datasource/remote/exception/api_error_handler.dart';
import '../models/api_response.dart';
import '../models/body_or_quary/add_contract_body.dart';

class ContractRepo {
  final DioClient _dioClient = getIt();

  Future<ApiResponse> allContractRepo(String search,page) async {
    try {
      Response response = await _dioClient.get('${AppUrls.allContractUrl}$search&limit=10&page=$page');
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
      Map<String, dynamic> body = {};
      body["start_date"] = addContractBody.startDate;
      body['end_date']=addContractBody.endDate;
      body['sector_id']=addContractBody.sectorId;
      body['villa_id']=addContractBody.villaId;
      body['beach_id']=addContractBody.beachId;
      body['tenant_name']=addContractBody.tenantName;
      body['tenant_id_no']=addContractBody.tenantIdNo;
      body['tenant_nationality']=addContractBody.tenantNationality;
      body['tenant_phone']=addContractBody.tenantPhone;
      body['tenant_phone_code']=addContractBody.tenantPhoneCode;
      body['rent_value']=addContractBody.rentValue;
      body['insurance_value']=addContractBody.insuranceValue;
      body['price']=addContractBody.price;
      body['send_provider']=addContractBody.sendProvider;
      body['send_client']=addContractBody.sendClient;
      if(addContractBody.note!=null||addContractBody.note!='')body['note']=addContractBody.note;
      for (int e = 0; e < (addContractBody.escorts??[]).length; e++) {
        body["escorts[$e][name]"] = addContractBody.escorts?[e].companionNameController.text;
        body["escorts[$e][id_no]"] = addContractBody.escorts?[e].iDNumberCompanionsController.text;
        body["escorts[$e][nationality]"] = addContractBody.escorts?[e].nationalityCompanionsController.text;
        body["escorts[$e][kinship]"] = addContractBody.escorts?[e].facilitiesProximityController.text;
      }
      for (int i = 0; i < (addContractBody.cars??[]).length; i++) {
        body["cars[$i][type]"] = addContractBody.cars?[i].carTypeController.text;
        body["cars[$i][plate_no]"] = addContractBody.cars?[i].plateNumberController.text;
        body["cars[$i][driver_name]"] = addContractBody.cars?[i].driverNameController.text;
        body["cars[$i][driver_id_no]"] = addContractBody.cars?[i].driverIDNumberController.text;
      }

      if(kDebugMode){
        print('addContractRepo BODY${addContractBody.toJson()}');
        print('addContractRepo CAR${addContractBody.cars?[0].toJson()}');
        print('addContractRepo Escorts${addContractBody.escorts?[0].toJson()}');
      }
      Response response = await _dioClient.post(AppUrls.addContractUrl,formData: FormData.fromMap(body));
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.handleError(e));
    }
  }

  Future<ApiResponse> updateContractRepo (id,AddContractBody addContractBody) async {
    try {
      Map<String, dynamic> body = {};
      body["_method"] = 'put';
      body["start_date"] = addContractBody.startDate;
      body['end_date']=addContractBody.endDate;
      body['sector_id']=addContractBody.sectorId;
      body['villa_id']=addContractBody.villaId;
      body['beach_id']=addContractBody.beachId;
      body['tenant_name']=addContractBody.tenantName;
      body['tenant_id_no']=addContractBody.tenantIdNo;
      body['tenant_nationality']=addContractBody.tenantNationality;
      body['tenant_phone']=addContractBody.tenantPhone;
      body['tenant_phone_code']=addContractBody.tenantPhoneCode;
      body['rent_value']=addContractBody.rentValue;
      body['insurance_value']=addContractBody.insuranceValue;
      body['price']=addContractBody.price;
      body['send_provider']=addContractBody.sendProvider;
      body['send_client']=addContractBody.sendClient;
      if(addContractBody.note!=null||addContractBody.note!='')body['note']=addContractBody.note;
      for (int e = 0; e < (addContractBody.escorts??[]).length; e++) {
        body["escorts[$e][name]"] = addContractBody.escorts?[e].companionNameController.text;
        body["escorts[$e][id_no]"] = addContractBody.escorts?[e].iDNumberCompanionsController.text;
        body["escorts[$e][nationality]"] = addContractBody.escorts?[e].nationalityCompanionsController.text;
        body["escorts[$e][kinship]"] = addContractBody.escorts?[e].facilitiesProximityController.text;
      }
      for (int i = 0; i < (addContractBody.cars??[]).length; i++) {
        body["cars[$i][type]"] = addContractBody.cars?[i].carTypeController.text;
        body["cars[$i][plate_no]"] = addContractBody.cars?[i].plateNumberController.text;
        body["cars[$i][driver_name]"] = addContractBody.cars?[i].driverNameController.text;
        body["cars[$i][driver_id_no]"] = addContractBody.cars?[i].driverIDNumberController.text;
      }

      if(kDebugMode){
        print('addContractRepo BODY${addContractBody.toJson()}');
        print('addContractRepo CAR${addContractBody.cars?[0].toJson()}');
        print('addContractRepo Escorts${addContractBody.escorts?[0].toJson()}');
      }
      Response response = await _dioClient.post(AppUrls.updateContentsUrl+id,formData: FormData.fromMap(body));
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

  Future<ApiResponse> payContractRepo (contractId) async {
    try {
      Response response = await _dioClient.get(AppUrls.payContractUrl+contractId);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.handleError(e));
    }
  }
}
