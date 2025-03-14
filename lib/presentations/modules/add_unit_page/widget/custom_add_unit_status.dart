import 'package:flutter/cupertino.dart';
import 'package:pronight_vendor/core/extensions/num_extensions.dart';
import 'package:provider/provider.dart';
import '../../../../../../core/app_theme/app_colors.dart';
import '../../../../../../core/resources/app_assets.dart';
import '../../../components/custom_svg/CustomSvgIcon.dart';
import '../add_unit_view_model.dart';

class CustomAddUnitStatus extends StatefulWidget {
  const CustomAddUnitStatus({super.key});

  @override
  State<CustomAddUnitStatus> createState() => _CustomAddUnitStatusState();
}

class _CustomAddUnitStatusState extends State<CustomAddUnitStatus> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AddUnitViewModel>(
      builder: (context,data,_) {
        return Center(
          child: SizedBox(height: 20.h,
            // width: 324.w,
            child:
            Row(crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomSvgIcon(assetName: AppAssets.progress,width: 20.w,height: 20.h),
                Container(height: 1.h,width: 89.62.w,color: AppColors.primaryColor),
                (data.currentPage==1||data.currentPage==2||data.currentPage==3)? CustomSvgIcon(assetName: AppAssets.progress,width: 20.w,height: 20.h):
                CustomSvgIcon(assetName: AppAssets.unProgress,width: 13.w,height: 13.h),
                Container(height: 1.h,width: 89.62.w,color:(data.currentPage==1||data.currentPage==2||data.currentPage==3)? AppColors.primaryColor:AppColors.primaryColor.withAlpha((.20*255).round())),
                (data.currentPage==2||data.currentPage==3)? CustomSvgIcon(assetName: AppAssets.progress,width: 20.w,height: 20.h):
                CustomSvgIcon(assetName: AppAssets.unProgress,width: 13.w,height: 13.h),
                Container(height: 1.h,width: 89.62.w,color:(data.currentPage==2||data.currentPage==3)? AppColors.primaryColor:AppColors.primaryColor.withAlpha((.20*255).round())),
                (data.currentPage==3)? CustomSvgIcon(assetName: AppAssets.progress,width: 20.w,height: 20.h):
                CustomSvgIcon(assetName: AppAssets.unProgress,width: 13.w,height: 13.h),
              ],
            ),),
        );
      }
    );
  }
}
