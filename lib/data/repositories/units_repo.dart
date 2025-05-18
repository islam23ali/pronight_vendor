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

class UnitsRepo {
  final DioClient _dioClient = getIt();

  Future<ApiResponse> allUnitsRepo(int page,search) async {
    try {
      Response response = await _dioClient.get('${AppUrls.allUnitsUrl}10&page=$page&search=$search');
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.handleError(e));
    }
  }
  Future<ApiResponse> oneUnitsRepo (String id) async {
    try {
      Response response = await _dioClient.get(AppUrls.oneUnitsUrl+id);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.handleError(e));
    }
  }

  Future<ApiResponse> citiesRepo () async {
    try {
      Response response = await _dioClient.get(AppUrls.citiesUrl);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.handleError(e));
    }
  }


  Future<ApiResponse> contentsRepo () async {
    try {
      Response response = await _dioClient.get(AppUrls.contentsUrl);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.handleError(e));
    }
  }


  Future<ApiResponse> facilitiesRepo () async {
    try {
      Response response = await _dioClient.get(AppUrls.facilitiesUrl);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.handleError(e));
    }
  }


  Future<ApiResponse> addUnitRepo (AddUnitBody addUnitBody) async {
    try {
      Map<String, dynamic> body = {};
      body["title[ar]"] = addUnitBody.titleAr;
      body['title[en]']=addUnitBody.titleEn;
      body['desc[ar]']=addUnitBody.descAr;
      body['desc[en]']=addUnitBody.descEn;
      body['city_id']=addUnitBody.cityId;
      body['price']=addUnitBody.price;
      body['area']=addUnitBody.area;
      body['image']=addUnitBody.image == null ? null: await MultipartFile.fromFile(addUnitBody.image??'');
      body['latitude']=addUnitBody.latitude;
      body['longitude']=addUnitBody.longitude;
      body['address']=addUnitBody.address;
      // body['images[]']=addUnitBody.images;
      body['max_adult_count']=addUnitBody.maxAdultCount;
      body['adult_price']=addUnitBody.adultPrice;
      body['max_child_count']=addUnitBody.maxChildCount;
      body['child_price']=addUnitBody.childPrice;
      body['has_offer']=addUnitBody.hasOffer;
      body['offer_start_date']=addUnitBody.offerStartDate;
      body['offer_end_date']=addUnitBody.offerEndDate;
      body['offer_type']=addUnitBody.offerType;
      body['offer_value']=addUnitBody.offerValue;
      if(addUnitBody.note!=null||addUnitBody.note!='')body['note']=addUnitBody.note;

      for (int t = 0; t < (addUnitBody.images??[]).length; t++) {
        body["images[$t]"] = addUnitBody.images?[t]== null ? null: await MultipartFile.fromFile(addUnitBody.images?[t].path??'');
      }

      for (int e = 0; e < (addUnitBody.contents??[]).length; e++) {
        body["contents[$e][unit_main_content_id]"] = addUnitBody.contents?[e].oneContent.id;
        body["contents[$e][value]"] = addUnitBody.contents?[e].theValue.text;
      }
      for (int i = 0; i < (addUnitBody.facilities??[]).length; i++) {
        body["facilities[$i][unit_main_facility_id]"] = addUnitBody.facilities?[i].selectedFacilities?.id;
        body["facilities[$i][text][ar]"] = addUnitBody.facilities?[i].textArController.text;
        body["facilities[$i][text][en]"] = addUnitBody.facilities?[i].textEnController.text;
      }
      for (int u = 0; u < (addUnitBody.additionalServices??[]).length; u++) {
        body["additional_services[$u][price]"] = addUnitBody.additionalServices?[u].priceController.text;
        body["additional_services[$u][for_person]"] = (addUnitBody.additionalServices?[u].forPerson==true)?1.toString():0.toString();
        body["additional_services[$u][title][ar]"] = addUnitBody.additionalServices?[u].titleArController.text;
        body["additional_services[$u][title][en]"] = addUnitBody.additionalServices?[u].titleEnController.text;
      }

      if(kDebugMode){
        print('addContractRepo BODY${addUnitBody.toJson()}');
        print('addContractRepo CAR${addUnitBody.contents?[0].toJson()}');
        print('addContractRepo Escorts${addUnitBody.facilities?[0].toJson()}');
        print('addContractRepo Escorts${addUnitBody.additionalServices?[0].toJson()}');
        print('addContractRepo image${addUnitBody.images}');
        print('addContractRepo image2${body["images[]"]}');
      }
      Response response = await _dioClient.post(AppUrls.addUnitUrl,formData: FormData.fromMap(body));
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.handleError(e));
    }
  }

  Future<ApiResponse> confirmAdditionRepo (id,File? identityImage,File? licenseImage,File? commercialRegisterImage) async {
    try {
      Response response = await _dioClient.post(AppUrls.confirmAdditionUrl+id,formData: FormData.fromMap({
        'identity_image':identityImage == null ? null: await MultipartFile.fromFile(identityImage.path),
        'license_image':licenseImage == null ? null: await MultipartFile.fromFile(licenseImage.path),
        if(commercialRegisterImage!=null)'commercial_register_image':commercialRegisterImage == null ? null: await MultipartFile.fromFile(commercialRegisterImage.path),
      }));
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.handleError(e));
    }
  }

  Future<ApiResponse> setPriceRepo (unitId,fromDate,toDate,price) async {
    try {
      Response response = await _dioClient.post(AppUrls.setPriceUrl,formData: FormData.fromMap({
        'unit_id':unitId,
        'from_date':fromDate,
        'to_date':toDate,
        'price':price,
      }));
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.handleError(e));
    }
  }


}
