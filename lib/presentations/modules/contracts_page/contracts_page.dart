import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pronight_vendor/core/app_theme/app_colors.dart';
import 'package:pronight_vendor/core/dimens/dimens.dart';
import 'package:pronight_vendor/core/extensions/num_extensions.dart';
import 'package:pronight_vendor/core/navigator/navigator.dart';
import 'package:pronight_vendor/core/resources/app_assets.dart';
import 'package:pronight_vendor/core/resources/app_translate.dart';
import 'package:pronight_vendor/core/resources/font_size.dart';
import 'package:pronight_vendor/presentations/components/custom_svg/CustomSvgIcon.dart';
import 'package:pronight_vendor/presentations/components/custom_text/custom_text.dart';
import 'package:pronight_vendor/presentations/components/inputs/custom_text_form.dart';
import 'package:pronight_vendor/presentations/modules/contracts_page/contracts_view_model.dart';
import 'package:pronight_vendor/presentations/modules/contracts_page/visit_permits_screens/add_visit_permits/add_visit_permit.dart';
import 'package:pronight_vendor/presentations/modules/contracts_page/visit_permits_screens/visit_permit_view_model.dart';
import 'package:pronight_vendor/presentations/modules/contracts_page/widgets/custom_contract_list.dart';
import 'package:pronight_vendor/presentations/modules/contracts_page/widgets/custom_visit_permits_list.dart';
import 'package:provider/provider.dart';
import '../../../injection.dart';
import 'package:flutter/widgets.dart' as ui;
import '../../components/custom_app_bar/custom_app_bar.dart';
import 'contract_screens/add_contract/add_contract.dart';


class ContractsPage extends StatefulWidget {
  const ContractsPage({super.key});

  @override
  State<ContractsPage> createState() => _ContractsPageState();
}

class _ContractsPageState extends State<ContractsPage> {

  ContractViewModel provider = getIt();
  @override
  void initState() {
    super.initState();
    provider.initContracts();
  }
  @override
  Widget build(BuildContext context) {
    return Consumer2<ContractViewModel,VisitPermitViewModel>(
      builder: (context,data,visitProvider,_) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal:Dimens.padding_16h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomAppBar(height: 56.h,
                bgColor: AppColors.white,
                topColor: AppColors.white,
                leadingWidth: 0,
                title:(data.isContract==0)? AppTranslate.contracts.tr():AppTranslate.visitPermits.tr(),
                // titleWidget:  Image.asset(AppAssets.splash,height: 32.h,width: 164.5.w,),
                isBackButtonExist: false,
                actions: [ Padding(
                  padding: EdgeInsets.symmetric(horizontal:Dimens.padding_16h),
                  child: InkWell(
                    onTap: (){
                      (data.isContract==1)?
                      NavigatorHandler.push(const AddVisitPermit()):
                      NavigatorHandler.push(const AddContract());
                    },
                    child: CustomSvgIcon(assetName:AppAssets.addContracts, width: 24.w, height: 24.h),
                  ),
                ),],
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
                    data.isContract=0;
                    data.initContracts();
                  });
                  data.pageController.animateToPage(data.isContract,
                      duration: const Duration(seconds: 1),
                      curve: Curves.easeInOut);
                },
                  child: Container(
                  height: 35.h,width: 165.w,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(50.r),
                      color:(data.isContract==0)? AppColors.primaryColor:Colors.transparent
                  ),child:Center(child: CustomText(title: AppTranslate.contracts.tr(),fontSize: AppFonts.font_13,fontColor: (data.isContract==0)?AppColors.white:AppColors.primaryColor,)) ,),
                ),
                  InkWell(onTap: (){
                    setState(() {
                      data.isContract=1;
                      visitProvider.initVisitPermit();
                    });
                    data.pageController.animateToPage(data.isContract,
                        duration: const Duration(seconds: 1),
                        curve: Curves.easeInOut);
                  },
                  child: Container(
                      height: 35.h,width: 165.w,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(50.r),
                      color:(data.isContract==1)? AppColors.primaryColor:Colors.transparent
                  ),child:Center(child: CustomText(title: AppTranslate.visitPermits.tr(),fontSize: AppFonts.font_13,fontColor: (data.isContract==1)?AppColors.white:AppColors.primaryColor,)) ,),
                ),
              ],),),
            ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(width: 284.w,height: 36.h,
                      child: CustomTextFormField(controller:data.isContract==0? data.searchController:visitProvider.searchVisitPermitController,underLineColor: Colors.transparent,
                          onChange: (_){
                            data.isContract==0? data.allContracts():visitProvider.allVisitPermit();
                          },
                          borderRaduis: 7.r,
                          padding:EdgeInsets.symmetric(horizontal: Dimens.padding_12h) ,
                          bgColor: const Color(0xffEFF8F2),hint: AppTranslate.search.tr(),hintFontColor: AppColors.primaryColor,)),
                  Transform.scale(
                      scaleX:data.saveUserData.getLang()=='en'? -1:1,
                      child: CustomSvgIcon(assetName: AppAssets.buttonSearch,width: 52.5.w,height: 36.h))
                ],
              ),
              SizedBox(height: 10.h),
              Expanded(
                child: PageView(
                  controller: data.pageController,
                  onPageChanged: (_){
                    setState(() {
                      // data.isContract=pageController.initialPage;

                    });
                  },
                  physics: const NeverScrollableScrollPhysics(),
                  children:const [
                    CustomContractList(),
                    CustomVisitPermitsList(),
                  ],),
              )
          ],),
        );
      }
    );
  }
}
