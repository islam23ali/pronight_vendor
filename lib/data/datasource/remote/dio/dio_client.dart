import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:pronight_vendor/data/datasource/local/LocalUserData.dart';

import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/app_url/app_url.dart';
import '../../../../core/utils/preferences.dart';
import '../../../../injection.dart';
import '../../../../main.dart';
import 'logging_interceptor.dart';

class DioClient {
  late final String baseUrl;
  final LoggingInterceptor loggingInterceptor = getIt();
  final SharedPreferences sharedPreferences = getIt();
  late Dio dio;

  DioClient() {
    dio = Dio();
    dio
      ..options.baseUrl = AppUrls.baseUrl
      ..options.connectTimeout = const Duration(minutes: 5)
      ..options.receiveTimeout = const Duration(minutes: 5)
      ..httpClientAdapter
      ..options.headers = {
        'Content-Type': 'application/json; charset=UTF-8',
      };
    dio.interceptors.add(loggingInterceptor);

    dio.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
      ),
    );
  }

  Future<Response> get(String uri,
      {Map<String, dynamic>? queryParameters, CancelToken? cancelToken}) async {
    try {
      LocalUserData localUserData = LocalUserData();
      var model = localUserData.getUserData();
      if(model!=null){
        dio.options.headers['Authorization'] ='Bearer ${model.data?.token??' '}';
        dio.options.headers['lang'] =localUserData.getLang();
      }
      var response = await dio.get(
        uri,
        queryParameters: queryParameters,
        cancelToken:  cancelToken
      );
      return response;
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> getUrl(String url) async {
    try {
      var response = await dio.get("");
      return response;
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> post(String uri,
      {FormData? formData,
      Map<String, dynamic>? queryParameters,
      CancelToken? cancelToken}) async {
    try {
      LocalUserData localUserData = LocalUserData();
      var model = localUserData.getUserData();
      if(model!=null){
        dio.options.headers['Authorization'] ='Bearer ${model.data?.token??' '}';
      }
      var data = queryParameters ?? {};
      var response =
          await dio.post(uri, data: formData ?? FormData.fromMap(data),cancelToken: cancelToken);
      return response;
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> postRawData(String uri,Map<String,dynamic> modelData) async {
    try {
      /*Preferences preferences = Preferences();
      var model = preferences.getUserData();
       if(model!=null){
        dio.options.headers['Authorization'] =model.auth;

      }*/

      var response =
      await dio.post(uri, data:jsonEncode(modelData));
      return response;
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> put(
      String uri,
      {
        Map<String, dynamic>? queryParameters,
      }) async {
    try {
      Preferences preferences = Preferences();
      LocalUserData localUserData = LocalUserData();
      var model = localUserData.getUserData();
      if(model!=null){
        dio.options.headers['Authorization'] ='Bearer ${model.data?.token??' '}';
      }

      var response = await dio.put(uri, queryParameters: queryParameters);
      return response;
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> delete(
      String uri,
      {
        Map<String, dynamic>? queryParameters,
      }) async {
    try {
      LocalUserData localUserData = LocalUserData();
      var model = localUserData.getUserData();
      if(model!=null){
        dio.options.headers['Authorization'] ='Bearer ${model.data?.token??' '}';
      }
      var response = await dio.delete(uri, queryParameters:queryParameters);
      return response;
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }

}
