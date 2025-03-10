import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pronight_vendor/core/extensions/num_extensions.dart';

import '../../../../../core/app_theme/app_colors.dart';
import '../../../../../main.dart';
import '../../../../components/custom_text/custom_text.dart';

class UnitImageViewModel extends ChangeNotifier{


  File? image;
  void deleteImage(){
    image=null;
    notifyListeners();
  }
  void refreshData(){
    notifyListeners();
  }
  Future<void> getImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    image = pickedFile != null ? File(pickedFile.path) : null;
    notifyListeners();
  }

  void catchImage(){
    showModalBottomSheet(
      context: navigatorKey.currentContext!,
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20.r),
          )),
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.camera_alt,color: AppColors.darkColor,),
              title: CustomText(title: 'takePicture'.tr(),fontColor: AppColors.darkColor,),
              onTap: () {
                getImage(ImageSource.camera);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.image,color: AppColors.darkColor,),
              title: CustomText(title: 'chooseFromGallery'.tr(),fontColor: AppColors.darkColor,),
              onTap: () {
                getImage(ImageSource.gallery);
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}