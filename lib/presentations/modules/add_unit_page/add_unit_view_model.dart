import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';
import 'package:pronight_vendor/core/extensions/num_extensions.dart';
import 'package:pronight_vendor/data/models/body_or_quary/add_unit_body.dart';
import 'package:pronight_vendor/data/models/response/sub_models/add_facilitie_model.dart';
import 'package:pronight_vendor/data/repositories/units_repo.dart';
import 'package:pronight_vendor/main.dart';
import 'package:pronight_vendor/presentations/modules/add_unit_page/confirm_additional_screen/confirm_additional_screen.dart';

import '../../../core/app_theme/app_colors.dart';
import '../../../core/navigator/navigator.dart';
import '../../../core/resources/app_translate.dart';
import '../../../core/utils/imageCroper.dart';
import '../../../data/models/api_response.dart';
import '../../../data/models/response/cities_model.dart';
import '../../../data/models/response/contens_model.dart';
import '../../../data/models/response/one_unit_model.dart';
import '../../../data/models/response/reservation_days_model.dart';
import '../../../data/models/response/sub_models/add_additional_service_model.dart';
import '../../../data/models/response/sub_models/add_unit_content_model.dart';
import '../../../injection.dart';
import '../../components/loadings/custom_scaffold_messanger.dart';
import '../../components/loadings/progress_dialog.dart';
import '../booking_days_page/booking_days_page.dart';
import '../contracts_page/contract_screens/widget/success_payed_sheet.dart';
import '../layout/bottom_nav_bar_app.dart';

class AddUnitViewModel extends ChangeNotifier{
final UnitsRepo _unitsRepo = getIt();
  int currentPage = 0;
  final PageController pageController = PageController(initialPage: 0);



   CitiesModel? _citiesModel;
   ContentsModel? _contentsModel;
   ContentsModel? _facilitiesModel;
   ReservationDaysModel? _reservationDaysModel;

   OneUnitModel? _oneUnitModel;
   bool? _isLoading = false;
   bool? _isDaysLoading = false;

   CitiesModel? get citiesModel => _citiesModel;
   ContentsModel? get contentsModel => _contentsModel;
   ContentsModel? get facilitiesModel => _facilitiesModel;
   OneUnitModel? get oneUnitModel => _oneUnitModel;
   ReservationDaysModel? get reservationDaysModel => _reservationDaysModel;
   bool? get isLoading => _isLoading;
   bool? get isDaysLoading => _isDaysLoading;



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

final ImagePicker imagePicker = ImagePicker();

void getSupImages(ImageSource source) async {
  final picker = ImagePicker();
  if(source==ImageSource.camera){
    XFile? pickedFile = await picker.pickImage(source: source);
    if (pickedFile != null) {
      images!.add(pickedFile);
      notifyListeners();
    }
  }
  else{
    final List<XFile> selectedImages = await imagePicker.pickMultiImage();
    if (selectedImages.isNotEmpty) {
      images!.addAll(selectedImages);
      notifyListeners();
    }
    print("Image List Length:${images!.length}");
  }}

  //page one data ...
  TextEditingController arabicUnitNameController =TextEditingController();
  TextEditingController englishUnitNameController =TextEditingController();
  TextEditingController unitPriceController =TextEditingController();
  TextEditingController unitAreaController =TextEditingController();
  TextEditingController arabicUnitDescriptionController =TextEditingController();
  TextEditingController englishUnitDescriptionController =TextEditingController();
  TextEditingController notesController =TextEditingController();
   // page two data ....
  OneCity? selectedCity;
  String? latitude;
  String? longitude;
  String? address;
  String? image;
  List<XFile>? images = [];
  // page three data ....
  TextEditingController maxAdultsController =TextEditingController();
  TextEditingController pricePerAdultController =TextEditingController();
  TextEditingController maxChildrenController =TextEditingController();
  TextEditingController pricePerChildController =TextEditingController();
  bool isSwitchOffer = false;
  TextEditingController startDateOfferController =TextEditingController();
  TextEditingController endDateOfferController =TextEditingController();
  List<String>? offerType = ['fixed', 'percentage'];
  String? offerValue;
  TextEditingController offerValueController =TextEditingController();
  // page four data ...

  List<AddContent> contentList=[AddContent(unitMainContentId: -1, value: '')];
  List<AddFacilities> facilitiesList =[AddFacilities(unitMainFacilityId: -1, textAr: '', textEn: '')];
  List<AddAdditionalServices> additionalServiceList =[AddAdditionalServices(price: 0.0, forPerson: false, titleAr: '', titleEn: '',)];


initAddUnit(){
  WidgetsBinding.instance.addPostFrameCallback((_){
  arabicUnitNameController.clear();
  englishUnitNameController.clear();
  unitPriceController.clear();
  unitAreaController.clear();
  arabicUnitDescriptionController.clear();
  englishUnitDescriptionController.clear();
  notesController.clear();
  selectedCity=null;
  latitude='';
  longitude='';
  address='';
  image=null;
  images=[];
  maxAdultsController.clear();
  pricePerAdultController.clear();
  maxChildrenController.clear();
  pricePerChildController.clear();
  isSwitchOffer=false;
  startDateOfferController.clear();
  endDateOfferController.clear();
  offerValue='';
  offerValueController.clear();
  offerValueController.clear();
  contentList=[AddContent(unitMainContentId: -1, value: '')];
  facilitiesList =[AddFacilities(unitMainFacilityId: -1, textAr: '', textEn: '')];
  additionalServiceList =[AddAdditionalServices(price: 0.0, forPerson: false, titleAr: '', titleEn: '',)];

  getAllCities();
  getAllContents();
  getAllFacilities();
  // notifyListeners();
    });
}

  void refreshData(){
  notifyListeners();
}
  Future<void> getAllCities () async {
    _isLoading = true;
    notifyListeners();
    ApiResponse responseModel = await _unitsRepo.citiesRepo();

    if (responseModel.response != null && responseModel.response?.statusCode == 200) {
      _citiesModel = CitiesModel.fromJson(responseModel.response?.data);
      _isLoading = false;
      notifyListeners();
      if (_citiesModel != null && _citiesModel?.code == 200) {
        if(kDebugMode){
          CustomScaffoldMessanger.showToast(title: _citiesModel?.message??'');
        }
      } else{
        CustomScaffoldMessanger.showToast(title: _citiesModel?.message??'');
      }
      notifyListeners();
    }
    else {
      CustomScaffoldMessanger.showScaffoledMessanger(title: responseModel.error,bg: Colors.red,fontColor: Colors.white);
    }
    notifyListeners();
  }

  Future<void> getAllContents () async {
    _isLoading = true;
    notifyListeners();
    ApiResponse responseModel = await _unitsRepo.contentsRepo();

    if (responseModel.response != null && responseModel.response?.statusCode == 200) {
      _contentsModel = ContentsModel.fromJson(responseModel.response?.data);
      _isLoading = false;
      notifyListeners();
      if (_contentsModel != null && _contentsModel?.code == 200) {
        if(kDebugMode){
          CustomScaffoldMessanger.showToast(title: _contentsModel?.message??'');
        }
      } else{
        CustomScaffoldMessanger.showToast(title: _contentsModel?.message??'');
      }
      notifyListeners();
    }
    else {
      CustomScaffoldMessanger.showScaffoledMessanger(title: responseModel.error,bg: Colors.red,fontColor: Colors.white);
    }
    notifyListeners();
  }

  Future<void> getAllFacilities () async {
    _isLoading = true;
    notifyListeners();
    ApiResponse responseModel = await _unitsRepo.facilitiesRepo();

    if (responseModel.response != null && responseModel.response?.statusCode == 200) {
      _facilitiesModel = ContentsModel.fromJson(responseModel.response?.data);
      _isLoading = false;
      notifyListeners();
      if (_facilitiesModel != null && _facilitiesModel?.code == 200) {
        if(kDebugMode){
          CustomScaffoldMessanger.showToast(title: _facilitiesModel?.message??'');
        }
      } else{
        CustomScaffoldMessanger.showToast(title: _facilitiesModel?.message??'');
      }
      notifyListeners();
    }
    else {
      CustomScaffoldMessanger.showScaffoledMessanger(title: responseModel.error,bg: Colors.red,fontColor: Colors.white);
    }
    notifyListeners();
  }

  Future<void> addUnit () async {
  notifyListeners();
  AddUnitBody addUnitBody = AddUnitBody();
  addUnitBody.titleAr=arabicUnitNameController.text;
  addUnitBody.titleEn=englishUnitNameController.text;
  addUnitBody.price=unitPriceController.text;
  addUnitBody.area=unitAreaController.text;
  addUnitBody.descAr=arabicUnitDescriptionController.text;
  addUnitBody.descEn=englishUnitDescriptionController.text;
  addUnitBody.note=notesController.text;
  addUnitBody.cityId=selectedCity?.id.toString()??'';
  addUnitBody.latitude=latitude;
  addUnitBody.longitude=longitude;
  addUnitBody.address=address;
  addUnitBody.image=image;
  addUnitBody.images=images;
  addUnitBody.maxAdultCount=maxAdultsController.text;
  addUnitBody.adultPrice=pricePerAdultController.text;
  addUnitBody.maxChildCount=maxChildrenController.text;
  addUnitBody.childPrice=pricePerChildController.text;
  addUnitBody.hasOffer=(isSwitchOffer==true)?(1.toString()):(0.toString());
  addUnitBody.offerStartDate=startDateOfferController.text;
  addUnitBody.offerEndDate=endDateOfferController.text;
  addUnitBody.offerType=offerValue;
  addUnitBody.offerValue=offerValueController.text;
  addUnitBody.contents=contentList;
  addUnitBody.facilities=facilitiesList;
  addUnitBody.additionalServices=additionalServiceList;

  ProgressDialog dialog = createProgressDialog(msg: "${AppTranslate.addUnit.tr()} ...");
  await dialog.show();
  ApiResponse responseModel = await _unitsRepo.addUnitRepo(addUnitBody);
  await dialog.hide();
  if (responseModel.response != null && responseModel.response?.statusCode == 200) {
    _oneUnitModel = OneUnitModel.fromJson(responseModel.response?.data);
    notifyListeners();
    if (_oneUnitModel != null && _oneUnitModel?.code == 200) {
      NavigatorHandler.pushReplacement(ConfirmAdditionalScreen(id: _oneUnitModel?.data?.id.toString()??'',));
      if(kDebugMode){
        CustomScaffoldMessanger.showToast(title: 'الله ينور ياعمناااا <<<<<<<<<<');
      }
      notifyListeners();
    } else{
      CustomScaffoldMessanger.showToast(title: _oneUnitModel?.message??'');
    }
    notifyListeners();
  }
  else {
    CustomScaffoldMessanger.showScaffoledMessanger(title: responseModel.error,bg: Colors.red,fontColor: Colors.white);
  }
  notifyListeners();
}

initConfirmAddition(){
  identityImage=null;
  licenseImage=null;
  commercialImage=null;
}
  File? identityImage;
  File? licenseImage;
  File? commercialImage;

  Future<void> confirmAddition (id) async {
  notifyListeners();
  ProgressDialog dialog = createProgressDialog(msg: "${AppTranslate.confirm.tr()} ...");
  await dialog.show();
  ApiResponse responseModel = await _unitsRepo.confirmAdditionRepo(id,identityImage,licenseImage,commercialImage);
  await dialog.hide();
  if (responseModel.response != null && responseModel.response?.statusCode == 200) {
    _oneUnitModel = OneUnitModel.fromJson(responseModel.response?.data);
    notifyListeners();
    if (_oneUnitModel != null && _oneUnitModel?.code == 200) {

      if(kDebugMode){
        CustomScaffoldMessanger.showToast(title: 'الله ينور ياعمناااا <<<<<<<<<<');
      }
     await NavigatorHandler.pushAndRemoveUntil(BottomNavBar(bottomNavIndex: 2,));

      notifyListeners();
     await showSuccessPayedSheet();
    } else{
      CustomScaffoldMessanger.showToast(title: _oneUnitModel?.message??'');
    }
    notifyListeners();
  }
  else {
    CustomScaffoldMessanger.showScaffoledMessanger(title: responseModel.error,bg: Colors.red,fontColor: Colors.white);
  }
  notifyListeners();
}

TextEditingController fromDateSetPriceController = TextEditingController();
TextEditingController toDateSetPriceController = TextEditingController();
TextEditingController newPriceController = TextEditingController();
initSetPrice(){
WidgetsBinding.instance.addPostFrameCallback((_){
  fromDateSetPriceController.clear();
  toDateSetPriceController.clear();
  newPriceController.clear();
  notifyListeners();
});
}
  Future<void> setPrice (unitId) async {
  notifyListeners();
  ProgressDialog dialog = createProgressDialog(msg: "${AppTranslate.confirm.tr()} ...");
  await dialog.show();
  ApiResponse responseModel = await _unitsRepo.setPriceRepo(unitId, fromDateSetPriceController.text, toDateSetPriceController.text, newPriceController.text);
  await dialog.hide();
  if (responseModel.response != null && responseModel.response?.statusCode == 200) {

    _oneUnitModel = OneUnitModel.fromJson(responseModel.response?.data);
    notifyListeners();
    if (_oneUnitModel != null && _oneUnitModel?.code == 200) {
      initSetPrice();
      if(kDebugMode){
        CustomScaffoldMessanger.showToast(title: 'الله ينور ياعمناااا <<<<<<<<<<');
      }
      // await showSuccessPayedSheet();
      NavigatorHandler.push( BookingDaysPage(unitId: _oneUnitModel?.data?.id.toString()??''));

      // await NavigatorHandler.pushAndRemoveUntil(BottomNavBar(bottomNavIndex: 2,));

      notifyListeners();
    } else{
      CustomScaffoldMessanger.showToast(title: _oneUnitModel?.message??'');
    }
    notifyListeners();
  }
  else {
    CustomScaffoldMessanger.showScaffoledMessanger(title: responseModel.error,bg: Colors.red,fontColor: Colors.white);
  }
  notifyListeners();
}

  Future<void> reservationDays (unitId,month) async {
    _isDaysLoading= true;
  notifyListeners();
  ApiResponse responseModel = await _unitsRepo.reservationDaysRepo(unitId, month);

  if (responseModel.response != null && responseModel.response?.statusCode == 200) {

    _reservationDaysModel = ReservationDaysModel.fromJson(responseModel.response?.data);
    _isDaysLoading=false;
    notifyListeners();
    if (_reservationDaysModel != null && _reservationDaysModel?.code == 200) {

      if(kDebugMode){
        CustomScaffoldMessanger.showToast(title: 'الله ينور ياعمناااا <<<<<<<<<<');
      }

      notifyListeners();
    } else{
      CustomScaffoldMessanger.showToast(title: _reservationDaysModel?.message??'');
    }
    notifyListeners();
  }
  else {
    CustomScaffoldMessanger.showScaffoledMessanger(title: responseModel.error,bg: Colors.red,fontColor: Colors.white);
  }
  notifyListeners();
}


Future<dynamic> showSuccessPayedSheet() async {
  return  showModalBottomSheet(
    // isDismissible: false,
      isScrollControlled: true,
      backgroundColor: AppColors.white,
      context: navigatorKey.currentContext!,

      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(36.r),
          )),
      builder: (BuildContext context) {
        return const SuccessPayedSheet();
      });}
}