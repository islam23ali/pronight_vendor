import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:pronight_vendor/core/extensions/num_extensions.dart';
import 'package:pronight_vendor/core/navigator/navigator.dart';
import 'package:pronight_vendor/core/screen_state/no_data.dart';
import 'package:pronight_vendor/presentations/app_loader.dart';
import 'package:pronight_vendor/presentations/modules/units_page/unit_details/unit_details.dart';
import 'package:pronight_vendor/presentations/modules/units_page/units_view_model.dart';
import 'package:pronight_vendor/presentations/modules/units_page/widgets/custom_unit_card.dart';
import 'package:provider/provider.dart';
import '../../../core/app_theme/app_colors.dart';
import '../../../core/dimens/dimens.dart';
import '../../../core/resources/app_assets.dart';
import '../../../core/resources/app_translate.dart';
import '../../../injection.dart';
import '../../components/custom_app_bar/custom_app_bar.dart';
import '../../components/custom_svg/CustomSvgIcon.dart';
import '../../components/inputs/custom_text_form.dart';

class UnitsPage extends StatefulWidget {
  const UnitsPage({super.key});

  @override
  State<UnitsPage> createState() => _UnitsPageState();
}

class _UnitsPageState extends State<UnitsPage> {
  UnitsViewModel provider = getIt();

  @override
  void initState() {
    super.initState();
    _loadData();
  }
  Future<void> _loadData() async {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      provider.initUnits();
    });}
  @override
  Widget build(BuildContext context) {
    return Consumer<UnitsViewModel>(
      builder: (context,data,_) {
        return Padding(
            padding: EdgeInsets.symmetric(horizontal: Dimens.padding_16h),
            child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                children: [
              CustomAppBar(
                height: 56.h,
                bgColor: AppColors.white,
                topColor: AppColors.white,
                leadingWidth: 0,
                title:AppTranslate.units.tr(),
                // titleWidget:  Image.asset(AppAssets.splash,height: 32.h,width: 164.5.w,),
                isBackButtonExist: false,
                actions: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: Dimens.padding_16h),
                    child: InkWell(
                      onTap: () {

                      },
                      child: CustomSvgIcon(
                          assetName: AppAssets.addContracts,
                          width: 24.w,
                          height: 24.h),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(width: 284.w,height: 36.h,
                      child: CustomTextFormField(controller: data.searchController,underLineColor: Colors.transparent,
                        onChange: (_){
                        data.allUnits();
                        },
                        borderRaduis: 7.r,
                        padding:EdgeInsets.symmetric(horizontal: Dimens.padding_12h) ,
                        bgColor: Color(0xffEFF8F2),hint: AppTranslate.search.tr(),hintFontColor: AppColors.primaryColor,)),
                  Transform.scale(
                      scaleX:data.saveUserData.getLang()=='en'? -1:1,
                      child: CustomSvgIcon(assetName: AppAssets.buttonSearch,width: 52.5.w,height: 36.h))
                ],
              ),SizedBox(height: 10.h),
                  Expanded(
                    child: RefreshIndicator(
                      color: AppColors.primaryColor,
                      backgroundColor: AppColors.white,
                      onRefresh: ()async{
                        await  _loadData();},
                      child: AnimationLimiter(
                        child:
                        data.isLoading?const AppLoader():
                        data.allUnitsList.isEmpty==true?const NoDataScreen():
                        ListView.builder(
                          controller: data.controller,
                            padding: EdgeInsets.symmetric(vertical: Dimens.padding_12v),
                            shrinkWrap: true,
                            itemCount: data.allUnitsList.length,
                            itemBuilder: (context, index) {
                              return AnimationConfiguration.staggeredGrid(
                                  duration:const Duration(milliseconds: 900),
                                  position: index,
                                  columnCount: 1,
                                  child: ScaleAnimation(
                                      duration:const Duration(milliseconds: 1000),
                                      curve: Curves.fastLinearToSlowEaseIn,
                                      child: FadeInAnimation(child:
                                      InkWell(onTap: (){
                                        NavigatorHandler.push( UnitDetails(id: data.allUnitsList[index]?.id.toString()??'',));
                                      },child: CustomUnitCard(model: data.allUnitsList[index])),
                                      )
                                  )
                              );
                            }),
                      ),
                    ),
                  )
            ]));
      }
    );
  }
}
