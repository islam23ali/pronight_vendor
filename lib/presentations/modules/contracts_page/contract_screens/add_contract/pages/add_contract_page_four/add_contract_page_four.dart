import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pronight_vendor/core/extensions/num_extensions.dart';
import 'package:pronight_vendor/core/my_separator.dart';
import 'package:provider/provider.dart';
import '../../../../../../../core/app_theme/app_colors.dart';
import '../../../../../../../core/dimens/dimens.dart';
import '../../../../../../../core/resources/app_assets.dart';
import '../../../../../../../core/resources/app_translate.dart';
import '../../../../../../../core/resources/font_size.dart';
import '../../../../../../../data/models/response/sub_models/add_car_model.dart';
import '../../../../../../components/custom_button/custom_button.dart';
import '../../../../../../components/custom_svg/CustomSvgIcon.dart';
import '../../../../../../components/custom_text/custom_text.dart';
import '../../../../../../components/inputs/custom_text_form.dart';
import '../../../../../../components/loadings/custom_scaffold_messanger.dart';
import '../../add_contract_view_model.dart';
import '../../widget/send_contract_sheet.dart';

class AddContractPageFour extends StatefulWidget {
  const AddContractPageFour({super.key});

  @override
  State<AddContractPageFour> createState() => _AddContractPageFourState();
}

class _AddContractPageFourState extends State<AddContractPageFour> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Dimens.padding_16),
      child: Consumer<AddContractViewModel>(
          builder: (context,data,_) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: Dimens.padding_12h,vertical: Dimens.padding_16v),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.r),color: AppColors.white),
              child: SingleChildScrollView(
                child: Column(mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(height: 59.h,
                        decoration: BoxDecoration(
                            borderRadius:BorderRadius.circular(Dimens.padding_8),
                            color: const Color(0xffF0FAFF),border: Border.all(width:1.w,color: const Color(0xffFFF9DC))),
                        padding: EdgeInsets.symmetric(vertical: Dimens.padding_12v,horizontal:Dimens.padding_24h ),
                        child:Row(
                          children: [
                            CustomSvgIcon(assetName: AppAssets.reportDetails,width: 24.w,height: 24.h),
                            SizedBox(width: 16.w),
                            Column(crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomText(title: AppTranslate.renterCarData.tr(),fontSize: AppFonts.font_12,),
                                CustomText(title: AppTranslate.basicDataAboutRentersCars.tr(),fontSize: AppFonts.font_10,fontColor: Colors.grey,)
                              ],)
                          ],)),
                    Column(children: [
                      ListView.builder(
                        shrinkWrap: true,
                          physics:const NeverScrollableScrollPhysics(),
                          itemCount: data.cars.length,
                          itemBuilder: (context,index){
                        return Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [SizedBox(height: 20.h),
                            Column(crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(title: AppTranslate.carType.tr(),fontSize: AppFonts.font_12,fontColor: AppColors.primaryColor),
                                CustomTextFormField(controller: data.cars[index].carTypeController,
                                  height: 56.h,textInputType: TextInputType.text,
                                  prefix: InkWell(onTap:(){
                                    data.cars[index].carTypeController.clear();
                                  },
                                      child: CustomSvgIcon(assetName: AppAssets.clearField,height: 14.w,width: 20.w)),
                                )
                              ],
                            ),
                            SizedBox(height: 20.h),
                            Column(crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(title: AppTranslate.plateNumber.tr(),fontSize: AppFonts.font_12,fontColor: AppColors.primaryColor),
                                CustomTextFormField(controller: data.cars[index].plateNumberController,
                                  height: 56.h,textInputType: TextInputType.text,
                                  prefix: InkWell(onTap:(){
                                    data.cars[index].plateNumberController.clear();
                                  },
                                      child: CustomSvgIcon(assetName: AppAssets.clearField,height: 14.w,width: 20.w)),
                                )
                              ],
                            ),
                            SizedBox(height: 20.h),
                            Column(crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(title: AppTranslate.driverName.tr(),fontSize: AppFonts.font_12,fontColor: AppColors.primaryColor),
                                CustomTextFormField(controller: data.cars[index].driverNameController,
                                  height: 56.h,textInputType: TextInputType.text,
                                  prefix: InkWell(onTap:(){
                                    data.cars[index].driverNameController.clear();
                                  },
                                      child: CustomSvgIcon(assetName: AppAssets.clearField,height: 14.w,width: 20.w)),
                                )
                              ],
                            ),
                            SizedBox(height: 20.h),
                            Column(crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(title: AppTranslate.driverIDNumber.tr(),fontSize: AppFonts.font_12,fontColor: AppColors.primaryColor),
                                CustomTextFormField(controller: data.cars[index].driverIDNumberController,
                                  height: 56.h,textInputType: TextInputType.number,
                                  prefix: InkWell(onTap:(){
                                    data.cars[index].driverIDNumberController.clear();
                                  },
                                      child: CustomSvgIcon(assetName: AppAssets.clearField,height: 14.w,width: 20.w)),
                                )
                              ]),
                            SizedBox(height: 20.h),
                            const MySeparator(color: AppColors.blackColor,),
                            SizedBox(height: 20.h),
                            if(data.cars.last==data.cars[index]) (data.cars.first!=data.cars[index])?const SizedBox():
                            CustomButton(onTap: (){
                              if(data.cars[index].carTypeController.text.isEmpty||data.cars[index].plateNumberController.text.isEmpty||data.cars[index].driverNameController.text.isEmpty||data.cars[index].driverIDNumberController.text.isEmpty){
                                CustomScaffoldMessanger.showToast(title: AppTranslate.renterCarDataRequired.tr());
                              }else{
                                data.cars.add(Car(type: '', plateNo: '', driverName: '', driverIdNo: ''));
                                data.refreshData();}
                            },bg: const Color(0xff045B9A),title: AppTranslate.addCar.tr(),fontWeight: FontWeight.w400,),

                            (data.cars.first==data.cars[index])?const SizedBox():
                            Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                if(data.cars.last==data.cars[index]) CustomButton(onTap: (){
                                  if(data.cars[index].carTypeController.text.isEmpty||data.cars[index].plateNumberController.text.isEmpty||data.cars[index].driverNameController.text.isEmpty||data.cars[index].driverIDNumberController.text.isEmpty){
                                    CustomScaffoldMessanger.showToast(title: AppTranslate.renterCarDataRequired.tr());
                                  }else{
                                    data.cars.add(Car(type: '', plateNo: '', driverName: '', driverIdNo: ''));
                                    data.refreshData();}
                                },width: 135.w,bg: const Color(0xff045B9A),title: AppTranslate.addCar.tr(),fontWeight: FontWeight.w400,),
                                (data.cars.first==data.cars[index])?const SizedBox(): CustomButton(onTap: (){
                                  data.cars.removeAt(index);
                                  data.refreshData();
                                },width: 135.w,bg: const Color(0xffEF0404),title: AppTranslate.deleteCar.tr(),fontWeight: FontWeight.w400,),
                              ],),
                          ],);
                      }),

                      SizedBox(height: 40.h),
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomButton(onTap: (){
                            setState(() {
                              data.currentPage=3;
                            });
                            data.pageController.previousPage(
                                duration: const Duration(seconds: 1),
                                curve: Curves.easeInOut);
                          },
                            bg: AppColors.white,
                            borderColor: AppColors.primaryColor,
                            fontColor: AppColors.primaryColor,
                            width: 150.w,
                            title: AppTranslate.previous.tr(),),
                          CustomButton(onTap: (){
    if(data.cars.first.carTypeController.text.isEmpty||data.cars.first.plateNumberController.text.isEmpty||data.cars.first.driverNameController.text.isEmpty||data.cars.first.driverIDNumberController.text.isEmpty){
    CustomScaffoldMessanger.showToast(title: AppTranslate.renterCarDataRequired.tr());}else{
                            setState(() {
                              data.currentPage=4;
                            });
                            showSendContractSheet();
                          }},width: 150.w,
                            title: AppTranslate.send.tr(),),
                        ],
                      )
                    ],)
                  ],
                ),
              ),);
          }
      ),
    );
  }
  Future<dynamic> showSendContractSheet() async {
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
          return const SendContractSheet();
        });}
}
