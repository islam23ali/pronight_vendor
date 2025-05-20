import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:pronight_vendor/core/app_theme/app_colors.dart';
import 'package:pronight_vendor/core/dimens/dimens.dart';
import 'package:pronight_vendor/core/extensions/num_extensions.dart';
import 'package:pronight_vendor/core/resources/app_assets.dart';
import 'package:pronight_vendor/core/resources/app_translate.dart';
import 'package:pronight_vendor/core/resources/font_size.dart';
import 'package:pronight_vendor/presentations/app_loader.dart';
import 'package:pronight_vendor/presentations/components/custom_app_bar/custom_app_bar.dart';
import 'package:pronight_vendor/presentations/components/custom_scaffold/custom_scaffold.dart';
import 'package:pronight_vendor/presentations/components/custom_svg/CustomSvgIcon.dart';
import 'package:pronight_vendor/presentations/components/custom_text/click_text.dart';
import 'package:pronight_vendor/presentations/components/custom_text/custom_text.dart';
import 'package:pronight_vendor/presentations/modules/setting_page/screens/statistics_page/widget/custom_calender_statistics.dart';
import 'package:pronight_vendor/presentations/modules/setting_page/screens/statistics_page/widget/custom_chart_line_data.dart';
import 'package:pronight_vendor/presentations/modules/setting_page/setting_view_model.dart';
import 'package:provider/provider.dart';

import '../../../../../injection.dart';
import '../../../contracts_page/widgets/custom_contract_item.dart';

class StatisticsPage extends StatefulWidget {
  const StatisticsPage({super.key});

  @override
  State<StatisticsPage> createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage> {
  SettingsViewModel provider = getIt<SettingsViewModel>();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      provider.getAllStatistics();
    });
  }
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: CustomAppBar(height: 64.h,title: AppTranslate.statistics.tr(),fontWeight: FontWeight.bold,fontSize: AppFonts.font_14,),
      body: Consumer<SettingsViewModel>(
        builder: (context,data,_) {
          return data.isLoading?const Center(child: AppLoader()):
          SingleChildScrollView(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [

              Padding(
                padding: EdgeInsets.all(Dimens.padding_24),
                child: CustomText(title: AppTranslate.duringYear.tr(),fontSize: AppFonts.font_18,fontWeight: FontWeight.w500,),
              ),
              CustomSelectDateStatistics(onDateSelected: (String value) {
                setState(() {
                print('mmmmmmmmm$value');
                WidgetsBinding.instance.addPostFrameCallback((_){
                  provider.getAllStatistics();
                });
              }); },),
                SizedBox(height: 20.h),
                Padding(
                  padding: EdgeInsets.all(Dimens.padding_8),
                  child: SizedBox(
                      height: 252.h,
                      child: CustomChartLineData(weights:  data.statisticsModel?.data?.unitsData??[],)),
                ),
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(12.r),
                      margin: EdgeInsets.symmetric(horizontal:Dimens.padding_12h,vertical:Dimens.padding_8h ),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.r),color: AppColors.primaryColor.withAlpha((0.15*255).round())),
                      child: Column(
                        children: [
                          Row(children: [
                            CustomSvgIcon(assetName: AppAssets.unSelectedItem,width: 22.w,height: 22.h),
                            SizedBox(width: 5.w),
                            CustomText(title: AppTranslate.numberOfUnitsDuringYear.tr(),fontSize: AppFonts.font_14,fontColor: AppColors.textGrayColor)
                          ]),
                          SizedBox(height: 10.w),
                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  CustomText(title: data.statisticsModel?.data?.unitsCount.toString()??'',fontSize: AppFonts.font_20,fontWeight: FontWeight.bold,),
                                  SizedBox(width: 5.w),
                                  CustomText(title: AppTranslate.unit.tr(),fontSize: AppFonts.font_12,fontColor: AppColors.textColor,),
                                ],
                              ),
                              CustomText(title: '${data.statisticsModel?.data?.unitsPercent}%',fontSize: AppFonts.font_20,fontWeight: FontWeight.bold,),
                            ],)
                        ],),),
                    Container(
                      padding: EdgeInsets.all(12.r),
                      margin: EdgeInsets.symmetric(horizontal:Dimens.padding_12h,vertical:Dimens.padding_8h ),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.r),color: AppColors.primaryColor.withAlpha((0.15*255).round())),
                      child: Column(
                        children: [
                          Row(children: [
                            CustomSvgIcon(assetName: AppAssets.unSelectedFiles,width: 22.w,height: 22.h),
                            SizedBox(width: 5.w),
                            CustomText(title: AppTranslate.numberContractsDuringYear.tr(),fontSize: AppFonts.font_14,fontColor: AppColors.textGrayColor)
                          ]),
                          SizedBox(height: 10.w),
                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  CustomText(title: data.statisticsModel?.data?.contractsCount.toString()??'',fontSize: AppFonts.font_20,fontWeight: FontWeight.bold,),
                                  SizedBox(width: 5.w),
                                  CustomText(title: AppTranslate.unit.tr(),fontSize: AppFonts.font_12,fontColor: AppColors.textColor,),
                                ],
                              ),
                              CustomText(title: '${data.statisticsModel?.data?.contractsPercent}%',fontSize: AppFonts.font_20,fontWeight: FontWeight.bold,),
                            ],)
                        ],),),
                  ],
                )
            ],),
          );
        }
      ),);
  }
}
