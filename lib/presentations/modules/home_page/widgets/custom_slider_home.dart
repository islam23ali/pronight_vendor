import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pronight_vendor/core/app_theme/app_colors.dart';
import 'package:pronight_vendor/core/dimens/dimens.dart';
import 'package:pronight_vendor/core/extensions/num_extensions.dart';
import 'package:pronight_vendor/core/resources/app_assets.dart';
import 'package:pronight_vendor/core/resources/app_translate.dart';
import 'package:pronight_vendor/core/resources/font_size.dart';
import 'package:pronight_vendor/presentations/components/custom_svg/CustomSvgIcon.dart';
import 'package:pronight_vendor/presentations/components/custom_text/custom_text.dart';
import 'package:pronight_vendor/presentations/modules/home_page/home_view_model.dart';
import 'package:provider/provider.dart';

class CustomSliderHome extends StatefulWidget {
  const CustomSliderHome({super.key});

  @override
  State<CustomSliderHome> createState() => _CustomSliderHomeState();
}

class _CustomSliderHomeState extends State<CustomSliderHome> {
  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(
      builder: (context,data,_) {
        return Stack(
          children: [
            SizedBox(
              height: 165.h,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 145.h,
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: 3,
                      onPageChanged: (index) {
                        setState(() {
                          _currentPage = index;
                        });
                      },
                      itemBuilder: (_, index) {
                        return Stack(
                          children: [
                            Transform.rotate(
                              angle: 177 * pi / 180,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(bottom: Dimens.padding_2v),
                                    width: 300.w,
                                    height: 122.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15.r),
                                      color: const Color(0xff39674C),
                                    ),
                                  ),
                                  const SizedBox(),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(16.r),
                              margin: EdgeInsets.only(
                                bottom: Dimens.padding_10h,
                                left: Dimens.padding_4h,
                                right: Dimens.padding_4h,
                              ),
                              width: 313.w,
                              height: 122.w,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/images/icons/${AppAssets.bgSliderHome}.png'),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(15.r),
                                color: AppColors.primaryColor,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomText(
                                    title: (_currentPage==0)?AppTranslate.numberOfUnitsAtPronight.tr():
                                    _currentPage==1?AppTranslate.numberOfContractsAtPronight.tr():AppTranslate.numberOfBookingsAtPronight.tr(),
                                    fontSize: AppFonts.font_15,
                                    fontWeight: FontWeight.bold,
                                    fontColor: AppColors.white,
                                  ),
                                  SizedBox(height: 10.h),
                                  Row(
                                    children: [
                                      CustomText(
                                        title:(_currentPage==0)?data.homeModel?.data?.unitsCount.toString()??'':
                                        _currentPage==1? data.homeModel?.data?.contractsCount.toString()??'':
                                        data.homeModel?.data?.reservationsCount.toString()??'',
                                        fontSize: AppFonts.font_32,
                                        fontWeight: FontWeight.bold,
                                        fontColor: AppColors.white,
                                      ),
                                      CustomText(
                                        title: (_currentPage==0)?AppTranslate.unit.tr():_currentPage==1?AppTranslate.contract.tr():AppTranslate.reservation.tr(),
                                        fontSize: AppFonts.font_16,
                                        fontWeight: FontWeight.bold,
                                        fontColor: AppColors.white,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  const SizedBox(),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              left: 50,
              child: Card(
                shadowColor: Colors.black,
                elevation: 10,
                surfaceTintColor: AppColors.white,
                color: AppColors.white,
                child: Container(
                  height: 131.h,
                  width: 37.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: AppColors.white,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          _pageController.animateToPage(
                            0,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        },
                        child: CustomSvgIcon(
                          assetName: AppAssets.fileSVG,
                          width: 20.w,
                          height: 21.h,
                          color: _currentPage == 0 ? AppColors.primaryColor : AppColors.greyColor,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          _pageController.animateToPage(
                            1,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        },
                        child: CustomSvgIcon(
                          assetName: AppAssets.homeSVG,
                          width: 20.w,
                          height: 20.h,
                          color: _currentPage == 1 ? AppColors.primaryColor : AppColors.greyColor,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          _pageController.animateToPage(
                            2,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        },
                        child: CustomSvgIcon(
                          assetName: AppAssets.showContract,
                          width: 20.w,
                          height: 21.h,
                          color: _currentPage == 2 ? AppColors.primaryColor : AppColors.greyColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      }
    );
  }
}