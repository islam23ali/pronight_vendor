import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pronight_vendor/core/extensions/num_extensions.dart';
import 'package:pronight_vendor/core/resources/app_assets.dart';
import 'package:pronight_vendor/presentations/components/custom_svg/CustomSvgIcon.dart';
import '../../../../../../../../../core/app_theme/app_colors.dart';
import '../../../../../../../../../core/dimens/dimens.dart';
import '../../../../../../../../../core/resources/font_size.dart';
import '../../../../../../core/resources/app_translate.dart';
import '../../../../../../data/models/response/sectors_model.dart';
import '../../../../../components/custom_text/custom_text.dart';

/// CustomDropdownButton
class CustomSectorDropdownButton extends StatefulWidget {
  final List<OneSector> items;
  final OneSector? value;
  final Color? color;
  final Color? fontColor;
  final Color? iconEnabledColor;
  final Color? iconDisabledColor;
  final Color? inputColor;
  final double? width;
  final double? height;
  final Widget? hint;
  final TextStyle? textStyle;
  final bool? isCenter;
  final OneSector? selectedItem;

  final  Function(OneSector?) onChanged;


  const CustomSectorDropdownButton({super.key,
    required this.items,
    required this.value,
    required this.onChanged,
    this.color,
    this.fontColor,
    this.iconEnabledColor,
    this.width,
    this.inputColor,
    this.iconDisabledColor, this.isCenter, this.textStyle, this.hint, this.height, this.selectedItem,
  });

  @override
  State<CustomSectorDropdownButton> createState() => _CustomSectorDropdownButtonState();
}

class _CustomSectorDropdownButtonState extends State<CustomSectorDropdownButton> {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height:60.h ,
      child: DropdownButtonHideUnderline(
        child: DropdownButton2<OneSector>(
          isExpanded: true,
          underline:Container(height: 20.h,width: 300.w,color: Colors.black,),
          isDense: true,
          disabledHint: Container(height: 2.h,width: Dimens.width.w,color: Colors.grey,),
          hint:widget.hint?? Row(
            mainAxisAlignment: widget.isCenter==true?MainAxisAlignment.center:MainAxisAlignment.start,
            children: [
              CustomSvgIcon(assetName: AppAssets.clearField,width: 18.23.w,height: 16.h,),
              SizedBox(width: 10.w),
              CustomText(title:widget.value?.name?? AppTranslate.choose.tr(),fontWeight: FontWeight.normal,fontColor: widget.color?? AppColors.darkColor,fontSize: AppFonts.font_14)
            ],
          ),
          items: widget.items.map((OneSector item) => DropdownMenuItem<OneSector>(
            value: item,
            child:Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // CustomSvgIcon(assetName: AppAssets.reportIcon,width: 24.w,height: 24.w),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: Dimens.padding_12),
                      child: CustomText(title:item.name??'' ,fontWeight: FontWeight.normal,fontColor: AppColors.darkColor,fontSize: AppFonts.font_14,),
                    ),
                  ],
                ),
                // SizedBox(height: 8.h),
                // if (widget.items.indexOf(item) != widget.items.length - 1)
                //   Divider(color: AppColors.inputHint, height: 1.h),
              ],
            ),
          )).toList(),
          value:widget.selectedItem,
          onChanged: widget.onChanged,
          buttonStyleData:  ButtonStyleData(
            height: 56.h,
            padding: EdgeInsets.all(Dimens.padding_16),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12.r),
              // border: Border.all(width: 1.w,color:AppColors.darkColor.withAlpha((0.03 * 255).round()) ),
              color:widget.inputColor??AppColors.white, ),
          ),
          iconStyleData:  IconStyleData(
            icon:Icon(Icons.expand_more_rounded,size: 20.r,),
            // icon:CustomSvgIcon(assetName: AppAssets.block,width: 24.w,height: 24.w),
            iconSize: 16.r,
            iconEnabledColor:widget.iconEnabledColor?? AppColors.darkColor,
            iconDisabledColor:widget.iconDisabledColor?? AppColors.errorColor,
          ),
          dropdownStyleData: DropdownStyleData(
            maxHeight: 200,
            direction:DropdownDirection.right,
            width:widget.width?? 343.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              border: Border.all(color: AppColors.darkColor.withAlpha((0.03 * 255).round()), width: 1.w),
              color:  AppColors.white,
            ),
            offset: const Offset(0, 0),
            scrollbarTheme: ScrollbarThemeData(
              radius: const Radius.circular(40),
              thickness: WidgetStateProperty.all<double>(6),
              thumbVisibility: WidgetStateProperty.all<bool>(true),
            ),
          ),
          menuItemStyleData:  MenuItemStyleData(
            height:widget.height?? 40.h,
            padding: EdgeInsets.only(left: 12.w, right: 12.w),
          ),
        ),
      ),
    );
  }
}
/// example for hot to use

