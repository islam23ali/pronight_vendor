import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pronight_vendor/core/dimens/dimens.dart';
import 'package:pronight_vendor/core/extensions/num_extensions.dart';
import 'package:pronight_vendor/presentations/modules/add_unit_page/add_unit_view_model.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/app_theme/app_colors.dart';
import '../../../../../../core/resources/app_assets.dart';
import '../../../../../../core/resources/app_translate.dart';
import '../../../../../../core/resources/font_size.dart';
import '../../../../../../core/utils/imageCroper.dart';
import '../../../../../components/custom_svg/CustomSvgIcon.dart';
import '../../../../../components/custom_text/custom_text.dart';

class UpLoadMainImage extends StatefulWidget {
  const UpLoadMainImage({super.key});

  @override
  State<UpLoadMainImage> createState() => _UpLoadMainImageState();
}

class _UpLoadMainImageState extends State<UpLoadMainImage> {

  @override
  Widget build(BuildContext context) {
    return Consumer<AddUnitViewModel>(
      builder: (context,data,_) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
                title: AppTranslate.mainImage.tr(),
                fontSize: AppFonts.font_12,
                fontColor: AppColors.primaryColor),
            SizedBox(height: 20.h),
            SizedBox(height: 110.h,
              child: ClipRRect(borderRadius: BorderRadius.circular(12.r),
                child: Stack(
                  children: [
                    InkWell(onTap: (){
                      data.pickImage();
                    },
                      child:(data.image!=null)?Image.file(File(data.image??''),fit: BoxFit.cover,width: Dimens.width,): Column(mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          CustomSvgIcon(assetName: AppAssets.upload,width: 52.5.w,height: 41.55.h),
                          SizedBox(height: 20.h),
                          CustomText(
                              title: AppTranslate.uploadMainImageHere.tr(),
                              fontSize: AppFonts.font_12,
                              fontColor:const Color(0xffCCCCCC)),
                          SizedBox(height: 10.h),
                          Divider(thickness: 3.h,color:const Color(0xffCCCCCC),)
                        ],),
                    ),
                    Positioned(top: 5,left: 5,
                        child: InkWell(onTap: (){
                          setState(() {
                            data.image=null;
                          });
                        },
                          child:(data.image==null)?const SizedBox(): Container(width: 20.w,height: 20.h,
                                          decoration: BoxDecoration(borderRadius:BorderRadius.circular(100.r),border: Border.all(width: 1.w,color: AppColors.white),color: Colors.red ),
                                          child:Center(child: Icon(Icons.close,color: AppColors.white,size: 12.r,)) ,),
                        ))
                  ],
                ),
              )),
          ],
        );
      }
    );
  }
}
