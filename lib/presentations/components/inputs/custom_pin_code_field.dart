import 'package:pronight_vendor/core/app_theme/app_colors.dart';
import 'package:pronight_vendor/core/dimens/dimens.dart';
import 'package:pronight_vendor/core/extensions/num_extensions.dart';
import 'package:pronight_vendor/core/resources/font_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'dart:ui' as ui;

import '../../../core/app_theme/text_styles.dart';

class CustomPinCodeTextField extends StatelessWidget {
  final int fieldsCount;
  final TextEditingController controller;
  const CustomPinCodeTextField({super.key, required this.fieldsCount, required this.controller});

  @override
  Widget build(BuildContext context) {
    return  Directionality(
      textDirection: ui.TextDirection.ltr,
      child: PinCodeTextField(
        enableActiveFill: true,
        mainAxisAlignment: MainAxisAlignment.center,
        keyboardType: TextInputType.number,
        autoDisposeControllers: false,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        appContext: context,
        length: fieldsCount,
        cursorColor: AppColors.primaryColor,
        textStyle: AppTextStyles().normalText(fontSize: AppFonts.font_16).textColorNormal(AppColors.darkColor),
        controller: controller,
        pinTheme: PinTheme(
            borderRadius: BorderRadius.circular(12.r),
            fieldOuterPadding: EdgeInsets.symmetric(horizontal: Dimens.padding_16h),
            fieldHeight: 56.w,
            fieldWidth: 56.w,
            shape: PinCodeFieldShape.box),
      ),
    );
  }
}
