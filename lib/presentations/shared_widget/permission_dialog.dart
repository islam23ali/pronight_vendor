
import 'package:pronight_vendor/core/extensions/num_extensions.dart';
import 'package:pronight_vendor/core/navigator/navigator.dart';
import 'package:pronight_vendor/core/resources/app_translate.dart';
import 'package:pronight_vendor/presentations/components/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../../../../core/app_theme/app_colors.dart';
import '../../../../../../core/dimens/dimens.dart';
import '../../../../../../main.dart';
import '../components/custom_button/custom_button.dart';



void showPermissionDialog(String titlePermission) {
  // var status = await Permission.microphone.status;
  showDialog(
      barrierDismissible: false,
      context: navigatorKey.currentContext!,
      builder: (BuildContext context) {
        return WillPopScope(onWillPop: ()async{
          if(await Permission.microphone.status.isGranted){return true;}
          else{
            return false;}
        },
          child: AlertDialog(surfaceTintColor: AppColors.white,
            insetPadding: EdgeInsets.symmetric(horizontal: Dimens.padding_16h,vertical:Dimens.padding_8h),
            contentPadding: EdgeInsets.all( Dimens.padding_16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.r)),
            backgroundColor: AppColors.white,
            title: CustomText(title: titlePermission),
            actions:[
              CustomButton(onTap:()async{
                if(await Permission.microphone.status.isGranted){
                 NavigatorHandler.pop();

                }
                else{
                  openAppSettings();}
              }, title: AppTranslate.confirm
              )
            ],
          ),
        );
      }
  );
}