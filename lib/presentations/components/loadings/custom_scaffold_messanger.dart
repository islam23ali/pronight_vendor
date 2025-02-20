import 'package:pronight_vendor/core/app_theme/app_colors.dart';
import 'package:pronight_vendor/core/resources/font_size.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../main.dart';
import '../custom_text/custom_text.dart';


class CustomScaffoldMessanger{
  static void showScaffoledMessanger({required String title,Color? bg,Color? fontColor,}){
    ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
        SnackBar(content:CustomText(title: title,fontColor: fontColor??AppColors.white,fontSize:AppFonts.font_14,),backgroundColor: bg??AppColors.primaryColor,));
  }

  static void showToast({required String title,Color? bg,Color? fontColor,ToastGravity gravity = ToastGravity.BOTTOM}){
    Fluttertoast.showToast(msg:title,backgroundColor: bg ?? AppColors.primaryColor,textColor: fontColor??AppColors.white,gravity: gravity);
  }
}