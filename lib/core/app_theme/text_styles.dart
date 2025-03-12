import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../main.dart';
import 'app_colors.dart';

String lang = navigatorKey.currentContext!.locale.languageCode;

class AppTextStyles {

  TextStyle normalText({double fontSize = 14,TextDecoration decoration = TextDecoration.none,decorationColor}){

    return TextStyle(fontSize: fontSize,fontFamily: 'font_regular',decoration: decoration,decorationColor:decorationColor?? AppColors.darkColor);

  }




}
///round a double
extension Ex on double {
  double toPrecision(int n) => double.parse(toStringAsFixed(n));
}
extension TextStyleExtension on TextStyle{
  TextStyle textColorNormal(Color color) => copyWith(color: color ,fontFamily:'font_regular');
  TextStyle textColorBold(Color color) => copyWith(color: color,fontFamily:'font_bold',fontWeight: FontWeight.w700);
  TextStyle textColorMoreBold(Color color) => copyWith(color: color,fontFamily:'font_bold',fontWeight: FontWeight.w700);
  TextStyle textColorNormalDecoration(Color color,Color decoration) => copyWith(color: color,fontFamily: 'font_regular' ,fontWeight: FontWeight.normal,decorationColor: decoration,decoration: TextDecoration.underline);
  TextStyle textColorBoldDecoration(Color color,Color decoration) => copyWith(color: color,fontFamily:'font_bold' ,fontWeight: FontWeight.bold,decorationColor: decoration,decoration: TextDecoration.underline);
}

