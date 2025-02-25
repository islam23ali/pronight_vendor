import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/app_theme/app_colors.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({super.key, this.backgroundColor, this.statusBarColor, this.systemNavigationBarColor, this.appBar, this.bottomNavigationBar, this.body, this.statusBarIconBrightness, this.systemNavigationBarIconBrightness});

  final Color? backgroundColor;
  final Color? statusBarColor;
  final Color? systemNavigationBarColor;
  final PreferredSizeWidget? appBar;
  final Widget? bottomNavigationBar;
  final Widget? body;
  final Brightness? statusBarIconBrightness;
  final Brightness? systemNavigationBarIconBrightness;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: statusBarColor ?? AppColors.white,
        statusBarIconBrightness:statusBarIconBrightness?? Brightness.dark,
        systemNavigationBarColor: systemNavigationBarColor ?? AppColors.white,
        systemNavigationBarIconBrightness:systemNavigationBarIconBrightness?? Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: backgroundColor ?? AppColors.white,
        appBar: appBar,
        body: body,
        bottomNavigationBar:bottomNavigationBar ,
        resizeToAvoidBottomInset: true,
      ),
    );
  }
}
