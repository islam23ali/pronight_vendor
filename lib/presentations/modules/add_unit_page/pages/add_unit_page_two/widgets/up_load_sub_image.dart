import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pronight_vendor/core/extensions/num_extensions.dart';
import 'package:pronight_vendor/presentations/modules/add_unit_page/add_unit_view_model.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/app_theme/app_colors.dart';
import '../../../../../../core/resources/app_assets.dart';
import '../../../../../../core/resources/app_translate.dart';
import '../../../../../../core/resources/font_size.dart';
import '../../../../../components/custom_svg/CustomSvgIcon.dart';
import '../../../../../components/custom_text/custom_text.dart';
import '../../../../../components/images/network_image.dart';

class UpLoadSubImages extends StatefulWidget {
  const UpLoadSubImages({super.key});

  @override
  State<UpLoadSubImages> createState() => _UpLoadSubImagesState();
}

class _UpLoadSubImagesState extends State<UpLoadSubImages> {

  @override
  Widget build(BuildContext context) {
    return Consumer<AddUnitViewModel>(
      builder: (context,data,_) {
        return InkWell(onTap: (){
          showModalBottomSheet(
            context: context,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20.r),
                )),
            builder: (BuildContext context) {
              return SafeArea(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                      leading: const Icon(Icons.camera_alt),
                      title: CustomText(title: 'takePicture'.tr()),
                      onTap: () {
                        data.getSupImages(ImageSource.camera);
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.image),
                      title: CustomText(title: 'chooseFromGallery'.tr()),
                      onTap: () {
                        data.getSupImages(ImageSource.gallery);
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              );
            },
          );
        },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                  title: AppTranslate.subImage.tr(),
                  fontSize: AppFonts.font_12,
                  fontColor: AppColors.primaryColor),
              SizedBox(height: 20.h),
              SizedBox(height: (data.images!=null)?210.h:110.h,
                child:(data.images?.isNotEmpty??true)?AnimationLimiter(
                  child: GridView.builder(physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount:3,
                        childAspectRatio: 1.1,
                        crossAxisSpacing:8,
                        mainAxisSpacing: 8,
                      ),
                      shrinkWrap:true,
                      itemCount: data.images?.length,
                      itemBuilder: (context, index) {
                        return AnimationConfiguration.staggeredGrid(
                            duration: const Duration(milliseconds: 900),
                            position: index,
                            columnCount: 3,
                            child: ScaleAnimation(
                                duration: const Duration(milliseconds: 1000),
                                curve: Curves.fastLinearToSlowEaseIn,
                                child: FadeInAnimation(child:
                                Stack(
                                  children: [
                                    SizedBox(width: 120.h,height: 101.75.w,
                                        child:ClipRRect(borderRadius: BorderRadius.circular(12.r),
                                            child: Image.file(File(data.images?[index].path??''),fit: BoxFit.fill,))
                                      // AppNetworkImage(imageUrl: data.addImageModel?.data?.image??'',borderRadius: 12.r,)
                                    ),
                                    Positioned(top: 10.h,left: 10.w,
                                        child: InkWell(onTap: (){
                                          if (index >= 0 && index < (data.images?.length)!) {
                                              data.images?.removeAt(index);
                                              data.refreshData();
                                          }
                                        },
                                          child: Container(width: 20.w,height: 20.h,
                                            decoration: BoxDecoration(borderRadius:BorderRadius.circular(100.r),border: Border.all(width: 1.w,color: AppColors.white),color: Colors.red ),
                                            child:Center(child: Icon(Icons.close,color: AppColors.white,size: 12.r,)) ,),
                                        ))
                                  ],
                                ))));
                      }),
                ):
                Column(mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    CustomSvgIcon(assetName: AppAssets.upload,width: 52.5.w,height: 41.55.h),
                    SizedBox(height: 20.h),
                    CustomText(
                        title: AppTranslate.youCanUploadMoreThanOneImageHere.tr(),
                        fontSize: AppFonts.font_12,
                        fontColor:const Color(0xffCCCCCC)),
                    SizedBox(height: 10.h),
                    Divider(thickness: 3.h,color:const Color(0xffCCCCCC),)
                  ],),),
            ],
          ),
        );
      }
    );
  }
}
