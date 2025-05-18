
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';
import 'package:pronight_vendor/data/datasource/local/LocalUserData.dart';
import 'package:pronight_vendor/data/models/response/user_model.dart';
import 'package:pronight_vendor/data/repositories/login_repo.dart';
import '../../../../../core/navigator/navigator.dart';
import '../../../../../core/resources/app_translate.dart';
import '../../../../../core/utils/imageCroper.dart';
import '../../../../../data/models/api_response.dart';
import '../../../../../injection.dart';
import '../../../../components/loadings/custom_scaffold_messanger.dart';
import '../../../../components/loadings/progress_dialog.dart';

class UpdateProfileViewModel extends ChangeNotifier{
final LoginRepo _loginRepo = getIt();
final LocalUserData saveDate = getIt();
  int currentPage = 0;
  final PageController pageController = PageController(initialPage: 0);



   UserModel? _userModel;
   bool? _isLoading = false;

   UserModel? get userModel => _userModel;
   bool? get isLoading => _isLoading;


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
    const CropAspectRatio(ratioX: 16, ratioY: 9),
    CropAspectRatioPreset.ratio16x9,
    true,
  );
}

  void refreshData(){
  notifyListeners();
}

TextEditingController nameController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController phoneController = TextEditingController();
TextEditingController passwordController = TextEditingController();
TextEditingController confirmPasswordController = TextEditingController();
String phoneCode = '+966';
initUpdateProfile(){
  nameController.text=saveDate.getUserData()?.data?.name??'';
  emailController.text=saveDate.getUserData()?.data?.email??'';
  phoneController.text=saveDate.getUserData()?.data?.phone??'';
  passwordController.clear();
  confirmPasswordController.clear();
  image=saveDate.getUserData()?.data?.image??'';
  notifyListeners();
}
  Future<void> updateProfile () async {
  notifyListeners();
  ProgressDialog dialog = createProgressDialog(msg: "${AppTranslate.confirm.tr()} ...");
  await dialog.show();
  ApiResponse responseModel = (image!.startsWith('http'))?await _loginRepo.updateProfileNoImageRepo(phoneController.text,phoneCode,nameController.text,emailController.text,passwordController.text,confirmPasswordController.text,image):await _loginRepo.updateProfileRepo(phoneController.text,phoneCode,nameController.text,emailController.text,passwordController.text,confirmPasswordController.text,image);
  await dialog.hide();
  if (responseModel.response != null && responseModel.response?.statusCode == 200) {

    _userModel = UserModel.fromJson(responseModel.response?.data);
    notifyListeners();
    if (_userModel != null && _userModel?.code == 200) {
      saveDate.saveUserData(_userModel!);
      print('kkkkkkkkkkk${saveDate.getUserData()?.data?.id}');
      print('kkkkkkkkkkk__token${saveDate.getUserToken()}');
      NavigatorHandler.pop();
      if(kDebugMode){
        CustomScaffoldMessanger.showToast(title: 'الله ينور ياعمناااا <<<<<<<<<<');
      }
      // await showSuccessPayedSheet();

      notifyListeners();
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


// Future<dynamic> showSuccessPayedSheet() async {
//   return  showModalBottomSheet(
//     // isDismissible: false,
//       isScrollControlled: true,
//       backgroundColor: AppColors.white,
//       context: navigatorKey.currentContext!,
//
//       shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.vertical(
//             top: Radius.circular(36.r),
//           )),
//       builder: (BuildContext context) {
//         return const SuccessPayedSheet();
//       });}
}