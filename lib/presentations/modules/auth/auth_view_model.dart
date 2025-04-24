import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';
import 'package:pronight_vendor/data/datasource/local/LocalUserData.dart';
import 'package:pronight_vendor/data/models/response/empty_model.dart';
import 'package:pronight_vendor/data/models/response/user_model.dart';
import 'package:pronight_vendor/main.dart';
import 'package:pronight_vendor/presentations/modules/auth/login/widget/confirm_code/verification_code/confirm_code_sheet.dart';
import 'package:pronight_vendor/presentations/modules/layout/bottom_nav_bar_app.dart';
import '../../../core/app_theme/app_colors.dart';
import '../../../core/navigator/navigator.dart';
import '../../../core/resources/app_translate.dart';
import '../../../core/utils/imageCroper.dart';
import '../../../data/models/api_response.dart';
import '../../../data/models/response/send_code_model.dart';
import '../../../data/repositories/login_repo.dart';
import '../../../injection.dart';
import '../../components/loadings/custom_scaffold_messanger.dart';
import '../../components/loadings/progress_dialog.dart';

class AuthViewModel extends ChangeNotifier{
  TextEditingController phoneNumberController =TextEditingController();
  TextEditingController nameController =TextEditingController();
  final LoginRepo _loginRepo = getIt();
  final LocalUserData saveUserData = getIt();
  final otpController = TextEditingController();
  late Timer timer;
  int start = 60;

  void startTimer() {
    start = 60;
    const oneSec = Duration(seconds: 1);
    timer = Timer.periodic(
      oneSec,
          (Timer timer) {
        if (start == 0) {
          timer.cancel();
          notifyListeners();
        } else {
          start--;
          notifyListeners();
        }
      },
    );
  }
  String phoneCode = '+966';
  // String phoneCode = '+962';
  EmptyModel? _emptyModel;
  SendCodeModel? _sendCodeModel;
  UserModel? _userModel;
  // EmptyModel? get emptyModel => _emptyModel;

    String? image;

  void pickImage() async {
    PickImageHandler().showPickUpImageSheet(
      true,
          (String? path) {
        if (path != null) {
          image = path;
          notifyListeners();
        }
      },
      const CropAspectRatio(ratioX: 1, ratioY: 1),
      CropAspectRatioPreset.square,
      true,
      CropStyle.circle,
    );
  }
  String removeLeadingZeroFromString(String input) {
    if (input.isEmpty) {
      return input;
    }
    if (input[0] == '0') {
      input = input.substring(1);
    }
    return input;
  }

  Future<void> sendCode (bool fromScreen,String type) async {
    notifyListeners();
    ProgressDialog dialog = createProgressDialog(msg: "${AppTranslate.send.tr()} ...");
    await dialog.show();
    String modifiedPhone = removeLeadingZeroFromString(phoneNumberController.text);
    ApiResponse responseModel = await _loginRepo.sendCodeRepo(modifiedPhone, phoneCode,type);
    await dialog.hide();
    if (responseModel.response != null && responseModel.response?.statusCode == 200) {
      notifyListeners();
      _sendCodeModel = SendCodeModel.fromJson(responseModel.response?.data);
      notifyListeners();
      if (_sendCodeModel != null && _sendCodeModel?.code == 200) {
        // if(kDebugMode){
          print('hhhfdhfhfhfhfhf');
          CustomScaffoldMessanger.showToast(title: _sendCodeModel?.data.toString()??'');
        // }
        if(type=='login'){
          (fromScreen==true)? showConfirmCodeSheet('login'):null;
        }else{
          (fromScreen==true)? showConfirmCodeSheet('register'):null;
        }

      } else{
        CustomScaffoldMessanger.showToast(title: _sendCodeModel?.message??'');
      }
      notifyListeners();
    }
    else {
      CustomScaffoldMessanger.showScaffoledMessanger(title: responseModel.error,bg: Colors.red,fontColor: Colors.white);
    }
    notifyListeners();
  }
  Future<void> confirmCode (type) async {
    notifyListeners();
    ProgressDialog dialog = createProgressDialog(msg: "${AppTranslate.confirm.tr()} ...");
    await dialog.show();
    String modifiedPhone = removeLeadingZeroFromString(phoneNumberController.text);
    ApiResponse responseModel = await _loginRepo.confirmCodeRepo(modifiedPhone, phoneCode,otpController.text,type);
    await dialog.hide();
    if (responseModel.response != null && responseModel.response?.statusCode == 200) {
      notifyListeners();
      _userModel = UserModel.fromJson(responseModel.response?.data);
      notifyListeners();
      if (_userModel != null && _userModel?.code == 200) {
       if(type=='login'){ if (_userModel?.data?.id != null) {
          saveUserData.saveUserData(_userModel!);
          saveUserData.saveUserToken(_userModel?.data?.token ?? '');
          print('kkkkkkkkkkk${saveUserData.getUserData()?.data?.id}');
          print('kkkkkkkkkkk__token${saveUserData.getUserData()?.data?.token}');
          NavigatorHandler.pushAndRemoveUntil(BottomNavBar(bottomNavIndex: 0));
          // await authRepo.updateFCMToken();
        }}else{
         print('kkkkkkkkkkk>>>>');
         await register();
         print('kkkkkkkkkkk>>>>2');
       }
      } else{
        CustomScaffoldMessanger.showToast(title: _userModel?.message??'');
      }
      notifyListeners();
    }
    else {
      CustomScaffoldMessanger.showScaffoledMessanger(title: responseModel.error,bg: Colors.red,fontColor: Colors.white);
    }
    notifyListeners();
  }

  Future<void> register () async {
    print('kkkkkkkkkkk1');
    notifyListeners();
    ProgressDialog dialog = createProgressDialog(msg: "${AppTranslate.send.tr()} ...");
    print('kkkkkkkkkkk3');
    await dialog.show();
    print('kkkkkkkkkkk4');
    String modifiedPhone = removeLeadingZeroFromString(phoneNumberController.text);
    ApiResponse responseModel = await _loginRepo.registerRepo(modifiedPhone,phoneCode,nameController.text,image);
    print('kkkkkkkkkkk5');
    await dialog.hide();
    if (responseModel.response != null && responseModel.response?.statusCode == 200) {
      print('kkkkkkkkkkk6');
      notifyListeners();
      _userModel = UserModel.fromJson(responseModel.response?.data);
      notifyListeners();
      if (_userModel != null && _userModel?.code == 200) {
        if (_userModel?.data?.id != null) {
          saveUserData.saveUserData(_userModel!);
          saveUserData.saveUserToken(_userModel?.data?.token ?? '');
          print('kkkkkkkkkkk${saveUserData.getUserData()?.data?.id}');
          print('kkkkkkkkkkk__token${saveUserData.getUserData()?.data?.token}');
          // showConfirmCodeSheet();
          // await authRepo.updateFCMToken();
        }
        NavigatorHandler.pushAndRemoveUntil(BottomNavBar(bottomNavIndex: 0));
        if(kDebugMode){
          CustomScaffoldMessanger.showToast(title: _userModel?.data.toString()??'');
        }
      } else{
        CustomScaffoldMessanger.showToast(title: _userModel?.message??'');
      }
      notifyListeners();
    }
    else {
      CustomScaffoldMessanger.showScaffoledMessanger(title: responseModel.error,bg: Colors.red,fontColor: Colors.white);
    }
    notifyListeners();
  }

  Future<dynamic> showConfirmCodeSheet(type) async {
    return showModalBottomSheet(
        isScrollControlled: true,
        context: navigatorKey.currentContext!,
        backgroundColor: AppColors.white,
        builder: (context) {
          return ConfirmCodeSheet(type: type,);
        });}
}