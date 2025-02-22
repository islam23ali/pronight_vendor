
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:pronight_vendor/core/extensions/num_extensions.dart';
import 'package:pronight_vendor/core/resources/font_size.dart';
import 'package:pronight_vendor/presentations/components/custom_app_bar/custom_app_bar.dart';
import 'package:pronight_vendor/presentations/components/custom_scaffold/custom_scaffold.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../core/app_theme/app_colors.dart';
import '../../../../core/dimens/dimens.dart';
import '../../../../core/navigator/navigator.dart';
import '../../../../core/resources/app_assets.dart';
import '../../../../core/resources/app_translate.dart';
import '../../../../core/utils/preferences.dart';
import '../../../../data/datasource/local/LocalUserData.dart';
import '../../../../injection.dart';
import '../../../components/custom_button/custom_button.dart';
import '../../../components/custom_svg/CustomSvgIcon.dart';
import '../../../components/custom_switch/custom_switch.dart';
import '../../../components/custom_text/custom_text.dart';
import '../../../shared_widget/back_app_bar.dart';
import 'dart:math' as math;

import '../login/login_screen.dart';
class IntroScreen extends StatefulWidget {
  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  LocalUserData saveUserData = getIt();
  PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  bool isSwitch = true;
  bool lang = true;

  final List<String> _imagePaths = [
    'AppAssets.intro1',
    'AppAssets.intro2',
    'AppAssets.intro3',
  ];
  final List<String> _textTitlePaths = [
    AppTranslate.introTitle1.tr(),
    AppTranslate.introTitle2.tr(),
    AppTranslate.introTitle3.tr(),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
Preferences pre =Preferences();
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: const CustomAppBar(height: 20,statusBarColor:AppColors.white,bgColor: AppColors.white,),
      backgroundColor:AppColors.white,
        systemNavigationBarColor:AppColors.white,
      body: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               SizedBox(width: 70.w
              ),
              SizedBox(height: 12.h,
                child: ListView.builder(
                    itemCount: 3,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context,index){
                      return Container(
                        width: 10.w,height: 10.h,
                        margin: EdgeInsets.symmetric(horizontal: Dimens.padding_2h),
                        decoration: BoxDecoration(shape: BoxShape.circle,color:(_currentPage==index)?AppColors.circleColor:Colors.transparent,border: Border.all(width: 1.w,color: AppColors.circleColor)),);
                    }),
              ),
              CustomButton(
                  width: 70.w,
                  height: 50.h,bg: Colors.transparent,
                  fontSize: 13.r,
                  title: AppTranslate.skip.tr(),
                  fontColor:AppColors.darkColor,
                  onTap: (){
                    saveUserData.saveIsShowIntro(true);
                    NavigatorHandler.pushAndRemoveUntil(const LoginScreen());
                  }),
            ],
          ),
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: _imagePaths.length,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              itemBuilder: (context, index) {
                return AnimationConfiguration.synchronized(
                  child: SlideAnimation(
                    duration: const Duration(milliseconds: 1000),
                    child: AnimationLimiter(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CustomSvgIcon(assetName:_imagePaths[_currentPage],width: MediaQuery.of(context).size.width,height: 400.w),
                          ],
                        )
                    ),
                  ),
                );
              },
            ),
          ),
          Column(
            children: [
              CustomText(
                fontSize: AppFonts.font_19,
                textAlign: TextAlign.center,
                fontColor: AppColors.textColor,
                title: _textTitlePaths[_currentPage],
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(16.w),
            child: Center(
              child: Transform.rotate(
                    angle: context.locale.languageCode == 'en' ? math.pi : 0,
                    child: InkWell(onTap: () {
                      if(_currentPage==2){
                        saveUserData.saveIsShowIntro(true);
                        NavigatorHandler.pushAndRemoveUntil(const LoginScreen());
                      }else{
                    _pageController.nextPage(duration:const Duration(milliseconds: 500), curve: Curves.ease);}
                      },
                      child: SizedBox(
                    height: 100.h,
                    width: 100.w,
                    child: CustomSvgIcon(assetName:(_currentPage == 0)?AppAssets.next1:(_currentPage == 1)?AppAssets.next2:AppAssets.next3,height: 100.h,width: 100.w,)),
                                            ),
                  ),
            ),
          ),
        ],
      )

    );
  }
}