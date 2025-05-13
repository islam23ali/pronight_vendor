import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pronight_vendor/core/app_theme/app_colors.dart';
import 'package:pronight_vendor/core/dimens/dimens.dart';
import 'package:pronight_vendor/core/extensions/num_extensions.dart';
import 'package:pronight_vendor/core/resources/app_translate.dart';
import 'package:pronight_vendor/core/resources/font_size.dart';
import 'package:pronight_vendor/presentations/components/custom_scaffold/custom_scaffold.dart';
import 'package:pronight_vendor/presentations/components/custom_text/custom_text.dart';
import 'package:pronight_vendor/presentations/modules/home_page/home_view_model.dart';
import 'package:pronight_vendor/presentations/modules/setting_page/screens/reservation_screen/widgets/custom_reservation_list.dart';
import 'package:provider/provider.dart';

import '../../../../../injection.dart';
import '../../../../components/custom_app_bar/custom_app_bar.dart';
import '../../setting_view_model.dart';


class ReservationScreen extends StatefulWidget {
  const ReservationScreen({super.key});

  @override
  State<ReservationScreen> createState() => _ReservationScreenState();
}

class _ReservationScreenState extends State<ReservationScreen> {
  SettingsViewModel provider = getIt();
  @override
  void initState() {
    super.initState();
    provider.initReservation();
  }
  TextEditingController controller =TextEditingController();
  final pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Consumer<SettingsViewModel>(
        builder: (context,data,_) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal:Dimens.padding_16h),
                child: CustomAppBar(height: 56.h,
                  bgColor: AppColors.white,
                  topColor: AppColors.white,
                  title:AppTranslate.reservations.tr(),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal:Dimens.padding_16h),
                child: Center(
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 16.h),
                    height: 41.h,width: 340.w,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(50.r),
                        color: AppColors.itemBgColor
                    ),child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(onTap: (){
                        data.updateReservationType('new');
                        pageController.animateTo(0,
                            duration: const Duration(seconds: 1),
                            curve: Curves.easeInOut);
                        data.allReservation();
                      },
                        child: Container(
                          height: 35.h,width: 111.w,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(50.r),
                              color:(data.reservationType=='new')? AppColors.primaryColor:Colors.transparent
                          ),child:Center(child: CustomText(title: AppTranslate.New.tr(),fontSize: AppFonts.font_13,fontColor: (data.reservationType=='new')?AppColors.white:AppColors.primaryColor,)) ,),
                      ),
                      InkWell(onTap: (){
                        data.updateReservationType('current');
                        pageController.animateToPage(1,
                            duration: const Duration(seconds: 1),
                            curve: Curves.easeInOut);
                        data.allReservation();
                      },
                        child: Container(
                          height: 35.h,width: 111.w,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(50.r),
                              color:(data.reservationType=='current')? AppColors.primaryColor:Colors.transparent
                          ),child:Center(child: CustomText(title: AppTranslate.current.tr(),fontSize: AppFonts.font_13,fontColor: (data.reservationType=='current')?AppColors.white:AppColors.primaryColor,)) ,),
                      ),
                      InkWell(onTap: (){
                        data.updateReservationType('previous');
                        pageController.animateToPage(2,
                            duration: const Duration(seconds: 1),
                            curve: Curves.easeInOut);
                        data.allReservation();
                      },
                        child: Container(
                          height: 35.h,width: 111.w,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(50.r),
                              color:(data.reservationType=='previous')? AppColors.primaryColor:Colors.transparent
                          ),child:Center(child: CustomText(title: AppTranslate.previous.tr(),fontSize: AppFonts.font_13,fontColor:(data.reservationType=='previous')?AppColors.white:AppColors.primaryColor,)) ,),
                      ),
                    ],),),
                ),
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
                    CustomReservationList(isNew: true,),
                    CustomReservationList(isNew: false),
                    CustomReservationList(isNew: false),
                  ],),
              )
            ],);
        }
      ),
    );
  }
}
