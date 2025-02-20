import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../core/app_theme/app_colors.dart';
import '../../../core/app_theme/text_styles.dart';
import '../../../core/resources/font_size.dart';

class TextClickWidget extends StatelessWidget {
  final String? text ;
  final String? subText ;
  final Color? textColor ;
  final Color? subTextColor ;
  final double? textFontSize ;
  final FontWeight? textFontWeight ;
  final double? supTextFontSize ;
  final TextStyle? subTextStyle ;
  final TextDecoration decoration ;
  final TextDecoration subDecoration ;
  final TextStyle? textStyle ;
  final GestureTapCallback? subTextOnTap;
  final GestureTapCallback? textOnTap;
  const TextClickWidget({super.key,
    this.textColor,
    this.text,
    this.subText,
    this.subTextOnTap, this.subTextColor, this.subTextStyle, this.textStyle, this.textOnTap, this.textFontSize,this.decoration= TextDecoration.none,this.subDecoration= TextDecoration.none, this.supTextFontSize, this.textFontWeight
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
      // fontWeight==FontWeight.normal?
      // Text(title??'',maxLines: maxLines,overflow: maxLines!=null?TextOverflow.ellipsis:null,style:textStyle?? AppTextStyles().normalText(fontSize: fontSize??AppFonts.font_14,decoration: decoration,).textColorNormal(fontColor?? AppColors.darkColor,),textAlign: textAlign,):
      // Text(title??'',maxLines: maxLines,overflow: maxLines!=null?TextOverflow.ellipsis:null,style:textStyle?? AppTextStyles().normalText(fontSize: fontSize??AppFonts.font_14,decoration: decoration).textColorBold(fontColor?? AppColors.darkColor,),textAlign: textAlign,);
          TextSpan(
            text: '${text ?? ''} ' ,
            style: textStyle ??AppTextStyles().normalText(fontSize: textFontSize??AppFonts.font_14,decoration: decoration).textColorNormal(textColor??AppColors.darkColor).copyWith(fontWeight:textFontWeight??FontWeight.normal, ),
            recognizer: TapGestureRecognizer()..onTap = textOnTap,
          ),
          TextSpan(
            text: subText ?? '',
            style:subTextStyle??AppTextStyles().normalText(fontSize: supTextFontSize??AppFonts.font_14,decoration: subDecoration).textColorNormal(subTextColor??AppColors.darkColor),
            recognizer: TapGestureRecognizer()..onTap = subTextOnTap,
          ),
        ],
      ),
    );
  }
}

