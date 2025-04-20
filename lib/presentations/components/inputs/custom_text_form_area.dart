import 'package:pronight_vendor/core/app_theme/app_colors.dart';
import 'package:pronight_vendor/core/dimens/dimens.dart';
import 'package:pronight_vendor/core/extensions/num_extensions.dart';
import 'package:pronight_vendor/core/resources/font_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/app_theme/text_styles.dart';

class CustomTextFormFieldArea extends StatelessWidget {
  final String? hint;
  final TextEditingController controller;
  final double? height;
  final double? fontSizeHint;
  final double? fontSize;
  final Widget? prefix;
  final Widget? suffix;
  final bool readOnly;
  final FocusNode? focusNode;
  final Color? underLineColor;
  final Color? bgColor;
  final Color? borderColor;
  final double? borderRaduis;
  final ValueChanged<String>? onChange;

  const CustomTextFormFieldArea({super.key,required this.controller,this.hint,this.prefix,this.suffix,this.readOnly = false,this.bgColor, this.onChange, this.borderRaduis, this.height, this.focusNode, this.fontSizeHint, this.fontSize, this.underLineColor, this.borderColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:  EdgeInsets.symmetric(horizontal: Dimens.padding_16h),
      height:height==double.maxFinite? null:height?? 96.h,
      alignment: Alignment.topRight,
      decoration: BoxDecoration(color: bgColor??AppColors.white.withAlpha((0.08 * 255).round()),borderRadius: BorderRadius.circular(borderRaduis??16.r),border: Border.all(color:borderColor?? AppColors.darkColor.withAlpha((0.03 * 255).round()))),
      child: TextFormField(
        focusNode: focusNode,
        readOnly:readOnly ,
        controller: controller,
        textAlignVertical: TextAlignVertical.center,
        cursorColor: AppColors.primaryColor,
        style: AppTextStyles().normalText(fontSize:fontSize?? AppFonts.font_14).textColorNormal(AppColors.darkColor),
        keyboardType:TextInputType.multiline,
        maxLines: null,
        onChanged: onChange,
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  width: 2.w,
                  color:underLineColor?? const Color(0xff000000).withAlpha((0.20*255).round()))),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
                width: 2.w,
                color:underLineColor?? const Color(0xff000000).withAlpha((0.20*255).round())), // Change the color for the focused state
          ),
          disabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
                width: 2.w,
                color:underLineColor?? const Color(0xff000000).withAlpha((0.20*255).round())), // Change the color for the disabled state
          ),
          border: InputBorder.none,
          hintText: hint,
          hintStyle: AppTextStyles().normalText(fontSize: fontSizeHint??AppFonts.font_14).textColorNormal(AppColors.darkColor.withAlpha((0.35 * 255).round()),),
          suffixIcon: suffix,
          prefixIcon: prefix,
          suffixIconConstraints: BoxConstraints(maxHeight: 24.h,maxWidth:96.w,minWidth: 45.w,),
          prefixIconConstraints: BoxConstraints(maxHeight: 24.h,maxWidth:96.w,minWidth: 45.w),
          counterText: '',

        ),
      ),
    );
  }
}
