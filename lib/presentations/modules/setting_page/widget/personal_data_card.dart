import 'package:easy_localization/easy_localization.dart';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:pronight_vendor/core/dimens/dimens.dart';
import 'package:pronight_vendor/core/extensions/num_extensions.dart';
import 'package:pronight_vendor/core/navigator/navigator.dart';
import 'package:pronight_vendor/core/resources/app_translate.dart';
import 'package:pronight_vendor/core/resources/font_size.dart';
import 'package:pronight_vendor/presentations/components/custom_svg/CustomSvgIcon.dart';
import 'package:pronight_vendor/presentations/components/custom_text/custom_text.dart';
import 'package:pronight_vendor/presentations/modules/home_page/screens/all_reports/all_reports.dart';
import 'package:pronight_vendor/presentations/modules/notification_screen/notification_screen.dart';
import '../../../../core/app_theme/app_colors.dart';
import '../../../../core/resources/app_assets.dart';
import '../screens/reservation_screen/reservation_screen.dart';
import '../screens/statistics_page/statistics_page.dart';
import '../screens/unit_images_page/unit_image_pages.dart';
import '../screens/update_profile/update_profile.dart';

class PersonalDataCard extends StatefulWidget {
  const  PersonalDataCard({Key? key}) : super(key: key);

  @override
  _PersonalDataCardState createState() => _PersonalDataCardState();
}

class _PersonalDataCardState extends State<PersonalDataCard> {
  @override
  Widget build(BuildContext context) {
    return Material(elevation: 10,shadowColor: AppColors.white.withAlpha((0.90*255).round()),
      borderRadius: BorderRadius.circular(16.r),
      child: Container(
          decoration: BoxDecoration(color: AppColors.white,
              borderRadius: BorderRadius.circular(16.r)),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: Dimens.padding_12h,vertical: Dimens.padding_16v ),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            CustomText(title: AppTranslate.personalData.tr(),fontSize: AppFonts.font_12,),
            _buildItem(context,
                image: AppAssets.profileIcon,
                isRow:true,
                title: AppTranslate.editProfile.tr(),
                onTap: () {
                  NavigatorHandler.push(const UpdateProfile());
                }),
            // _buildItem(context,     waiting for adding hotels
            //   isRow:true,
            //   image: AppAssets.image,
            //   title: tr(AppTranslate.pictures),
            //   onTap: () {
            //    NavigatorHandler.push(const UnitImagePages());
            //   },
            // ),
            _buildItem(context,
              isRow:true,
              image: AppAssets.billNoti,
              title: tr(AppTranslate.myNotifications),
              onTap: () {
                NavigatorHandler.push(const NotificationScreen());
              },
            ),
            // _buildItem(context,
            //   isRow:true,
            //   image: AppAssets.reportes,
            //   title: tr(AppTranslate.reports),
            //   onTap: () {
            //     NavigatorHandler.push(const AllReportsScreen());
            //   },
            // ),
            // _buildItem(context,
            //   isRow:true,
            //   image: AppAssets.moneyWay,
            //   title: AppTranslate.financialMatters.tr(),
            //   onTap: () {
            //     // push(const PackagesScreen(fromSetting: true,));
            //   },
            // ),
            _buildItem(context,
              isRow:true,
              image: AppAssets.statuss,
              title: AppTranslate.statistics.tr(),
              onTap: () {
                NavigatorHandler.push(const StatisticsPage());
              },
            ),
            _buildItem(context,
              isRow:true,
              image: AppAssets.moneyWay,
              title: AppTranslate.reservations.tr(),
              onTap: () {
                NavigatorHandler.push(const ReservationScreen());
              },
            ),
            ],),
          )),
    );
  }
}
_buildItem(BuildContext context,
    {required String image,
      required String title,
      Color? titleColor,
      bool? isRow,
      String? subTitle,
      GestureTapCallback? onTap}) {
  return ListTile(

    onTap: onTap,
    minVerticalPadding: 0,
    contentPadding: const EdgeInsets.all(0),
    trailing:(isRow==true)? Icon(
      Icons.arrow_forward_ios,
      size: 16.r,
      color:  AppColors.blackColor,
    ):const SizedBox(),
    title: Transform(transform: Matrix4.translationValues(15, 0.0, 0.0),
      child:CustomText(title: title,fontColor: AppColors.textGrayColor,fontSize: AppFonts.font_11,),
    ),dense: true,
    leading: SizedBox(width: 40.w,
      height: 40.h,
      child: Center(
        child: CustomSvgIcon(assetName:
          image,
          width: 20.w,
          height: 20.h,
        ),
      ),
    ),
  );
}