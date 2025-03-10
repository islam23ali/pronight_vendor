import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:pronight_vendor/core/app_theme/app_colors.dart';
import 'package:pronight_vendor/core/extensions/num_extensions.dart';
import 'package:pronight_vendor/core/resources/app_assets.dart';
import 'package:pronight_vendor/core/resources/font_size.dart';
import 'package:pronight_vendor/presentations/components/custom_app_bar/custom_app_bar.dart';
import 'package:pronight_vendor/presentations/components/custom_scaffold/custom_scaffold.dart';
import 'package:pronight_vendor/presentations/components/custom_svg/CustomSvgIcon.dart';
import 'package:pronight_vendor/presentations/components/custom_text/custom_text.dart';
import 'package:pronight_vendor/presentations/modules/setting_page/screens/unit_images_page/unit_image_view_model.dart';
import 'package:provider/provider.dart';

import '../../../../../core/dimens/dimens.dart';

class UnitImagePages extends StatefulWidget {
  const UnitImagePages({super.key});

  @override
  State<UnitImagePages> createState() => _UnitImagePagesState();
}

class _UnitImagePagesState extends State<UnitImagePages> {
  int? itemIndex;
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: CustomAppBar(height: 64.h,title: 'الصور الخاصة بالوحدات',fontWeight: FontWeight.bold,),
    body: Consumer<UnitImageViewModel>(
      builder: (context,data,_) {
        return Padding(
          padding: EdgeInsets.all(Dimens.padding_12),
          child: Expanded(
            child: AnimationLimiter(
              child: ListView.builder(
                  // padding: EdgeInsets.symmetric(vertical: Dimens.padding_12v),
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return AnimationConfiguration.staggeredGrid(
                        duration:const Duration(milliseconds: 900),
                        position: index,
                        columnCount: 1,
                        child: ScaleAnimation(
                            duration:const Duration(milliseconds: 1000),
                            curve: Curves.fastLinearToSlowEaseIn,
                            child: FadeInAnimation(child:
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: Dimens.padding_8v,horizontal: Dimens.padding_12h),
                              child: Material(elevation: 4,borderRadius: BorderRadius.circular(8.r),
                                  color: AppColors.white,
                                  child: Column(
                                    children: [
                                      InkWell(onTap: (){
                                        setState(() {
                                          itemIndex=index;
                                        });
                                      },
                                        child: Container(
                                          padding: EdgeInsets.symmetric(horizontal: Dimens.padding_12,vertical: Dimens.padding_8),
                                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.r),
                                              border: Border.all(width: 1.5.w,color: const Color(0xffFAF7EB)),
                                              color: const Color(0xffF0FAFF)),
                                          child:Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              SizedBox(width: 270.w,
                                                  child:
                                                  Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                    CustomText(title: 'صور خاصة بالشاليهات',fontSize: AppFonts.font_12),SizedBox(height: 8.h),
                                                    CustomText(title: 'قم برفع صور خاصة بالشاليهات ',fontSize: AppFonts.font_10,fontColor: AppColors.gray,)
                                                  ],)),
                                              itemIndex!=index?const Icon(Icons.expand_more_rounded):
                                              const Icon(Icons.expand_less_rounded,)
                                            ],) ,),
                                      ),
                                      itemIndex!=index?const SizedBox(): Container(padding: EdgeInsets.symmetric(horizontal: Dimens.padding_12h,vertical:Dimens.padding_24v),
                                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.r)),
                                        child: AnimationLimiter(
                                          child: GridView.builder(
                                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 3,
                                                childAspectRatio: 1,
                                                crossAxisSpacing: 10.h,
                                                mainAxisSpacing: 15.h,
                                              ),
                                              physics: const NeverScrollableScrollPhysics(),
                                              shrinkWrap: true,
                                              itemCount: 6,
                                              itemBuilder: (context, index) {
                                                return AnimationConfiguration.staggeredGrid(
                                                    duration:const Duration(milliseconds: 900),
                                                    position: index,
                                                    columnCount: 3,
                                                    child: ScaleAnimation(
                                                        duration:const Duration(milliseconds: 1000),
                                                        curve: Curves.fastLinearToSlowEaseIn,
                                                        child: FadeInAnimation(child:
                                                        Stack(
                                                          children: [
                                                            InkWell(onTap: (){
                                                              data.catchImage();
                                                            },
                                                              child: Container(
                                                                // padding: EdgeInsets.all(Dimens.padding_8),
                                                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.r),color: AppColors.bgHomeColor),alignment: Alignment.center,
                                                                child:(data.image!=null)?ClipRRect(
                                                                  borderRadius: BorderRadius.circular(8.r),
                                                                  child: Image.file(
                                                                      File(data.image?.path ?? ''),
                                                                      fit: BoxFit.cover),
                                                                ): Center(child: CustomSvgIcon(assetName: AppAssets.upload,width: 40.14.w,height:30.h,)),),
                                                            ),
                                                            Positioned(
                                                                bottom: 2,
                                                                left: 0,
                                                                right: 0,
                                                                child: InkWell(
                                                                  onTap: () {
                                                                    if (data.image != null) {
                                                                      data.deleteImage();
                                                                    } else {
                                                                      data.catchImage();
                                                                    }
                                                                  },
                                                                  child: Center(
                                                                    child: (data.image == null)?const SizedBox(): Container(
                                                                      width: 18.w,
                                                                      height: 20.h,
                                                                      decoration: BoxDecoration(
                                                                          borderRadius:
                                                                          BorderRadius.circular(100.r),
                                                                          border: Border.all(
                                                                              width: 1.w,
                                                                              color: (data.image != null)
                                                                                  ? AppColors.white
                                                                                  : AppColors
                                                                                  .primaryColor),
                                                                          color: (data.image != null)
                                                                              ? Colors.red
                                                                              : AppColors.primaryColor),
                                                                      child: Center(
                                                                          child: Icon(
                                                                            (data.image != null)
                                                                                ? Icons.close
                                                                                : Icons.add,
                                                                            color: AppColors.white,
                                                                            size: 12.r,
                                                                          )),
                                                                    ),
                                                                  ),
                                                                ))
                                                          ],
                                                        ),
                                                        )));
                                              }),
                                        ),)
                                    ],
                                  )),
                            ),
                            )));
                  }),
            ),
          ),
        );
      }
    ),);
  }
}
