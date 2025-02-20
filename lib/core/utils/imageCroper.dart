import 'package:pronight_vendor/core/extensions/num_extensions.dart';
import 'package:pronight_vendor/core/resources/app_translate.dart';
import 'package:pronight_vendor/presentations/components/custom_svg/CustomSvgIcon.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../../main.dart';
import '../../presentations/components/custom_text/custom_text.dart';
import '../app_theme/app_colors.dart';
import '../resources/app_assets.dart';

class PickImageHandler {
  Future<String?> _pickImage(ImageSource source, bool cropImage,
      [CropAspectRatio? initCropAspectRatio,
      CropAspectRatioPreset? initCropAspectRatioPreset,
      bool? lockRatio,
      CropStyle? cropStyle]) async {
    String? path;

    ImagePicker imagePicker = ImagePicker();
    XFile? xFile = await imagePicker.pickImage(
        source: source, imageQuality: 90);

    if (cropImage) {
      if (xFile != null) {
        CroppedFile? croppedFile = await ImageCropper().cropImage(
          sourcePath: xFile.path,
          aspectRatio: initCropAspectRatio,
          uiSettings: [
            AndroidUiSettings(
              toolbarTitle: 'Cropper',
              toolbarWidgetColor: AppColors.darkColor,
              toolbarColor: AppColors.white,
              initAspectRatio: initCropAspectRatioPreset,
              lockAspectRatio: lockRatio ?? false,
            ),
            IOSUiSettings(
                title: 'Cropper', aspectRatioLockEnabled: lockRatio ?? false),
          ],
        );
        if (croppedFile != null) {
          path = croppedFile.path;
        }
      }
    } else {
      if (xFile != null) {
        path = xFile.path;
      }
    }

    return path;
  }

  void showPickUpImageSheet(bool cropImage, ValueChanged<String?> onSelected,
      [CropAspectRatio? initCropAspectRatio,
      CropAspectRatioPreset? initCropAspectRatioPreset,
      bool? lockRatio,
      CropStyle? cropStyle]) async {
    showModalBottomSheet(
        context: navigatorKey.currentContext!,
        builder: (context) {
          return Container(

            decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.only(
                topLeft:  Radius.circular(24.r),
                topRight:  Radius.circular(24.r),
              )
            ),
            padding: EdgeInsets.symmetric(horizontal: 16.0.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 24.h,
                ),
                Container(
                  width: 50.w,
                  height: 7.h,
                  decoration: BoxDecoration(
                      color: AppColors.darkColor,
                      borderRadius: BorderRadius.circular(4.r)),
                ),
                SizedBox(
                  height: 24.h,
                ),
                InkWell(
                  onTap: () async {
                    Navigator.pop(navigatorKey.currentContext!);
                    await Future.delayed(const Duration(milliseconds: 300));

                   String? path = await _pickImage(
                        ImageSource.camera,
                        cropImage,
                        initCropAspectRatio,
                        initCropAspectRatioPreset,
                        lockRatio,
                        cropStyle);
                   onSelected(path);
                  },
                  child: Container(
                    height: 56.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r),
                        border: Border.all(color: AppColors.primaryColor)),
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                       //  CustomSvgIcon(
                       // assetName:AppAssets.camera,
                       //    color: AppColors.darkColor,
                       //  ),
                        Icon(Icons.camera_alt),
                        SizedBox(
                          width: 8.w,
                        ),
                        CustomText(
                         title:  AppTranslate.camera.tr(),
                          fontSize: 14.sp,
                          fontColor: AppColors.darkColor,
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 12.h,
                ),
                InkWell(
                  onTap: () async {
                    Navigator.pop(navigatorKey.currentContext!);

                    await Future.delayed(const Duration(milliseconds: 300));

                    String? path = await _pickImage(
                        ImageSource.gallery,
                        cropImage,
                        initCropAspectRatio,
                        initCropAspectRatioPreset,
                        lockRatio,
                        cropStyle);
                    onSelected(path);

                  },
                  child: Container(
                    height: 56.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r),
                        border: Border.all(color: AppColors.primaryColor)),
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                       //  CustomSvgIcon(
                       // assetName: AppAssets.gallery,
                       //    color: AppColors.darkColor,
                       //  ),
                        Icon(Icons.image),
                        SizedBox(
                          width: 8.w,
                        ),
                        CustomText(
                       title: AppTranslate.gallery.tr(),
                          fontSize: 14.sp,
                          fontColor: AppColors.darkColor,
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 24.h,
                ),
              ],
            ),
          );
        });

  }
}
