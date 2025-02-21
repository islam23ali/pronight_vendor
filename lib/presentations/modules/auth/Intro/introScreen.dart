
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:pronight_vendor/core/extensions/num_extensions.dart';
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
    'AppTranslate.yourRentEasier.tr()',
    'AppTranslate.sellPropertyEase.tr()',
    'AppTranslate.managePropertiesProfessionally.tr()',
  ];
  final List<String> _textSubTitlePaths = [
   ' AppTranslate.introTitle1.tr()',
    'AppTranslate.introTitle2.tr()',
    'AppTranslate.introTitle3.tr()',
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
      appBar: const CustomAppBar(height: 0),
      backgroundColor:AppColors.white,
      // appBar: CustomAppBar(
      //     showBackArrow: false,
      //     showToolBar: false,
      //     leadingWidth: 125,
      //     leading:Padding(
      //       padding: EdgeInsets.all(8.0.r),
      //       child: CustomSvgIcon(assetName:AppAssets.logoWithTitle,
      //         width: 120.84.w,
      //         height: 32.h,),
      //     ),
      // actions: [Padding(
      //   padding: EdgeInsets.only(left: 16.w,right: 16.w,top: 8.w,bottom: 8.w),
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //     children: [
      //       // CustomSvgIcon(assetName:AppAssets.logoWithTitle,
      //       //   width: 120.84.w,
      //       //   height: 32.h,),
      //       Row(
      //         children: [
      //           // Switch(
      //           //     activeColor: Colors.transparent,
      //           //     activeTrackColor: AppColors.inputBorder,
      //           //     activeThumbImage: const AssetImage('assets/images/icons/light.png'), // Custom thumb when active
      //           //     inactiveThumbImage: const AssetImage('assets/images/icons/night.png'),
      //           //     value:isSwitch,
      //           //     onChanged: (_){
      //           //       setState(() {
      //           //         isSwitch = !isSwitch;
      //           //       });
      //           //     }),
      //           Selector<ProfileViewModel, bool>(
      //               selector: (context, provider) => provider.theme,
      //               builder: (context, value, _) {
      //                 return AnimatedToggleSwitch<bool>.dual(
      //                   current: value,
      //                   first: false,
      //                   second: true,
      //                   spacing: 1.w,
      //                   style: const ToggleStyle(
      //                     borderColor: AppColors.inputBorder,
      //                     // boxShadow: [
      //                     //   BoxShadow(
      //                     //     color: Colors.black26,
      //                     //     spreadRadius: 1,
      //                     //     blurRadius: 2,
      //                     //     offset: Offset(0, 1.5),
      //                     //   ),
      //                     // ],
      //                   ),
      //                   borderWidth: 1,
      //                   height: 32.h,
      //                   indicatorSize:Size.fromWidth(26.w),
      //                   onChanged: (b) => context.read<ProfileViewModel>().changeTheme(b),
      //                   styleBuilder: (b) => ToggleStyle(
      //                     // backgroundColor: b ? AppColors.inputColor : Colors.black,
      //                     indicatorColor: b ? Colors.transparent : Colors.transparent,
      //                     borderRadius:  BorderRadius.circular(
      //                       50.0,
      //                     ),
      //
      //                     indicatorBorderRadius: BorderRadius.circular( 50.0 ),
      //                   ),
      //                   iconBuilder: (value) => Image.asset(
      //                     value
      //                         ? 'assets/images/icons/light.png'
      //                         : 'assets/images/icons/night.png',
      //                     width: 18.w,
      //                     height: 18.h,
      //                   ),
      //                 );
      //               }),
      //           CustomSwitch(
      //               activeColor:AppColors.inputBorder,
      //               inactiveColor: AppColors.inputBorder,
      //               circleChild: CustomSvgIcon(
      //                 assetName: AppAssets.lang,
      //                 width: 20.w,
      //                 height: 20.h,),
      //               backText: AppTranslate.lang.tr(),
      //               heightCircle: 32.h,widthCircle: 32.w,
      //               width: 90.w,
      //               height: 37.h,
      //               value:lang,
      //               onChanged: (_){
      //                 setState(() {
      //                   lang = !lang;
      //                 });
      //               }),
      //         ],
      //       ),
      //     ],
      //   ),
      // )]
      // ),
      body: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(),
              Padding(
                padding: EdgeInsets.symmetric(vertical:Dimens.padding_24v),
                child: SmoothPageIndicator(
                  controller: _pageController,
                  count: 3,
                  effect: ExpandingDotsEffect(
                    activeDotColor: AppColors.primaryColor,
                    dotHeight: 12,
                    dotWidth: 12,
                  ),
                ),
              ),
              CustomButton(
                  width: 70.w,
                  height: 50.h,bg: Colors.transparent,
                  fontSize: 13.r,
                  title: 'تخطي',
                  fontColor:AppColors.darkColor,
                  onTap: (){
                    // saveUserData.saveIsShowIntro(true);
                    // NavigatorHandler.pushAndRemoveUntil(const Login());
                  }),
            ],
          ),
          // Container(
          //   decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.only(
          //     bottomLeft: Radius.circular(16.r),bottomRight: Radius.circular(16.r),
          //   )),
          //   height: 56.h,
          //   width: Dimens.width,
          //   child: Padding(
          //     padding: EdgeInsets.only(left: 16.w,right: 16.w,top: 8.w,bottom: 8.w),
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //       children: [
          //         CustomSvgIcon(assetName:context.locale.languageCode == 'en'?'AppAssets.logoWithTitleEn':'AppAssets.logoWithTitle',color: AppColors.darkColor,
          //           width: 120.84.w,
          //           height: 32.h,),
          //         Row(
          //           children: [
          //             // Switch(
          //             //     activeColor: Colors.transparent,
          //             //     activeTrackColor: AppColors.inputBorder,
          //             //     activeThumbImage: const AssetImage(
          //             //         'assets/images/icons/light.png'), // Custom thumb when active
          //             //     inactiveThumbImage:
          //             //     const AssetImage('assets/images/icons/night.png'),
          //             //     value: pre.isDarkMode(),
          //             //     materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          //             //     onChanged: (_) {
          //             //       Restart.restartApp();
          //             //       WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          //             //         ThemeProvider themeProvider = getIt();
          //             //         themeProvider.refreshData();
          //             //         ThemeProvider theme = getIt();
          //             //         print('nnnnnnnnnnn${pre.isDarkMode()}');
          //             //         // theme.preferences.isDarkMode();
          //             //         WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          //             //           theme.changeDarkMode();
          //             //         });
          //             //       });
          //             //     }),
          //             Padding(
          //               padding: EdgeInsets.only(left: 12.w,right: 12.w),
          //               child: Selector<ThemeProvider, bool>(
          //                   selector: (context, provider) => provider.preferences.isDarkMode(),
          //                   builder: (context, value, _) {
          //                     print('eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee');
          //                     print(value);
          //                     return AnimatedToggleSwitch<bool>.dual(
          //                       current: value,
          //                       first: false, // Light mode
          //                       second: true, // Dark mode
          //                       spacing: 1.w,
          //                       style: ToggleStyle(
          //                         borderColor: AppColors.inputBorder,
          //                         // boxShadow: [
          //                         //   BoxShadow(
          //                         //     color: Colors.black26,
          //                         //     spreadRadius: 1,
          //                         //     blurRadius: 2,
          //                         //     offset: Offset(0, 1.5),
          //                         //   ),
          //                         // ],
          //                       ),
          //                       borderWidth: 1,
          //                       height: 24.h,
          //                       indicatorSize:Size.fromWidth(22.w),
          //                       onChanged: (b) => context.read<ThemeProvider>().changeDarkMode(),
          //                       styleBuilder: (b) => ToggleStyle(
          //                         // backgroundColor: b ? AppColors.inputColor : Colors.black,
          //                         indicatorColor: b ? Colors.transparent : Colors.transparent,
          //                         borderRadius:  BorderRadius.circular(
          //                           50.0,
          //                         ),
          //
          //                         indicatorBorderRadius: BorderRadius.circular( 50.0 ),
          //                       ),
          //                       iconBuilder: (value) => Image.asset(
          //                         value
          //                             ? 'assets/images/icons/light.png'
          //                             : 'assets/images/icons/night.png',
          //                         width: 18.w,
          //                         height: 18.h,
          //                       ),
          //                     );
          //                   }),
          //             ),
          //
          //             InkWell(
          //               onTap: () {
          //                 showModalBottomSheet(
          //                     backgroundColor: AppColors.white,
          //                     context: context,
          //                     shape: RoundedRectangleBorder(
          //                         borderRadius: BorderRadius.vertical(
          //                           top: Radius.circular(24.r),
          //                         )),
          //                     builder: (BuildContext context) {
          //                       return const LangSheet();
          //                     });
          //               },
          //               child: Container(
          //                 padding: EdgeInsets.symmetric(vertical: Dimens.padding_4v,horizontal: Dimens.padding_4h),
          //                 decoration: BoxDecoration(
          //                   borderRadius: BorderRadius.circular(100.r),
          //                   color: AppColors.inputColor,
          //                   border: Border.all(color: AppColors.lightGray),
          //                 ),
          //                 child: Row(
          //                   children: [
          //                     CustomSvgIcon(
          //                       assetName: AppAssets.lang,color: AppColors.darkColor,
          //                       width: 20.w,
          //                       height: 20.h,),
          //                     SizedBox(width: Dimens.padding_4h,),
          //                     CustomText(title:AppTranslate.lang.tr() )
          //                   ],
          //                 ) ,
          //               ),
          //             ),
          //             // CustomSwitch(
          //             //     activeColor:AppColors.inputBorder,
          //             //     inactiveColor: AppColors.inputBorder,
          //             //   backText: AppTranslate.lang.tr(),
          //             //   heightCircle: 32.h,widthCircle: 32.w,
          //             //     width: 90.w,
          //             //     height: 37.h,
          //             //     value:lang,
          //             //     onChanged: (_){
          //             //   setState(() {
          //             //     lang = !lang;
          //             //   });
          //             //   LanguageProvider data = getIt();
          //             //   if(lang){
          //             //     data.changeLocale(context,"ar");
          //             //   }else{
          //             //     data.changeLocale(context,"en");
          //             //   }
          //             // }),
          //           ],
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
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
                            CustomSvgIcon(assetName:_imagePaths[_currentPage],width: MediaQuery.of(context).size.width,height: MediaQuery.of(context).size.height*0.4,),
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
                title: _textTitlePaths[_currentPage],
              ),
              Padding(
                padding: EdgeInsets.all(16.r),
                child:
                CustomText(
                  title:  _textSubTitlePaths[_currentPage],
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _currentPage == 0 ? const SizedBox():
                      Transform.rotate(
                        angle: context.locale.languageCode == 'en' ? math.pi : 0,
                        child: InkWell(
                          onTap: () {
                            if (_currentPage > 0) {
                              _pageController.previousPage(duration: const Duration(milliseconds: 500), curve: Curves.ease);
                            }
                          },
                          child: SizedBox(
                            height: 50.h,
                            width: 50.w,
                            child: CustomSvgIcon(assetName:'AppAssets.previseIcon',height: 50.h,width: 50.w,),
                          ),
                        ),
                      ),
                      SizedBox(width: 7.w),
                      _currentPage == 2 ?
                      CustomButton(
                          width: 76.w,
                          title: 'AppTranslate.start.tr()',
                          fontColor:AppColors.white,
                          bg: AppColors.secondColor,
                          height: 50.h,
                          onTap: (){
                            // NavigatorHandler.pushAndRemoveUntil(const Login());
                          })
                          : Transform.rotate(
                            angle: context.locale.languageCode == 'en' ? math.pi : 0,
                            child: InkWell(
                                                      onTap: () {
                            _pageController.nextPage(duration: Duration(milliseconds: 500), curve: Curves.ease);
                                                      },
                                                      child: SizedBox(
                            height: 50.h,
                            width: 50.w,
                            child: CustomSvgIcon(assetName:'AppAssets.nextIcon',height: 50.h,width: 50.w,),
                                                      ),
                                                    ),
                          ),
                    ],
                  ),

              ],
            ),
          ),
        ],
      )

    );
  }
}