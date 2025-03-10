import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pronight_vendor/core/app_theme/app_colors.dart';
import 'package:pronight_vendor/core/dimens/dimens.dart';
import 'package:pronight_vendor/core/extensions/num_extensions.dart';
import 'package:pronight_vendor/core/resources/app_assets.dart';
import 'package:pronight_vendor/core/resources/app_translate.dart';
import 'package:pronight_vendor/core/resources/font_size.dart';
import 'package:pronight_vendor/presentations/components/custom_scaffold/custom_scaffold.dart';
import 'package:pronight_vendor/presentations/components/custom_svg/CustomSvgIcon.dart';
import 'package:pronight_vendor/presentations/components/custom_text/custom_text.dart';
import 'package:pronight_vendor/presentations/components/inputs/custom_text_form.dart';
import 'package:pronight_vendor/presentations/modules/contracts_page/widgets/custom_contract_list.dart';
import 'package:pronight_vendor/presentations/modules/contracts_page/widgets/custom_visit_permits_list.dart';
import 'package:pronight_vendor/presentations/modules/setting_page/screens/reservation_screen/widgets/custom_reservation_list.dart';

import '../../../../components/custom_app_bar/custom_app_bar.dart';


class ReservationScreen extends StatefulWidget {
  const ReservationScreen({super.key});

  @override
  State<ReservationScreen> createState() => _ReservationScreenState();
}

class _ReservationScreenState extends State<ReservationScreen> {
  TextEditingController controller =TextEditingController();
  int isContract = 0;
  final pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal:Dimens.padding_16h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomAppBar(height: 56.h,
              bgColor: AppColors.white,
              topColor: AppColors.white,
              title:AppTranslate.reservations.tr(),
              fontWeight: FontWeight.bold,
            ),
            Center(
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 16.h),
                height: 41.h,width: 340.w,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(50.r),
                    color: AppColors.itemBgColor
                ),child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(onTap: (){
                    setState(() {
                      isContract=0;
                    });
                    pageController.animateToPage(isContract,
                        duration: const Duration(seconds: 1),
                        curve: Curves.easeInOut);
                  },
                    child: Container(
                      height: 35.h,width: 111.w,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(50.r),
                          color:(isContract==0)? AppColors.primaryColor:Colors.transparent
                      ),child:Center(child: CustomText(title: AppTranslate.New.tr(),fontSize: AppFonts.font_13,fontColor: (isContract==0)?AppColors.white:AppColors.primaryColor,)) ,),
                  ),
                  InkWell(onTap: (){
                    setState(() {
                      isContract=1;
                    });
                    pageController.animateToPage(isContract,
                        duration: const Duration(seconds: 1),
                        curve: Curves.easeInOut);
                  },
                    child: Container(
                      height: 35.h,width: 111.w,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(50.r),
                          color:(isContract==1)? AppColors.primaryColor:Colors.transparent
                      ),child:Center(child: CustomText(title: AppTranslate.current.tr(),fontSize: AppFonts.font_13,fontColor: (isContract==1)?AppColors.white:AppColors.primaryColor,)) ,),
                  ),
                  InkWell(onTap: (){
                    setState(() {
                      isContract=2;
                    });
                    pageController.animateToPage(isContract,
                        duration: const Duration(seconds: 1),
                        curve: Curves.easeInOut);
                  },
                    child: Container(
                      height: 35.h,width: 111.w,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(50.r),
                          color:(isContract==2)? AppColors.primaryColor:Colors.transparent
                      ),child:Center(child: CustomText(title: AppTranslate.previous.tr(),fontSize: AppFonts.font_13,fontColor: (isContract==2)?AppColors.white:AppColors.primaryColor,)) ,),
                  ),
                ],),),
            ),
            SizedBox(height: 10.h),
            Expanded(
              child: PageView(
                controller: pageController,
                onPageChanged: (_){
                  setState(() {
                    // isContract=pageController.initialPage;

                  });
                },
                physics: const NeverScrollableScrollPhysics(),
                children:const [
                  CustomReservationList(),
                  CustomReservationList(),
                  CustomReservationList(),
                ],),
            )
          ],),
      ),
    );
  }
}
