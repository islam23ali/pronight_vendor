import 'package:pronight_vendor/core/app_theme/app_colors.dart';
import 'package:pronight_vendor/core/extensions/num_extensions.dart';
import 'package:flutter/material.dart';

import '../../../core/dimens/dimens.dart';

class CustomBorderedContainer extends StatelessWidget {
  final Widget child;
  final double? borderRadius;
  final Color? borderColor;
  final Color? bg;
  final double? width;
  final double? height;
  final double? padding;
  const CustomBorderedContainer({super.key, required this.child, this.borderRadius, this.borderColor, this.bg, this.width, this.height, this.padding});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width??Dimens.width,
      height: height??56.h,

      padding:  EdgeInsets.all(padding??12.h),
      decoration: BoxDecoration(color: bg??Colors.transparent,borderRadius: BorderRadius.circular(borderRadius??8.r),border: Border.all(color: borderColor??AppColors.darkColor)),
      child: child,
    );
  }
}
