import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:pronight_vendor/core/extensions/num_extensions.dart';
import 'package:pronight_vendor/data/models/response/one_unit_model.dart';

import '../../../../../core/app_theme/app_colors.dart';
import '../../../../../core/dimens/dimens.dart';
import '../../../../../core/resources/app_translate.dart';
import '../../../../../core/resources/font_size.dart';
import '../../../../components/custom_text/custom_text.dart';

class UnitData extends StatefulWidget {
  final OneUnitModel? model;
  const UnitData({super.key, required this.model});

  @override
  State<UnitData> createState() => _UnitDataState();
}

class _UnitDataState extends State<UnitData> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(scrollDirection: Axis.horizontal,
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(margin: EdgeInsets.symmetric(horizontal: Dimens.padding_4h),
                  height: 60.w,child: Column(children: [
                CustomText(title: AppTranslate.theAdults.tr(),fontSize: AppFonts.font_10,fontWeight: FontWeight.w500,fontColor: AppColors.textColor,),
                SizedBox(height: 5.h),
                Container(height: 38.h,padding: EdgeInsets.all(Dimens.padding_8),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.r),color: AppColors.bgHomeColor),alignment: Alignment.center,
                  child: CustomText(title: '${widget.model?.data?.maxAdultCount} ${AppTranslate.adults.tr()}',fontSize: AppFonts.font_12,fontWeight: FontWeight.w500,),)
              ])),

              Container( margin: EdgeInsets.symmetric(horizontal: Dimens.padding_4h),
                  height: 60.w,child: Column(children: [
                CustomText(title: AppTranslate.theChildren.tr(),fontSize: AppFonts.font_10,fontWeight: FontWeight.w500,fontColor: AppColors.textColor,),
                SizedBox(height: 5.h),
                Container(height: 38.h,padding: EdgeInsets.all(Dimens.padding_8),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.r),color: AppColors.bgHomeColor),alignment: Alignment.center,
                  child: CustomText(title: '${widget.model?.data?.maxChildCount} ${AppTranslate.kids.tr()}',fontSize: AppFonts.font_12,fontWeight: FontWeight.w500,),)
              ])),

              SizedBox(height: 60.w,
                child: ListView.builder(
                    shrinkWrap: true,
                    physics:const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.model?.data?.contents?.length??0,
                    itemBuilder: (context,index){
                      return Container(margin: EdgeInsets.symmetric(horizontal: Dimens.padding_4h),
                          child: Column(children: [
                        CustomText(title: AppTranslate.unitContents.tr(),fontSize: AppFonts.font_10,fontWeight: FontWeight.w500,fontColor: AppColors.textColor,),
                        SizedBox(height: 5.h),
                        Container(height: 38.h,padding: EdgeInsets.all(Dimens.padding_8),
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.r),color: AppColors.bgHomeColor),alignment: Alignment.center,
                          child: CustomText(title: '${widget.model?.data?.contents?[index].value} ${widget.model?.data?.contents?[index].title}',fontSize: AppFonts.font_12,fontWeight: FontWeight.w500,),)
                      ]));
                    }),
              ),
            ],),
        ),

      ],
    );
  }
}
