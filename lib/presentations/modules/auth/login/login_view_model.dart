import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';
import 'package:pronight_vendor/data/datasource/local/LocalUserData.dart';
import 'package:pronight_vendor/data/models/response/empty_model.dart';
import 'package:pronight_vendor/data/models/response/user_model.dart';
import 'package:pronight_vendor/main.dart';
import 'package:pronight_vendor/presentations/modules/auth/login/widget/confirm_code/verification_code/confirm_code_sheet.dart';
import 'package:pronight_vendor/presentations/modules/layout/bottom_nav_bar_app.dart';
import '../../../../core/app_theme/app_colors.dart';
import '../../../../core/navigator/navigator.dart';
import '../../../../core/resources/app_translate.dart';
import '../../../../data/models/api_response.dart';
import '../../../../data/models/response/send_code_model.dart';
import '../../../../data/repositories/login_repo.dart';
import '../../../../injection.dart';
import '../../../components/loadings/custom_scaffold_messanger.dart';
import '../../../components/loadings/progress_dialog.dart';

class LoginViewModel extends ChangeNotifier{
  TextEditingController phoneNumberController =TextEditingController();
  final LoginRepo _loginRepo = getIt();
  final LocalUserData saveUserData = getIt();
  final controller = TextEditingController();
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
  String phoneCode = '+20';
  EmptyModel? _emptyModel;
  SendCodeModel? _sendCodeModel;
  UserModel? _userModel;
  // EmptyModel? get emptyModel => _emptyModel;

  Future<void> sendCode (bool isLogin) async {
    notifyListeners();
    ProgressDialog dialog = createProgressDialog(msg: "${AppTranslate.send.tr()} ...");
    await dialog.show();
    ApiResponse responseModel = await _loginRepo.sendCodeRepo(phoneNumberController.text, phoneCode);
    await dialog.hide();
    if (responseModel.response != null && responseModel.response?.statusCode == 200) {
      notifyListeners();
      _sendCodeModel = SendCodeModel.fromJson(responseModel.response?.data);
      notifyListeners();
      if (_sendCodeModel != null && _sendCodeModel?.code == 200) {
        // if (_userModel?.data?.id != null) {
        //   saveUserData.saveUserData(_userModel!);
        //   saveUserData.saveUserToken(_userModel?.data?.token ?? '');
        //   print('kkkkkkkkkkk${saveUserData.getUserData()?.data?.id}');
        //   print('kkkkkkkkkkk__token${saveUserData.getUserData()?.data?.token}');
        //   // await authRepo.updateFCMToken();
        // }
        if(kDebugMode){
          print('hhhfdhfhfhfhfhf');
          CustomScaffoldMessanger.showToast(title: _sendCodeModel?.data.toString()??'');
        }
        (isLogin==true)? showSendCodeSheet():null;
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
  Future<void> confirmCode () async {
    notifyListeners();
    ProgressDialog dialog = createProgressDialog(msg: "${AppTranslate.confirm.tr()} ...");
    await dialog.show();
    ApiResponse responseModel = await _loginRepo.confirmCodeRepo(phoneNumberController.text, phoneCode,controller.text);
    await dialog.hide();
    if (responseModel.response != null && responseModel.response?.statusCode == 200) {
      notifyListeners();
      _userModel = UserModel.fromJson(responseModel.response?.data);
      notifyListeners();
      if (_userModel != null && _userModel?.code == 200) {
        if (_userModel?.data?.id != null) {
          saveUserData.saveUserData(_userModel!);
          saveUserData.saveUserToken(_userModel?.data?.token ?? '');
          print('kkkkkkkkkkk${saveUserData.getUserData()?.data?.id}');
          print('kkkkkkkkkkk__token${saveUserData.getUserData()?.data?.token}');
          NavigatorHandler.pushAndRemoveUntil(BottomNavBar(bottomNavIndex: 0));
          // await authRepo.updateFCMToken();
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

  Future<dynamic> showSendCodeSheet() async {
    return showModalBottomSheet(
        isScrollControlled: true,
        context: navigatorKey.currentContext!,
        backgroundColor: AppColors.white,
        builder: (context) {
          return const ConfirmCodeSheet();
        });}
}