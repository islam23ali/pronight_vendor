import 'package:pronight_vendor/core/app_theme/app_colors.dart';
import 'package:pronight_vendor/core/extensions/num_extensions.dart';
import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  final double? width;
  final double? stroke;
  final Color? color;

  const LoadingIndicator({super.key, this.width, this.stroke, this.color});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: width??36.0.w,
        height: width??36.0.w,
        alignment: Alignment.center,
        child: CircularProgressIndicator(color: color??AppColors.primaryColor,strokeWidth: stroke??3.0.w,),
      ),
    );
  }
}
