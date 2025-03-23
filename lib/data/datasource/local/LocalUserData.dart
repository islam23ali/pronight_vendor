import 'dart:convert';

import 'package:pronight_vendor/injection.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/constants/constants.dart';
import '../../../core/navigator/navigator.dart';
import '../../../presentations/modules/splash/splash.dart';
import '../../models/response/user_model.dart';
import '../remote/dio/dio_client.dart';

class LocalUserData {
  final SharedPreferences sharedPreferences = getIt();
  final DioClient dioClient = getIt();

  /// save SharedData
  Future<void> saveUserData(UserModel userData) async {
    String userSavedData = json.encode(userData);
    try {
      await sharedPreferences.setString(localUserData, userSavedData);
    } catch (e) {
      rethrow;
    }
  }
  Future<void> saveUserToken(String token) async {
    // dioClient.updateHeader(userTOKEN,sharedPreferences.getString(AppConstants.lang));
    try {
      await sharedPreferences.setString(userTOKEN, token);
    } catch (e) {
      rethrow;
    }
  }
  Future<void> saveLang(String lang) async {
    try {
      await sharedPreferences.setString(localAppLanguage, lang);
    } catch (e) {
      rethrow;
    }
  }
  Future<void> saveIsShowIntro(bool isShowIntro) async {
    try {
      await sharedPreferences.setBool(showIntro, isShowIntro);
    } catch (e) {
      throw e;
    }
  }
  ///get SharedData
  UserModel? getUserData() {
    String? userSavedData = sharedPreferences.getString(localUserData);
    if (userSavedData != null) {
      Map<String, dynamic> userData = json.decode(userSavedData);
      UserModel userModel = UserModel.fromJson(userData);
      return userModel;
    }
    return null;
  }
  String getUserToken() {
    return sharedPreferences.getString(userTOKEN) ?? "";
  }
  String getLang() {
    return sharedPreferences.getString(localAppLanguage) ?? "ar";
  }
  bool isShowIntro() {
    return sharedPreferences.containsKey(showIntro);
  }
  ///clear SharedData
  Future<bool> clearUserData() async {
    await sharedPreferences.remove(userTOKEN);
    await sharedPreferences.remove(localUserData);
    await sharedPreferences.remove(localAppLanguage);
    NavigatorHandler.pushAndRemoveUntil(const Splash());
    return true;
  }
}
