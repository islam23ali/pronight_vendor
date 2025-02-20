import 'package:pronight_vendor/core/app_theme/app_colors.dart';
import 'package:pronight_vendor/core/extensions/num_extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'base_platform_widget.dart';

class LoadingSpinner extends BasePlatformWidget<Center, Center> {
  final Color? color;
  final double? size;
  const LoadingSpinner({super.key,
    this.color,
    this.size,
  });
  @override
  Center createCupertinoWidget(BuildContext context) {
    return Center(child: CupertinoActivityIndicator(radius: 24.r));
  }

  @override
  Center createMaterialWidget(BuildContext context) {
    return Center(
      child: SizedBox(
        height: (size??24).r,
        width: (size??24).r,
        child:  CircularProgressIndicator(strokeWidth: 3.w,color: color??AppColors.primaryColor,),
      ),
    );
  }


}
