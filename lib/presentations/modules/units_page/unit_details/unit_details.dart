import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pronight_vendor/core/app_theme/app_colors.dart';
import 'package:pronight_vendor/core/dimens/dimens.dart';
import 'package:pronight_vendor/core/extensions/num_extensions.dart';
import 'package:pronight_vendor/core/navigator/navigator.dart';
import 'package:pronight_vendor/core/resources/app_assets.dart';
import 'package:pronight_vendor/core/resources/app_translate.dart';
import 'package:pronight_vendor/core/resources/font_size.dart';
import 'package:pronight_vendor/presentations/app_loader.dart';
import 'package:pronight_vendor/presentations/components/custom_scaffold/custom_scaffold.dart';
import 'package:pronight_vendor/presentations/components/custom_svg/CustomSvgIcon.dart';
import 'package:pronight_vendor/presentations/components/custom_text/custom_text.dart';
import 'package:pronight_vendor/presentations/modules/units_page/screen/set_price_screen.dart';
import 'package:pronight_vendor/presentations/modules/units_page/unit_details/widgets/additional_services.dart';
import 'package:pronight_vendor/presentations/modules/units_page/unit_details/widgets/custom_slider_unit_images.dart';
import 'package:pronight_vendor/presentations/modules/units_page/unit_details/widgets/unit_data.dart';
import 'package:provider/provider.dart';
import 'package:flutter/widgets.dart' as ui;
import '../../../../injection.dart';
import '../../booking_days_page/booking_days_page.dart';
import 'one_unit_view_model.dart';

class UnitDetails extends StatefulWidget {
  const UnitDetails({super.key, required this.id});
  final String id;

  @override
  State<UnitDetails> createState() => _UnitDetailsState();
}

class _UnitDetailsState extends State<UnitDetails> {
  OneUnitViewModel provider = getIt();
  @override
  void initState() {
    super.initState();
    provider.initOneUnit(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      body: Consumer<OneUnitViewModel>(builder: (context, data, _) {
        return data.isLoading
            ? const Center(child: AppLoader())
            : Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 250.h, width: Dimens.width,
                        margin: EdgeInsets.only(bottom: 50.h),
                        // decoration:const BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/icons/${AppAssets.bgItemDetails}.png'),fit: BoxFit.cover,)),
                        child:
                            (data.oneUnitModel?.data?.images?.isEmpty == true)
                                ? const CustomPngIcon(
                                    width: double.infinity,
                                    assetName: AppAssets.bgItemDetails,
                                    fit: BoxFit.cover)
                                : CustomSliderUnitImages(
                                    image: data.oneUnitModel?.data?.images),
                      ),
                      Positioned(
                          bottom: 20,
                          left: 40,
                          right: 40,
                          child: Material(
                            elevation: 10,
                            borderRadius: BorderRadius.circular(19.r),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: Dimens.padding_16h,
                                  vertical: Dimens.padding_16v),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(19.r),
                                  color: AppColors.white),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    children: [
                                      CustomSvgIcon(
                                          assetName: AppAssets.mm,
                                          width: 12.w,
                                          height: 12.h),
                                      SizedBox(width: 3.w),
                                      CustomText(
                                        title: '${data.oneUnitModel?.data?.area} ${AppTranslate.meter.tr()}',
                                        fontSize: AppFonts.font_11,
                                      ),
                                    ],
                                  ),
                                  Container(
                                      width: 1.w,
                                      height: 20.h,
                                      color: AppColors.gray),
                                  Row(
                                    children: [
                                      CustomSvgIcon(
                                          assetName: AppAssets.address,
                                          width: 14.w,
                                          height: 14.h),
                                      SizedBox(width: 3.w),
                                      CustomText(
                                        title: data.oneUnitModel?.data?.city?.title??'',
                                        fontSize: AppFonts.font_11,
                                      ),
                                    ],
                                  ),
                                  Container(
                                      width: 1.w,
                                      height: 20.h,
                                      color: AppColors.gray),
                                  Row(
                                    children: [
                                      CustomSvgIcon(
                                          assetName: AppAssets.contractNum,
                                          width: 11.w,
                                          height: 11.h),
                                      SizedBox(width: 3.w),
                                      CustomText(
                                        title: data.oneUnitModel?.data?.price.toString()??'',
                                        fontSize: AppFonts.font_11,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )),
                      Positioned(
                          top: 40,
                          child: Padding(
                            padding: EdgeInsets.all(Dimens.padding_24),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap: () {
                                    NavigatorHandler.pop();
                                  },
                                  child: Transform.scale(
                                    scaleX:data.saveUserData.getLang()=='en'? -1:1,
                                    child: CustomSvgIcon(
                                        assetName: AppAssets.back,
                                        width: 25.w,
                                        height: 25.h),
                                  ),
                                ),
                                SizedBox(width: 15.w),
                                CustomText(
                                  title: AppTranslate.unitDetails.tr(),
                                  fontSize: AppFonts.font_14,
                                  fontColor: AppColors.white,
                                )
                              ],
                            ),
                          ))
                    ],
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: Dimens.padding_24h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                             UnitData(model: data.oneUnitModel,),
                            SizedBox(height: 20.h),
                            CustomText(
                              title: data.oneUnitModel?.data?.title??'',
                              fontSize: AppFonts.font_16,
                              fontWeight: FontWeight.w600,
                            ),
                            SizedBox(height: 10.h),
                            CustomText(
                              title:
                              data.oneUnitModel?.data?.desc??'',
                              fontSize: AppFonts.font_10,
                              fontColor: AppColors.textColor,
                            ),
                            SizedBox(height: 20.h),
                            CustomText(
                              title: AppTranslate.additionalServices.tr(),
                              fontSize: AppFonts.font_16,
                              fontWeight: FontWeight.w600,
                            ),
                             AdditionalServicesUnit(additionalService: data.oneUnitModel?.data?.additionalServices),
                            SizedBox(height: 20.h),
                            InkWell(
                              onTap: () {
                                NavigatorHandler.push(BookingDaysPage(unitId: widget.id));
                              },
                              child: Container(
                                padding: EdgeInsets.all(Dimens.padding_16),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.r),
                                    color: AppColors.primaryColor
                                        .withAlpha((0.20 * 255).round())),
                                alignment: Alignment.center,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    CustomSvgIcon(
                                        assetName: AppAssets.room,
                                        height: 21.h,
                                        width: 19.w),
                                    SizedBox(width: 5.w),
                                    CustomText(
                                      title: AppTranslate.bookingDays.tr(),
                                      fontSize: AppFonts.font_12,
                                      fontWeight: FontWeight.w600,
                                      fontColor: AppColors.textColor3,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 20.h),
                            InkWell(
                              onTap: () {
                                NavigatorHandler.push( SetPriceScreen(id: widget.id));
                              },
                              child: Container(
                                padding: EdgeInsets.all(Dimens.padding_16),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.r),
                                    color: AppColors.errorColor
                                        .withAlpha((0.10 * 255).round())),
                                alignment: Alignment.center,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    CustomSvgIcon(
                                        assetName: AppAssets.contractNum,
                                        height: 18.h,
                                        width: 15.w),
                                    SizedBox(width: 5.w),
                                    CustomText(
                                      title: AppTranslate.priceControl.tr(),
                                      fontSize: AppFonts.font_12,
                                      fontWeight: FontWeight.w600,
                                      fontColor: AppColors.textColor3,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
      }),
    );
  }
}
