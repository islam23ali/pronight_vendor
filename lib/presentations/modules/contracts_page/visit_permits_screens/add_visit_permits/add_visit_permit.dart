import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pronight_vendor/core/constants/constants.dart';
import 'package:pronight_vendor/core/extensions/num_extensions.dart';
import 'package:pronight_vendor/presentations/components/inputs/custom_text_form_area.dart';
import 'package:pronight_vendor/presentations/modules/contracts_page/visit_permits_screens/add_visit_permits/widgets/custom_dropdown_visit_permit.dart';
import 'package:pronight_vendor/presentations/modules/contracts_page/visit_permits_screens/add_visit_permits/widgets/custom_material_card.dart';
import 'package:pronight_vendor/presentations/modules/contracts_page/visit_permits_screens/add_visit_permits/widgets/custom_visitor_data_card.dart';
import 'package:pronight_vendor/presentations/modules/contracts_page/visit_permits_screens/add_visit_permits/widgets/send_visit_permit_sheet.dart';
import 'package:provider/provider.dart';
import '../../../../../core/app_theme/app_colors.dart';
import '../../../../../core/dimens/dimens.dart';
import '../../../../../core/resources/app_assets.dart';
import '../../../../../core/resources/app_translate.dart';
import '../../../../../core/resources/font_size.dart';
import '../../../../../data/models/response/sectors_model.dart';
import '../../../../../data/models/response/villas_model.dart';
import '../../../../../injection.dart';
import '../../../../components/alerts/custom_select_date.dart';
import '../../../../components/custom_app_bar/custom_app_bar.dart';
import '../../../../components/custom_button/custom_button.dart';
import '../../../../components/custom_scaffold/custom_scaffold.dart';
import '../../../../components/custom_svg/CustomSvgIcon.dart';
import '../../../../components/custom_switch/custom_switch.dart';
import '../../../../components/custom_text/custom_text.dart';
import '../../../../components/inputs/custom_text_form.dart';
import '../../contract_screens/add_contract/add_contract_view_model.dart';
import '../../contract_screens/add_contract/pages/add_contract_page_one/widget/custom_beaches_dropdown.dart';
import '../../contract_screens/add_contract/pages/add_contract_page_one/widget/custom_sector_dropdown.dart';
import '../../contract_screens/add_contract/pages/add_contract_page_one/widget/custom_villas_dropdown.dart';
import 'add_visit_permit_view_model.dart';

class AddVisitPermit extends StatefulWidget {
  final String? id;
  const AddVisitPermit({super.key, this.id});

  @override
  State<AddVisitPermit> createState() => _AddVisitPermitState();
}

class _AddVisitPermitState extends State<AddVisitPermit> {
  AddVisitPermitViewModel provider =getIt();
@override
  void initState() {
    super.initState();
  WidgetsBinding.instance.addPostFrameCallback((timeStamp){
    if(widget.id==null||widget.id==''){
      provider.initAddVisitPermit();
    }else{
      print('nnnnnnnfffqq');
      provider.initUpdateVisitPermit(widget.id??'');
    }
  });
  }
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      backgroundColor: const Color(0xffF6FFFA),
      systemNavigationBarColor: const Color(0xffF6FFFA),
      appBar: CustomAppBar(fontWeight: FontWeight.bold,fontSize: AppFonts.font_14,
        title:(widget.id==null||widget.id=='')? AppTranslate.addVisitPermit.tr():AppTranslate.modifyVisitPermit.tr(),bgColor: const Color(0xffF6FFFA),statusBarColor: const Color(0xffF6FFFA),height: 64.h,),
      body: Column(crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 10.h),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(Dimens.padding_16),
              child: Consumer2<AddVisitPermitViewModel,AddContractViewModel>(
                  builder: (context,data,addContractProvider,_) {
                    return Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.r),color: AppColors.white),
                      child: SingleChildScrollView(
                        child: Column(mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(height: 59.h,
                                decoration: BoxDecoration(
                                    borderRadius:BorderRadius.only(topLeft: Radius.circular(Dimens.padding_8),topRight: Radius.circular(Dimens.padding_8)),
                                    color: const Color(0xffF0FAFF),border: Border.all(width:1.w,color: const Color(0xffFFF9DC))),
                                padding: EdgeInsets.symmetric(vertical: Dimens.padding_12v,horizontal:Dimens.padding_24h ),
                                child:Row(
                                  children: [
                                    CustomSvgIcon(assetName: AppAssets.reportDetails,width: 24.w,height: 24.h),
                                    SizedBox(width: 16.w),
                                    Column(crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        CustomText(title: AppTranslate.declarationData.tr(),fontSize: AppFonts.font_12,),
                                        CustomText(title: AppTranslate.basicDataForThePermit.tr(),fontSize: AppFonts.font_10,fontColor: Colors.grey,)
                                      ],)
                                  ],)),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: Dimens.padding_12h,vertical: Dimens.padding_16v),
                              child: Column(children: [
                                SizedBox(height: 20.h),
                                Column(crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(title: AppTranslate.dateOfVisit.tr(),fontSize: AppFonts.font_12,fontColor: AppColors.primaryColor),
                                    CustomTextFormField(controller: data.visitDateController,readOnly: true,
                                      onTap: (){
                                        showDialog<String>(
                                            context: context,
                                            builder: (BuildContext context) =>
                                                CustomSelectDate(onDateSelected: (String value) {data.visitDateController.text=value;},));
                                      },
                                      height: 60.h,textInputType: TextInputType.number,
                                      suffix: CustomSvgIcon(assetName: AppAssets.date,color: Colors.black.withAlpha((0.50*244).round()),),
                                      prefix: InkWell(
                                          onTap: (){
                                            data.visitDateController.clear();
                                          },
                                          child: CustomSvgIcon(assetName: AppAssets.clearField,height: 14.w,width: 20.w)),
                                    )
                                  ],
                                ),
                                SizedBox(height: 20.h),
                                Column(crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(title: AppTranslate.selectSector.tr(),fontSize: AppFonts.font_12,fontColor: AppColors.primaryColor),
                                    Column(
                                      children: [
                                        (addContractProvider.isLoading==true)?SizedBox(width: 30.w,height: 30.h,
                                            child: CircularProgressIndicator(color: AppColors.primaryColor,strokeWidth: 2.w,)):
                                        CustomSectorDropdownButton(
                                          color: AppColors.darkColor,
                                          items: addContractProvider.sectorsModel?.data ?? [],
                                          value: data.selectedSector,
                                          onChanged: (OneSector? newValue) {
                                            setState(() {
                                              data.selectedSector = newValue;
                                              data.selectedVilla = null;
                                              data.selectedBeach = null;
                                              addContractProvider.getAllVillas(data.selectedSector?.id.toString());
                                              addContractProvider.getAllBeaches(data.selectedSector?.id.toString());
                                            });
                                          },
                                        ),
                                        Container(height: 2.h,width: 300,color: Colors.grey.shade400,),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20.h),
                                Column(crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(title: AppTranslate.villa.tr(),fontSize: AppFonts.font_12,fontColor: AppColors.primaryColor),
                                    Column(
                                      children: [
                                        (addContractProvider.isVilLoading==true)?SizedBox(width: 30.w,height: 30.h,
                                            child: CircularProgressIndicator(color: AppColors.primaryColor,strokeWidth: 2.w,)):
                                        CustomVillasDropdownButton(
                                          color: AppColors.darkColor,
                                          inputColor:data.selectedSector==null? Colors.black12:Colors.transparent,
                                          items: addContractProvider.villasModel?.data ?? [],
                                          value: data.selectedVilla,
                                          disabledTitle: AppTranslate.selectSectorFirst.tr(),
                                          onChanged: (OneVilla? newValue) {
                                            setState(() {
                                              data.selectedVilla = newValue;
                                            });
                                          },
                                        ),
                                        Container(height: 2.h,width: 300,color: Colors.grey.shade400,),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20.h),
                                Column(crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(title: AppTranslate.beach.tr(),fontSize: AppFonts.font_12,fontColor: AppColors.primaryColor),
                                    Column(
                                      children: [
                                        (addContractProvider.isBeaLoading==true)?SizedBox(width: 30.w,height: 30.h,
                                            child: CircularProgressIndicator(color: AppColors.primaryColor,strokeWidth: 2.w,)):
                                        CustomBeachesDropdownButton(
                                          color: AppColors.darkColor,
                                          items: addContractProvider.beachesModel?.data ?? [],
                                          value: data.selectedBeach,
                                          inputColor:data.selectedSector==null? Colors.black12:Colors.transparent,
                                          disabledTitle: AppTranslate.selectSectorFirst.tr(),
                                          onChanged: (OneVilla? newValue) {
                                            setState(() {
                                              data.selectedBeach = newValue;
                                            });
                                          },
                                        ),
                                        Container(height: 2.h,width: 300,color: Colors.grey.shade400,),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20.h),
                                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(width: 150.w,
                                        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            CustomText(title: AppTranslate.numberOfDays.tr(),fontSize: AppFonts.font_12,fontColor: AppColors.primaryColor),
                                            CustomTextFormField(controller: data.numberOfDaysController,
                                              height: 60.h,textInputType: TextInputType.number,
                                              prefix: InkWell(
                                                  onTap: (){
                                                    data.numberOfDaysController.clear();
                                                  },
                                                  child: CustomSvgIcon(assetName: AppAssets.clearField,height: 14.w,width: 20.w)),
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(width: 150.w,
                                        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            CustomText(title: AppTranslate.permitStatus.tr(),fontSize: AppFonts.font_12,fontColor: AppColors.primaryColor),
                                            CustomTextFormField(controller: data.permitStatusController,
                                              height: 60.h,textInputType: TextInputType.text,
                                              prefix: InkWell(
                                                  onTap: (){data.permitStatusController.clear();},
                                                  child: CustomSvgIcon(assetName: AppAssets.clearField,height: 14.w,width: 20.w)),
                                            )
                                          ],
                                        ),
                                      ),
                                    ]),
                                SizedBox(height: 20.h),
                                Column(crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(title: AppTranslate.driverName.tr(),fontSize: AppFonts.font_12,fontColor: AppColors.primaryColor),
                                    CustomTextFormField(controller: data.driverNameController,
                                      height: 60.h,textInputType: TextInputType.name,
                                      prefix: InkWell(
                                          onTap: (){
                                            data.driverNameController.clear();
                                          },
                                          child: CustomSvgIcon(assetName: AppAssets.clearField,height: 14.w,width: 20.w)),
                                    )
                                  ],
                                ),
                                SizedBox(height: 20.h),
                                Column(crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(title: AppTranslate.comments.tr(),fontSize: AppFonts.font_12,fontColor: AppColors.primaryColor),
                                    CustomTextFormFieldArea(controller: data.detailsController,
                                      height: 120.h,
                                      borderColor: Colors.transparent,
                                      prefix: InkWell(
                                        onTap: (){
                                          data.detailsController.clear();
                                        },
                                          child: CustomSvgIcon(assetName: AppAssets.clearField,height: 14.w,width: 20.w)),
                                    )
                                  ],
                                ),
                                SizedBox(height: 20.h),
                                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(width: 150.w,
                                          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                CustomText(title: AppTranslate.visitors.tr(),fontSize: AppFonts.font_12,fontColor: AppColors.primaryColor),
                                                CustomSwitch(value: data.isSwitchVisitors,
                                                    activeColor: AppColors.primaryColor,
                                                    inactiveColor: AppColors.gray,
                                                    onChanged: (_){
                                                      setState(() {
                                                        data.isSwitchVisitors=!data.isSwitchVisitors;
                                                      });
                                                    })
                                              ])
                                      ),
                                      SizedBox(width: 150.w,
                                          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                CustomText(title: AppTranslate.materials.tr(),fontSize:AppFonts.font_12,fontColor: AppColors.primaryColor),
                                                CustomSwitch(value: data.isSwitchMaterials,
                                                    activeColor: AppColors.primaryColor,
                                                    inactiveColor: AppColors.gray,
                                                    onChanged: (_){
                                                      setState(() {
                                                        data.isSwitchMaterials=!data.isSwitchMaterials;
                                                      });
                                                    })
                                              ])
                                      ),
                                    ]),
                                SizedBox(height: 20.h),
                                if(data.isSwitchVisitors==true) CustomVisitorDataList(id: widget.id??'',),
                                SizedBox(height: 10.h),
                                if(data.isSwitchMaterials==true) CustomMaterialList(id: widget.id??'',),
                                SizedBox(height: 20.h),
                                CustomButton(onTap: (){
                                  if(widget.id==''||widget.id==null){
                                    showSendVisitPermitSheet();
                                  }else{
                                    data.updateVisitPermit(widget.id??'');
                                  }
                                },title: AppTranslate.send.tr(),)
                              ],),
                            )
                          ],
                        ),
                      ),);
                  }
              ),
            ),
          ),
        ],
      ),
    );
  }
  Future<dynamic> showSendVisitPermitSheet() async {
    return  showModalBottomSheet(
      // isDismissible: false,
        isScrollControlled: true,
        backgroundColor: AppColors.white,
        context: context,

        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(24.r),
            )),
        builder: (BuildContext context) {
          return const SendVisitPermitSheet();
        });}
}
