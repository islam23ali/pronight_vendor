import 'package:flutter/material.dart';
import 'package:pronight_vendor/core/app_theme/app_colors.dart';
import 'package:pronight_vendor/core/extensions/num_extensions.dart';
import 'package:pronight_vendor/core/resources/font_size.dart';
import 'package:pronight_vendor/presentations/components/custom_text/custom_text.dart';
import 'package:pronight_vendor/presentations/components/inputs/custom_text_form.dart';


class ContractsPage extends StatefulWidget {
  const ContractsPage({super.key});

  @override
  State<ContractsPage> createState() => _ContractsPageState();
}

class _ContractsPageState extends State<ContractsPage> {
  TextEditingController controller =TextEditingController();
  bool? isContract;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
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
              isContract=true;
            });
          },
            child: Container(
            height: 35.h,width: 165.w,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(50.r),
                color:(isContract==true)? AppColors.primaryColor:Colors.transparent
            ),child:Center(child: CustomText(title: 'العقود',fontSize: AppFonts.font_13,fontColor: (isContract==true)?AppColors.white:AppColors.primaryColor,)) ,),
          ),
            InkWell(onTap: (){
              setState(() {
                isContract=false;
              });
            },
            child: Container(
                height: 35.h,width: 165.w,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(50.r),
                color:(isContract==false)? AppColors.primaryColor:Colors.transparent
            ),child:Center(child: CustomText(title: 'تصاريح الزيارة',fontSize: AppFonts.font_13,fontColor: (isContract==false)?AppColors.white:AppColors.primaryColor,)) ,),
          ),
        ],),),
      ),
        Row(
          children: [
            SizedBox(width: 284.w,height: 36.h,
                child: CustomTextFormField(controller: controller,bgColor: Color(0xffEFF8F2),hint: 'بحث')),
          ],
        )
    ],);
  }
}
