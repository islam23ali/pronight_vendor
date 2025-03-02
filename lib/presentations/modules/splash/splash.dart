import 'dart:async';
import 'package:pronight_vendor/core/extensions/num_extensions.dart';
import 'package:pronight_vendor/presentations/components/custom_app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pronight_vendor/presentations/components/custom_svg/CustomSvgIcon.dart';
import '../../../../../core/app_theme/app_colors.dart';
import '../../../../../core/navigator/navigator.dart';
import '../../../../../core/resources/app_assets.dart';
import '../../../../../data/datasource/local/LocalUserData.dart';
import '../../../core/app_theme/theme.dart';
import '../../../core/islam_theme/islam_theme.dart';
import '../../components/custom_scaffold/custom_scaffold.dart';
import '../../shared_widget/back_app_bar.dart';
import '../auth/Intro/introScreen.dart';
import '../layout/bottom_nav_bar_app.dart';



class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 2), () async{
    //   if (_localUserData.getUserData()?.data?.token?.isNotEmpty ?? false) {
    //     // await _loginViewModel.updateToken();
    //     NavigatorHandler.pushAndRemoveUntil(const MainScreen());
    //   } else {
    //     if(_localUserData.isShowIntro()==false){
    //       // NavigatorHandler.pushAndRemoveUntil(MainScreen());
          NavigatorHandler.pushAndRemoveUntil(IntroScreen());
          // NavigatorHandler.push(BottomNavBar(bottomNavIndex: 0,));

      //     }
    //     NavigatorHandler.pushAndRemoveUntil(const LoginScreen());
        // NavigatorHandler.pushAndRemoveUntil(MainLayout());
    //     NavigatorHandler.pushAndRemoveUntil(IntroScreen());
    //     // NavigatorHandler.pushAndRemoveUntil(const Login());
    //   NavigatorHandler.push(IslamTheme());
    //   }
    });
  }
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      backgroundColor:AppColors.white,
      statusBarColor:AppColors.white,
      systemNavigationBarColor:AppColors.white,
      appBar: const CustomAppBar(height: 0,statusBarColor:AppColors.white,isBackButtonExist: false,),
      body: Container(color: AppColors.white,
        height: double.maxFinite,
        width: double.maxFinite,
        child: Center(child: CustomPngIcon(assetName: AppAssets.splashLogo,width: 307.w,height: 163.h),),
      ),
    );
  }
}
