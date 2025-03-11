import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:pronight_vendor/core/extensions/num_extensions.dart';
import 'package:pronight_vendor/core/resources/font_size.dart';
import 'package:pronight_vendor/presentations/components/custom_app_bar/custom_app_bar.dart';
import 'package:pronight_vendor/presentations/components/custom_scaffold/custom_scaffold.dart';
import 'package:pronight_vendor/presentations/components/images/network_image.dart';

import '../../../../../core/app_theme/app_colors.dart';
import '../../../../../core/dimens/dimens.dart';
import '../../../../../core/navigator/navigator.dart';
import '../../../../../core/resources/app_assets.dart';
import '../../../../components/custom_svg/CustomSvgIcon.dart';
import '../../../../components/custom_text/custom_text.dart';
import '../../../../components/inputs/custom_text_form.dart';
import 'chat/chat_screen.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({super.key});

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  TextEditingController controller =TextEditingController();
  bool? isActive=false;
  List<int> kkkk =[1,2,3,4,5,6,7,8,9,0];
  // List<int> kkkk =[];
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(appBar: CustomAppBar(title: 'الرسائل',height: 64.h,fontSize: AppFonts.font_14,fontWeight: FontWeight.bold,),
      body: (kkkk.isEmpty)?Center(child:
        Column(mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          Image.asset(width: 261.w,height: 211.h,
              'assets/images/icons/${AppAssets.messageGif}.gif'),
            CustomText(title: 'لا يوجد رسائل',fontSize: AppFonts.font_14,),
            SizedBox(height: 10.h),
            SizedBox(width: 217.w,
              child: CustomText(title: 'للأسف لا يوجد لديك رسائل الآن يرجى المتابعة فى وقت لاحق',
                textAlign: TextAlign.center,
                fontSize: AppFonts.font_12,fontColor: AppColors.textGrayColor,),
            )
        ],),):Column(children: [
          Padding(
            padding: EdgeInsets.all(Dimens.padding_16),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(width: 284.w,height: 36.h,
                    child: CustomTextFormField(controller: controller,underLineColor: Colors.transparent,
                      borderRaduis: 7.r,
                      padding:EdgeInsets.symmetric(horizontal: Dimens.padding_12h) ,
                      bgColor: Color(0xffEFF8F2),hint: 'بحث',hintFontColor: AppColors.primaryColor,)),
                CustomSvgIcon(assetName: AppAssets.buttonSearch,width: 52.5.w,height: 36.h)
              ],
            ),
          ),
          SizedBox(height: 20.h),
          Expanded(
            child: AnimationLimiter(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: kkkk.length,
                  itemBuilder: (context, index) {
                    return AnimationConfiguration.staggeredGrid(
                        duration: const Duration(milliseconds: 900),
                        position: index,
                        columnCount: 1,
                        child:  ScaleAnimation(
                            duration: const Duration(milliseconds: 1000),
                            curve: Curves.fastLinearToSlowEaseIn,
                            child: FadeInAnimation(child:
                            InkWell(onTap: (){
                              setState(() {
                                isActive=true;
                              });
                              NavigatorHandler.push(const ChatScreen());
                            },
                              child:Stack(
                                children: [
                                  Container(
                                    margin: EdgeInsets.symmetric(horizontal: Dimens.padding_28h,vertical:  Dimens.padding_12v),
                                    padding: EdgeInsets.symmetric(horizontal: Dimens.padding_24h,vertical:  Dimens.padding_16v),
                                    decoration: BoxDecoration(color: isActive==true?const Color(0xffEFF8F2):Colors.transparent,
                                        border: Border.all(width: 1.w,color:isActive==true?Colors.transparent: const Color(0xffF2F2F2)),
                                        borderRadius: BorderRadius.only(topLeft: Radius.circular(23.r),topRight:Radius.circular(23.r),bottomRight:Radius.circular(16.r) )),
                                    child:Column(children: [
                                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          CustomText(title: 'محمد أحمد عبدالرحمن',fontSize: AppFonts.font_12,),
                                          Container(width: 10.w,height: 10.h,
                                            decoration: BoxDecoration(shape: BoxShape.circle,color:isActive==false?Colors.transparent: AppColors.errorColor),)
                                        ],),
                                      SizedBox(height: 10.h),
                                      Row(
                                        children: [
                                          SizedBox(width: 10.w),
                                          Expanded(child: CustomText(title: 'السلام عليكم ورحمة الله وبركاته أستاذ أحمد محمد أرجو الموافقة على ....................',fontSize: AppFonts.font_11,fontWeight: FontWeight.w400,fontColor: AppColors.textGrayColor,)),
                                        ],
                                      ),
                                    ],) ,),
                                  Positioned(right: 10,bottom: 0,top: 0,
                                      child: Center(child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(100.r),border: Border.all(width: 2.w,color: AppColors.primaryColor.withAlpha((0.50*255).round()))),
                                          child: AppNetworkImage(imageUrl: 'imageUrl',borderRadius: 100.r,width: 37.w,height: 37.h,errorImage: AppAssets.splashLogo,))))
                                ],
                              ),
                            )
                            )));
                  }),
            ),
          )
        ],) ,);
  }
}
