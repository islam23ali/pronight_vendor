import 'package:pronight_vendor/core/dimens/dimens.dart';
import 'package:pronight_vendor/core/extensions/num_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../core/app_theme/app_colors.dart';
import '../../../core/app_theme/text_styles.dart';
import '../../../core/resources/font_size.dart';
import '../../../data/datasource/local/LocalUserData.dart';
import '../../../injection.dart';

class CustomPinCodeTextField extends StatelessWidget {
  final TextEditingController _controller;
  final int _count;
  final Color? fontColor;
  const CustomPinCodeTextField({super.key,
    required TextEditingController controller,
    required int count, this.fontColor,
  }) : _controller = controller,_count = count;

  @override
  Widget build(BuildContext context) {
    //put on provider in logic
    //late String otpPinCode;
    return Directionality(
      textDirection:TextDirection.ltr,
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: Dimens.padding_28h),
        child: PinCodeTextField(
          textStyle: AppTextStyles().normalText(fontSize: AppFonts.font_32).textColorBold(fontColor?? AppColors.primaryColor,),
          autoDisposeControllers: false,
          appContext: context,
          controller: _controller,
          inputFormatters:[FilteringTextInputFormatter.digitsOnly],
          textGradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              fontColor ?? AppColors.primaryColor ,
              fontColor ?? AppColors.primaryColor
            ],
          ),
          //autoFocus: false,
          keyboardType: TextInputType.number,
          length: _count,
          cursorColor:AppColors.darkColor,
          // obscureText: false,
          animationType: AnimationType.scale,
          // backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          pinTheme: PinTheme(
              // shape: PinCodeFieldShape.box,
              borderWidth: 1.w,
              selectedBorderWidth: .8.w,
              activeBorderWidth: .8.w,
              inactiveBorderWidth: .8.w,
              borderRadius: BorderRadius.circular(12.r),
              inactiveColor: AppColors.darkColor,
              activeColor:  AppColors.darkColor,
              selectedColor:  AppColors.darkColor,
              fieldWidth: 49.3.w,
              fieldHeight: 70.h
          ),
          boxShadows: [BoxShadow(offset: const Offset(0,1),color: AppColors.darkColor,spreadRadius: 1.r)],
          animationDuration: const Duration(milliseconds: 300),
          //backgroundColor: Colors.blue.shade50,
          //enableActiveFill: true,
          onCompleted: (submitedCode) {
            // otpPinCode = submitedCode;
            print("Completed");
          },
          onChanged: (value) {
            print(value);
          },
        ),
      ),
    );
  }


}
