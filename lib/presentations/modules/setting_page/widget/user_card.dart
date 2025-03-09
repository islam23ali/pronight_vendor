import 'package:flutter/cupertino.dart';
import 'package:pronight_vendor/core/extensions/num_extensions.dart';

import '../../../../core/app_theme/app_colors.dart';
import '../../../../core/resources/app_assets.dart';
import '../../../../core/resources/font_size.dart';
import '../../../components/custom_text/custom_text.dart';
import '../../../components/images/network_image.dart';

class UserCard extends StatelessWidget {
  const UserCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 45.h,child: Row(
      children: [
        AppNetworkImage(imageUrl: 'imageUrl',borderRadius: 100.r,width: 45.w,height: 45.h,errorImage: AppAssets.splashLogo,),
        SizedBox(width: 10.w),
        Column(crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(title: 'أحمد محمد أحمد',fontWeight: FontWeight.bold,fontColor: AppColors.textColor3,),
            CustomText(title: 'ahmed@gmail.com',fontSize: AppFonts.font_10,fontColor: AppColors.textColor,)
          ],)
      ],
    ));
  }
}
