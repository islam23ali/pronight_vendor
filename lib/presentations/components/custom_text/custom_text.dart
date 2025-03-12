import 'package:flutter/material.dart';

import '../../../core/app_theme/app_colors.dart';
import '../../../core/app_theme/text_styles.dart';
import '../../../core/resources/font_size.dart';



class CustomText extends StatelessWidget {
  final String? title;
  final Color? fontColor;
  final double ? fontSize;
  final FontWeight fontWeight;
  final int? maxLines;
  final TextAlign? textAlign;
  final TextStyle? textStyle;
  final TextDecoration decoration;

  const CustomText({super.key,required this.title,this.fontColor ,this.fontSize,this.fontWeight = FontWeight.normal,this.maxLines,this.textAlign, this.decoration= TextDecoration.none, this.textStyle});

  @override
  Widget build(BuildContext context) {

    return fontWeight==FontWeight.normal?
    Text(title??'',maxLines: maxLines,overflow: maxLines!=null?TextOverflow.ellipsis:null,style:textStyle?? AppTextStyles().normalText(fontSize: fontSize??AppFonts.font_14,decoration: decoration,decorationColor:fontColor).textColorNormal(fontColor?? AppColors.darkColor,),textAlign: textAlign,):
    Text(title??'',maxLines: maxLines,overflow: maxLines!=null?TextOverflow.ellipsis:null,style:textStyle?? AppTextStyles().normalText(fontSize: fontSize??AppFonts.font_14,decoration: decoration,decorationColor:fontColor).textColorBold(fontColor?? AppColors.darkColor,),textAlign: textAlign,);
  }
}
