import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pronight_vendor/core/extensions/num_extensions.dart';
import 'package:pronight_vendor/core/navigator/navigator.dart';
import 'package:pronight_vendor/core/resources/app_translate.dart';
import 'package:pronight_vendor/data/datasource/local/LocalUserData.dart';
import 'package:pronight_vendor/data/models/response/all_visit_permits_model.dart';
import '../../../../core/app_theme/app_colors.dart';
import '../../../../core/dimens/dimens.dart';
import 'package:flutter/widgets.dart' as ui;
import '../../../../core/resources/app_assets.dart';
import '../../../../core/resources/font_size.dart';
import '../../../../injection.dart';
import '../../../components/custom_svg/CustomSvgIcon.dart';
import '../../../components/custom_text/custom_text.dart';
import '../contract_screens/contract_details.dart';
import '../visit_permits_screens/visit_permits_details.dart';
import 'custom_coupon_card.dart';

class CustomVisitPermitsItem extends StatefulWidget {
  const CustomVisitPermitsItem({super.key, required this.model});
  final OneVisitPermit? model;

  @override
  State<CustomVisitPermitsItem> createState() => _CustomVisitPermitsItemState();
}

class _CustomVisitPermitsItemState extends State<CustomVisitPermitsItem> {
  LocalUserData saveData = getIt<LocalUserData>();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(),
            Container(width: 322.w,
              decoration: BoxDecoration(color: AppColors.cardColor,borderRadius: BorderRadius.circular(15.r)),
              padding: EdgeInsets.all(Dimens.padding_16),
              margin: EdgeInsets.symmetric(vertical: Dimens.padding_4v),
              child:
              Column(
                children: [
                  Row(
                    children: [
                      SizedBox(width: 177.w,
                        child: Column(children: [
                          Row(children: [
                            CustomSvgIcon(assetName: AppAssets.address,width: 13.w,height: 14.h,),
                            SizedBox(width: 5.w),
                            CustomText(title: widget.model?.villa?.name??'',fontSize: AppFonts.font_10,fontWeight: FontWeight.bold,fontColor: AppColors.textColor3,)
                          ]),
                          SizedBox(height: 10.h),
                          Row(children: [
                            CustomSvgIcon(assetName: AppAssets.date,width: 13.w,height: 14.h,),
                            SizedBox(width: 5.w),
                            CustomText(title:  widget.model?.visitDate??'',fontSize: AppFonts.font_11,fontColor: AppColors.textColor2,)
                          ]),
                        ],),),
                      SizedBox(child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(children: [
                            CustomSvgIcon(assetName: AppAssets.beach,width: 20.w,height: 20.h,),
                            SizedBox(width: 5.w),
                            CustomText(title:  widget.model?.beach?.name??'',fontSize: AppFonts.font_11,fontColor: AppColors.textColor3,)
                          ]),
                          SizedBox(height: 10.h),
                          Row(children: [
                            CustomSvgIcon(assetName: AppAssets.date,width: 13.w,height: 14.h,),
                            SizedBox(width: 5.w),
                            CustomText(title:  widget.model?.createdAt??'',fontSize: AppFonts.font_11,fontColor: AppColors.textColor2,)
                          ]),
                        ],
                      ),)
                    ],),
                  Align(alignment:saveData.getLang()=='ar'? Alignment.bottomLeft: Alignment.bottomRight,
                    child: InkWell(onTap: (){
                      NavigatorHandler.push( VisitPermitsDetails(id: widget.model?.id.toString()??'',));
                    },
                      child: CustomText(textAlign: TextAlign.left,
                        title: AppTranslate.details.tr(),fontSize: AppFonts.font_9,fontWeight: FontWeight.bold,fontColor: Color(0xff1C472E),),
                    ),
                  )
                ],
              ),),
          ],
        ),
        saveData.getLang()=='ar'? Positioned(right: 0,bottom: 0,top: 0,
          child:Container(padding: EdgeInsets.all(Dimens.padding_8),
            decoration:const BoxDecoration(shape: BoxShape.circle,color: AppColors.primaryColor,),
            child: Center(child: CustomText(title: widget.model?.sector?.name??'',fontSize: AppFonts.font_15,fontWeight: FontWeight.bold,fontColor: AppColors.white,)),) ,):
        Positioned(left: 0,bottom: 0,top: 0,
          child:Container(padding: EdgeInsets.all(Dimens.padding_8),
            decoration:const BoxDecoration(shape: BoxShape.circle,color: AppColors.primaryColor,),
            child: Center(child: CustomText(title: widget.model?.sector?.name??'',fontSize: AppFonts.font_15,fontWeight: FontWeight.bold,fontColor: AppColors.white,)),) ,)
      ],
    );
  }
}
