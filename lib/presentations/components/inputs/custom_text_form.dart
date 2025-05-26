
import 'package:pronight_vendor/core/extensions/num_extensions.dart';
import 'package:easy_localization/easy_localization.dart' as el;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/app_theme/app_colors.dart';
import '../../../core/app_theme/text_styles.dart';
import '../../../core/dimens/dimens.dart';
import '../../../core/resources/font_size.dart';


extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
  bool isStrongPassword() {
    return RegExp (r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d).{8,}$')
        .hasMatch(this);
  }
}
class CustomTextFormField extends StatefulWidget {
  final String? hint;
  final TextInputType? textInputType;
  final TextEditingController controller;
  final Widget? prefix;
  final Widget? suffix;
  final bool readOnly;
  final Color? bgColor;
  final Color? hintFontColor;
  final Color? underLineColor;
  final Color? bordercolor;
  final double? borderRaduis;
  final double? height;
  final double? width;
  final double? vertical;
  final double? hintFontSize;
  final TextDirection? hintDirection;
  final double? fontSize;
  final double? maxHeight;
  final double? maxWidth;
  final FocusNode? focusNode;
  final EdgeInsets? padding;
  final int? maxLines;
  final List<TextInputFormatter>? inputFormatters;
  final ValueChanged<String>? onChange;
  final void Function()? onTap;
  final TextAlign? textAlign;

  const CustomTextFormField({super.key,required this.controller,this.hint,this.inputFormatters,this.prefix,this.suffix,this.textInputType ,this.readOnly = false,this.bgColor, this.onChange, this.borderRaduis, this.height, this.bordercolor, this.onTap, this.textAlign, this.vertical, this.hintFontSize, this.fontSize, this.maxLines=1, this.hintDirection, this.width, this.maxHeight, this.maxWidth, this.padding, this.focusNode, this.underLineColor, this.hintFontColor});

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: widget.padding?? const EdgeInsets.symmetric(horizontal: 0),
      //widget.maxLines==null?null:
      height:widget.height??56.h,
      alignment: Alignment.center,
      width:widget.width ,
      decoration: BoxDecoration(color: widget.bgColor??AppColors.white,borderRadius: BorderRadius.circular(widget.borderRaduis??12.r),border: Border.all(color:widget.bordercolor?? Colors.transparent,)),
      child: Center(
        child: TextFormField(
          focusNode:widget.focusNode ,
          maxLines: widget.maxLines,
          textAlign:widget.textAlign?? TextAlign.start,
          onTap: widget.onTap,
          inputFormatters: widget.textInputType == TextInputType.phone
              ? [FilteringTextInputFormatter.digitsOnly]
              : widget.textInputType == TextInputType.visiblePassword?[
            FilteringTextInputFormatter.deny(RegExp(r'\s')), // Deny spaces
          ]:widget.inputFormatters?? [],
          // textAlign: widget.textInputType == TextInputType.phone
          //     ? TextAlign.left // Align text to the left for phone input
          //     : TextAlign.start,
          readOnly:widget.readOnly ,
          controller: widget.controller,
          textAlignVertical: TextAlignVertical.center,
          cursorColor: AppColors.primaryColor,
          style: AppTextStyles().normalText( fontSize:widget.fontSize??AppFonts.font_14).textColorNormal(AppColors.darkColor),
          keyboardType: widget.textInputType??TextInputType.text,
          onChanged: widget.onChange,
          obscureText: widget.textInputType == TextInputType.visiblePassword
              ? _obscureText
              : false,
          decoration: InputDecoration(
            isDense: true,
            // contentPadding: EdgeInsets.symmetric(vertical:widget.vertical?? Dimens.padding_14v),
            border: InputBorder.none,
            enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
                width: 2.w,
                color:widget.underLineColor?? const Color(0xff000000).withAlpha((0.20*255).round()))),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  width: 2.w,
                  color:widget.underLineColor?? const Color(0xff000000).withAlpha((0.20*255).round())), // Change the color for the focused state
            ),
            disabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  width: 2.w,
                  color:widget.underLineColor?? const Color(0xff000000).withAlpha((0.20*255).round())), // Change the color for the disabled state
            ),
            // hintTextDirection:widget.hintDirection??(context.locale.languageCode == 'en' ? TextDirection.ltr : TextDirection.rtl),
            hintText: widget.hint,
            hintStyle: AppTextStyles().normalText(fontSize: widget.hintFontSize??AppFonts.font_12).textColorNormal(widget.hintFontColor??AppColors.darkColor.withAlpha((0.35 * 255).round())),
            prefixIcon: widget.prefix,
            suffixIconConstraints: BoxConstraints(maxHeight:widget.maxHeight?? 24.h,maxWidth:widget.maxWidth??26.w,minWidth: 24.w,),
            prefixIconConstraints: BoxConstraints(maxHeight:widget.maxHeight?? 24.h,maxWidth:widget.maxWidth??96.w,minWidth: 45.w),
            counterText: '',
            suffixIcon: widget.textInputType == TextInputType.visiblePassword
                ? IconButton(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              hoverColor: Colors.transparent,
              padding: EdgeInsets.zero,
              icon: Icon(
                _obscureText ? Icons.visibility_off : Icons.visibility,
                color: AppColors.darkColor.withAlpha((0.35 * 255).round()),
              ),
              onPressed: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
            )
                : widget.suffix,

          ),
        ),
      ),
    );
  }
}
