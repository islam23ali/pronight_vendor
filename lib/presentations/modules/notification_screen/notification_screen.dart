import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:pronight_vendor/core/app_theme/app_colors.dart';
import 'package:pronight_vendor/core/extensions/num_extensions.dart';
import 'package:pronight_vendor/core/resources/app_translate.dart';
import 'package:pronight_vendor/core/resources/font_size.dart';
import 'package:pronight_vendor/presentations/components/custom_app_bar/custom_app_bar.dart';
import 'package:pronight_vendor/presentations/components/custom_scaffold/custom_scaffold.dart';
import 'package:pronight_vendor/presentations/components/custom_text/custom_text.dart';
import 'package:pronight_vendor/presentations/modules/notification_screen/notification_view_model.dart';
import 'package:provider/provider.dart';
import '../../../core/dimens/dimens.dart';
import '../../../core/resources/app_assets.dart';
import '../../../injection.dart';
import '../../components/custom_svg/CustomSvgIcon.dart';

class NotificationScreen extends StatefulWidget {
  const  NotificationScreen({super.key});

  @override
  State< NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State< NotificationScreen> {

  NotificationsViewModel provider = getIt();
  @override
  void initState() {
    super.initState();
    provider.initNotifications();
  }
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar:CustomAppBar(height: 64.h,title: AppTranslate.notifications.tr(),fontSize: AppFonts.font_14,
        actions: [InkWell(onTap: (){provider.unReadNotification();},
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: Dimens.padding_16h),
            child: CustomText(title: AppTranslate.readAll.tr(),decoration: TextDecoration.underline,),
          ),
        )],
        fontWeight: FontWeight.bold,),
    body: Consumer<NotificationsViewModel>(
      builder: (context,data,_) {
        return RefreshIndicator(
          backgroundColor: AppColors.white,
          color: AppColors.primaryColor,
          onRefresh: ()async{provider.initNotifications();},
          child: Padding(
            padding: EdgeInsets.all(Dimens.padding_16),
            child:
            (data.notificationModel?.data?.isEmpty==true)? Center(
                child: ListView(
                  physics:const AlwaysScrollableScrollPhysics(),
                  children: [
                    Column(mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [CustomSvgIcon(assetName: AppTranslate.notificationLogo,width: 158.w,height: 158.h),
                      SizedBox(height: 30.h),
                      CustomText(title: AppTranslate.thereNoNotificationsYet.tr(),fontSize: AppFonts.font_23,fontColor: AppColors.textColor3,)
                      ],),
                  ],
                ),
              ):
            Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              // CustomText(title: 'اليوم',fontSize: AppFonts.font_14,fontColor: AppColors.darkPrimaryColor),
                SizedBox(height: 10.h),
                Expanded(
                  child: AnimationLimiter(
                    child: ListView.builder(
                        physics:const AlwaysScrollableScrollPhysics(),
                        shrinkWrap: true,
                        controller: data.scrollController,
                        itemCount: data.notificationsList?.length??0,
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
                                    data.readNotification(data.notificationsList?[index]?.id.toString()??'');
                                  },
                                    child: Container(
                                      padding: EdgeInsets.symmetric(horizontal:Dimens.padding_4,vertical:Dimens.padding_12 ),
                                      margin: EdgeInsets.only(top: Dimens.padding_4,bottom:Dimens.padding_4),
                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.r),color:data.notificationsList?[index]?.isRead==true?AppColors.darkColor.withAlpha((0.08*255).round()): AppColors.primaryColor.withAlpha((0.08*255).round())),
                                      child:Row(crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          SizedBox(width: 35.w,height: 35.h,child:const CustomSvgIcon(assetName: AppAssets.notifcationIcon)),
                                          SizedBox(width: 10.w),
                                          SizedBox(width: 275.w,
                                            child: Column(mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    CustomText(title: data.notificationsList?[index]?.title??'',fontColor:const Color(0xff0A2D43),fontSize: AppFonts.font_11,),
                                                    CustomText(title: data.notificationsList?[index]?.createdAt??'',fontColor: AppColors.textColor,fontSize: AppFonts.font_8)
                                                  ],),
                                                SizedBox(height: 10.h),
                                                CustomText(title:data.notificationsList?[index]?.body??'',fontColor: AppColors.textColor,fontSize: AppFonts.font_10)]),
                                          )
                                        ],) ,),
                                  )
                                  )));
                        }),
                  ),
                ),
            ],),
          ),
        );
      }
    ),
    );
  }
}
