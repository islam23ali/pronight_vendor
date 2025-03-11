
import 'package:flutter/material.dart';
import 'package:pronight_vendor/core/extensions/num_extensions.dart';
import '../../../../../../../../core/app_theme/app_colors.dart';
import '../../../../../../../core/resources/app_assets.dart';
import '../../../../../../../core/resources/font_size.dart';
import '../../../../../../components/custom_svg/CustomSvgIcon.dart';
import '../../../../../../components/custom_text/custom_text.dart';

class MessageChat extends StatefulWidget {
  const MessageChat({super.key, required this.isMe, required this.message, required this.forwardMessage});
  final bool? isMe;
  final String? message;
  final String? forwardMessage;


  @override
  State<MessageChat> createState() => _MessageChatState();
}

class _MessageChatState extends State<MessageChat> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment:(widget.isMe!=true)? CrossAxisAlignment.end:CrossAxisAlignment.start,
      mainAxisAlignment:(widget.isMe!=true)? MainAxisAlignment.end: MainAxisAlignment.start,
      children: [
        Stack(
          children: [
            Column(
              crossAxisAlignment:(widget.isMe==false)? CrossAxisAlignment.end:CrossAxisAlignment.start,
              children: [
                Material(elevation: 4,color: AppColors.white,
                  borderRadius: BorderRadius.circular(20.r),
                  child: Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.r),color:(widget.isMe!=true)? AppColors.white:AppColors.primaryColor),
                    // margin: EdgeInsets.symmetric(vertical: 30.h,horizontal: 25.w),
                    padding: EdgeInsets.symmetric(vertical: 4.h,horizontal: 8.w),
                    child: Column(mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment:(widget.isMe==true)? CrossAxisAlignment.end:CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Container(
                        //   height: 26.h,
                        //   decoration: BoxDecoration(borderRadius: BorderRadius.circular(50.r),color: AppColors.greyColor),
                        //   child: Center(
                        //     child: CustomText(title: widget.forwardMessage??'',fontSize: AppFonts.font_11,textAlign: TextAlign.center,
                        //         fontColor: AppColors.white),
                        //   ),
                        // ),
                            Padding(
                              padding: EdgeInsets.all(8.r),
                              child: Column(
                                children: [
                                  CustomText(title: widget.message??'',fontColor: (widget.isMe!=true)? AppColors.blackColor:AppColors.white,),
                                  (widget.isMe==false)?const SizedBox():  Container(
                                    height: 26.h,width: 193.w,
                                    margin: EdgeInsets.symmetric(vertical: 4.h),
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(50.r),color: AppColors.white,border: Border.all(width: 2.w,color: AppColors.bgHomeColor)),
                                    child: Center(
                                      child: CustomText(title: 'Event',fontSize: AppFonts.font_12,textAlign: TextAlign.center,fontWeight: FontWeight.w600,
                                          fontColor: AppColors.greyColor),
                                    ),
                                  ),
                                  (widget.isMe==false)?const SizedBox():  Container(
                                    height: 26.h,width: 193.w,
                                    margin: EdgeInsets.symmetric(vertical: 4.h),
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(50.r),color: AppColors.white,border: Border.all(width: 2.w,color: AppColors.bgHomeColor)),
                                    child: Center(
                                      child: CustomText(title: 'volunteer',fontSize: AppFonts.font_12,textAlign: TextAlign.center,fontWeight: FontWeight.w600,
                                          fontColor: AppColors.greyColor),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                      ],),
                  ),
                ),
               ],
            ),
            (widget.isMe==false)?
            Positioned(
                right: 0,bottom: 0,
                child: Row(crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomText(title: widget.forwardMessage??'',fontSize: AppFonts.font_11,textAlign: TextAlign.center,
                        fontColor: AppColors.blackColor),
                    SizedBox(width: 5.w),
                    Container(width: 40.w,height: 40.h,
                      // margin: EdgeInsets.only(top: 10.h),
                      padding: EdgeInsets.all(10.r),
                      decoration: BoxDecoration(shape: BoxShape.circle,color:(widget.isMe!=true)?AppColors.white: AppColors.primaryColor),
                      child: CustomSvgIcon(assetName: AppAssets.splash,color:(widget.isMe!=false)?AppColors.white: AppColors.blackColor,width: 20.w,height: 20.h,),
                    ),

                  ],
                )
            ):Positioned(
                left: -0,bottom: 0,
                child:  Row(crossAxisAlignment: CrossAxisAlignment.center,
    children:[
    Container(width: 40.w,height: 40.h,
    // margin: EdgeInsets.only(top: 10.h),
    padding: EdgeInsets.all(10.r),
    decoration: BoxDecoration(shape: BoxShape.circle,color:(widget.isMe!=true)?AppColors.white: AppColors.primaryColor),
    child: CustomSvgIcon(assetName: AppAssets.sectorNumber,color:(widget.isMe!=false)?AppColors.white: AppColors.blackColor,width: 20.w,height: 20.h,),
    ),
      SizedBox(width: 5.w),
      CustomText(title: widget.forwardMessage??'',fontSize: AppFonts.font_11,textAlign: TextAlign.center,
          fontColor: AppColors.blackColor),],
                )
            ),
          ],
        ),
      ],
    );
  }
}
