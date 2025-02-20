import 'package:pronight_vendor/core/app_theme/app_colors.dart';
import 'package:pronight_vendor/core/dimens/dimens.dart';
import 'package:pronight_vendor/core/extensions/num_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/app_theme/text_styles.dart';

class CustomTextFormFieldNumber extends StatelessWidget {
  final String? hint;
  final TextEditingController controller;
  final Widget? prefix;
  final Widget? suffix;
  final bool readOnly;
  final Color? bgColor;
  final double? borderRaduis;
  final ValueChanged<String>? onChange;

  const CustomTextFormFieldNumber({super.key,required this.controller,this.hint,this.prefix,this.suffix,this.readOnly = false,this.bgColor, this.onChange, this.borderRaduis});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:  EdgeInsets.symmetric(horizontal: Dimens.padding_16h),
      height: 56.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(color: bgColor??AppColors.darkColor,borderRadius: BorderRadius.circular(borderRaduis??16.r)),
      child: TextFormField(
        readOnly:readOnly ,
        controller: controller,
        textAlignVertical: TextAlignVertical.center,
        cursorColor: AppColors.primaryColor,
        style: AppTextStyles().normalText().textColorNormal(AppColors.darkColor),
        keyboardType: const TextInputType.numberWithOptions(signed: false,decimal: true),
        inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d+.?\d{0,1}'))],
        onChanged: onChange,
        decoration: InputDecoration(

          border: InputBorder.none,
          hintText: hint,
          hintStyle: AppTextStyles().normalText().textColorNormal(AppColors.darkColor),
          suffixIcon: suffix,
          prefixIcon: prefix,
          suffixIconConstraints:   BoxConstraints(maxHeight: 24.h,maxWidth:96.w,minWidth: 45.w,),
          prefixIconConstraints:  BoxConstraints(maxHeight: 24.h,maxWidth:96.w,minWidth: 45.w),
          counterText: '',

        ),
      ),
    );
  }
}
