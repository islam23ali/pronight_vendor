import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:pronight_vendor/core/extensions/num_extensions.dart';
import '../../../../../core/app_theme/app_colors.dart';
import '../../../../../core/resources/font_size.dart';
import '../../../../../data/models/response/one_unit_model.dart';
import '../../../../components/custom_text/custom_text.dart';

class AdditionalServicesUnit extends StatefulWidget {
  const AdditionalServicesUnit({super.key, required this.additionalService});
  final List<AdditionalService>? additionalService;

  @override
  State<AdditionalServicesUnit> createState() => _AdditionalServicesState();
}

class _AdditionalServicesState extends State<AdditionalServicesUnit> {
  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3.5,
            crossAxisSpacing: 20.h,
            mainAxisSpacing: 10.h,
          ),
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: widget.additionalService?.length??0,
          itemBuilder: (context, index) {
            return AnimationConfiguration.staggeredGrid(
                duration:const Duration(milliseconds: 900),
                position: index,
                columnCount: 2,
                child: ScaleAnimation(
                    duration:const Duration(milliseconds: 1000),
                    curve: Curves.fastLinearToSlowEaseIn,
                    child: FadeInAnimation(child:
                    Container(
                      // padding: EdgeInsets.all(Dimens.padding_8),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.r),color: AppColors.bgHomeColor),alignment: Alignment.center,
                      child: CustomText(title: widget.additionalService?[index].title??'',fontSize: AppFonts.font_12,fontWeight: FontWeight.w500,),),
                    )));
          }),
    );
  }
}
