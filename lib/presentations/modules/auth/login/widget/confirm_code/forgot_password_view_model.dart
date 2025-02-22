

import 'dart:async';
import 'package:flutter/material.dart';
import '../../../../../../data/datasource/local/LocalUserData.dart';


class ForgotPasswordViewModel with ChangeNotifier {
  // final ForgotPasswordRepo forgotPasswordRepo;
  final LocalUserData saveUserData;
  String? passwordError;
  String? confirmpasswordError;
  String? phoneError;
  final phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();
  final controller = TextEditingController();

  ForgotPasswordViewModel({required this.saveUserData, });
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
  ///variables

  // UserModel? _userModel;
  ///getters


  ///setters

  // UserModel? get userModel => _userModel;
  /// controllers



  ///calling APIs Functions

  // Future<ApiResponse> resetPassword (BuildContext context) async {
  //
  //   notifyListeners();
  //   ProgressDialog dialog = createProgressDialog(msg: AppTranslate.send.tr(), context: navigatorKey.currentState!.context);
  //   await dialog.show();
  //   ApiResponse responseModel = await forgotPasswordRepo.resetPassword(passwordController.text,confirmpasswordController.text,removeLeadingZeroFromString(phoneController.text));
  //   await dialog.hide();
  //   if (responseModel.response != null &&
  //       responseModel.response?.statusCode == 200) {
  //     _userModel = UserModel.fromJson(responseModel.response?.data);
  //
  //     if (_userModel?.code == 200) {
  //     NavigatorHandler.pushAndRemoveUntil(const LoginScreen());
  //      } else {
  //       ToastUtils.showToast( message: _userModel?.message ?? "");
  //     }
  //   } else {
  //     notifyListeners();
  //     ApiChecker.checkApi(navigatorKey.currentState!.context, responseModel);
  //   }
  //   notifyListeners();
  //   return responseModel;
  // }


  // Future<void> updateFCMToken() async {
  //   String? fcmToken = await NotificationServices().getDeviceToken();
  //   if (fcmToken == null) {return;}
  //   await authRepo.updateFCMToken(fcmToken: fcmToken);
  //   notifyListeners();
  // }

  // bool validateForm() {
  //   resetErrors();
  //
  //   if (passwordController.text.isEmpty) {
  //     passwordError = AppTranslate.gallery.tr();
  //   }
  //  else if (passwordController.text.isNotEmpty&&passwordController.text.length < 8) {
  //     passwordError = AppTranslate.app_name.tr();
  //   } else if (passwordController.text.isNotEmpty&&!RegExp(r'[a-z]').hasMatch(passwordController.text)) {
  //     passwordError = AppTranslate.passwordMustIncludeLowercaseLetter.tr();
  //   } else if (passwordController.text.isNotEmpty&&!RegExp(r'[A-Z]').hasMatch(passwordController.text)) {
  //     passwordError = AppTranslate.passwordMustIncludeUppercaseLetter.tr();
  //   }
  //   if (confirmpasswordController.text.isEmpty) {
  //     confirmpasswordError = AppTranslate.pleaseEnterConfirmPassword.tr();
  //   }
  //  else if (confirmpasswordController.text.isNotEmpty&&passwordController.text!=confirmpasswordController.text) {
  //     confirmpasswordError = AppTranslate.confirmPasswordMustEqual.tr();
  //   }
  //
  //
  //   // Notify listeners if there are any errors
  //   notifyListeners();
  //
  //   return
  //       confirmpasswordError == null &&
  //       passwordError == null ;
  // }


  refreshData() {
    notifyListeners();
  }
  void resetErrors() {
    phoneError = null;
    passwordError = null;
    confirmpasswordError = null;

    notifyListeners();
  }
  // bool validatePhoneForm() {
  //   resetErrors();
  //
  //
  //   if (phoneController.text.isEmpty) {
  //     phoneError = AppTranslate.pleaseEnterPhoneNum.tr();
  //   }
  //   else if (phoneController.text.length<9) {
  //     phoneError = AppTranslate.pleaseEnterValidPhoneNum.tr();
  // } else if(!saudiArabiaPhoneNoCountryCodeStartingWithZero.hasMatch(phoneController.text)&&!saudiArabiaPhoneStartingWithFive.hasMatch(phoneController.text)){
  //     phoneError = AppTranslate.phone_must_start.tr();
  //   }
  //
  //   // Notify listeners if there are any errors
  //   notifyListeners();
  //
  //   return
  //     phoneError == null  ;
  // }
//   void validatePhone(BuildContext context) {
//
//
//     // If there are no errors, perform the desired action
//     if (validatePhoneForm()) {
// sendCode(false);
//       // Perform your action here
//       //Navigator.pushNamed(context, '/home'); // Example: Navigate to home
//     } else {
//       // Show a snackbar or alert if errors exist
//       // ScaffoldMessenger.of(context).showSnackBar(
//       //   SnackBar(content: Text("Please fix the errors before logging in")),
//       // );
//     }
//   }

  // Future<ApiResponse> sendCode (fromReSend) async {
  //
  //   notifyListeners();
  //   ProgressDialog dialog = createProgressDialog(msg: AppTranslate.send.tr(), context: navigatorKey.currentState!.context);
  //   await dialog.show();
  //   ApiResponse responseModel = await forgotPasswordRepo.sendCodeRepo("+962",removeLeadingZeroFromString(phoneController.text),"reset");
  //   await dialog.hide();
  //   if (responseModel.response != null &&
  //       responseModel.response?.statusCode == 200) {
  //     EmptyModel  emptyDataModel = EmptyModel.fromJson(responseModel.response?.data);
  //
  //     if (emptyDataModel.code == 200) {
  //
  //       (fromReSend==true)? startTimer():null;
  //       (fromReSend==false)?  showModalBottomSheet(
  //         backgroundColor: Colors.transparent,
  //         isScrollControlled: true,
  //         context: navigatorKey.currentContext!,
  //         builder: (BuildContext context) => const ConfirmCodeSheet(),
  //       ):null;
  //     } else {
  //       ToastUtils.showToast(message:emptyDataModel.message ?? "");
  //     }
  //   } else {
  //     notifyListeners();
  //     ApiChecker.checkApi(navigatorKey.currentState!.context,responseModel);
  //   }
  //   notifyListeners();
  //   return responseModel;
  // }
  // Future<ApiResponse> confirmCode (String code) async {
  //   notifyListeners();
  //   ProgressDialog dialog = createProgressDialog(msg: AppTranslate.confirm.tr(), context: navigatorKey.currentState!.context);
  //   await dialog.show();
  //   ApiResponse responseModel = await forgotPasswordRepo.confirmCodeRepo(code, "+962",removeLeadingZeroFromString(phoneController.text),"reset");
  //   await dialog.hide();
  //   if (responseModel.response != null &&
  //       responseModel.response?.statusCode == 200) {
  //     EmptyModel   emptyDataModel = EmptyModel.fromJson(responseModel.response?.data);
  //
  //     if (emptyDataModel.code == 200) {
  //
  //         Navigator.pop(navigatorKey.currentContext!);
  //         start = 0;
  //          NavigatorHandler.push(const ResetPasswordScreen());
  //
  //       // showModalBottomSheet(
  //       //   backgroundColor: Colors.transparent,
  //       //   isScrollControlled: true,
  //       //   context: context,
  //       //   builder: (BuildContext context) => ConfirmCodeSheet(phone: '${countryCode}${removeLeadingZeroFromString(phoneController.text)}', fromRegister: true,),
  //       // );
  //     } else {
  //       ToastUtils.showToast(message:emptyDataModel.message ?? "");
  //     }
  //   } else {
  //     notifyListeners();
  //     ApiChecker.checkApi(navigatorKey.currentState!.context, responseModel);
  //   }
  //   notifyListeners();
  //   return responseModel;
  // }
}
