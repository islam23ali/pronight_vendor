import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:pronight_vendor/core/app_theme/app_colors.dart';
import 'package:pronight_vendor/core/dimens/dimens.dart';
import 'package:pronight_vendor/core/extensions/num_extensions.dart';
import 'package:pronight_vendor/core/resources/app_assets.dart';
import 'package:pronight_vendor/core/resources/app_translate.dart';
import 'package:pronight_vendor/presentations/components/custom_app_bar/custom_app_bar.dart';
import 'package:pronight_vendor/presentations/components/custom_scaffold/custom_scaffold.dart';
import 'package:pronight_vendor/presentations/components/custom_svg/CustomSvgIcon.dart';
import 'package:pronight_vendor/presentations/components/custom_text/custom_text.dart';
import 'package:pronight_vendor/presentations/modules/add_unit_page/add_unit_view_model.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../../core/app_theme/text_styles.dart';
import '../../../core/resources/font_size.dart';
import '../../../injection.dart';

class BookingDaysPage extends StatefulWidget {
  final String? unitId;
  const BookingDaysPage({super.key, required this.unitId});

  @override
  State<BookingDaysPage> createState() => _BookingDaysPageState();
}

class _BookingDaysPageState extends State<BookingDaysPage> {
  AddUnitViewModel provider = getIt();
  int month =DateTime.now().month;
  int year =DateTime.now().year;
  @override
  void initState() {
    provider.reservationDays(widget.unitId,'$month-$year');
    super.initState();

  }

  String _selectedDate = '';
  String _dateCount = '';
  String _range = '';
  String _rangeCount = '';
  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    setState(() {
      if (args.value is PickerDateRange) {
        _range = '${DateFormat('dd/MM/yyyy').format(args.value.startDate)} -'
        // ignore: lines_longer_than_80_chars
            ' ${DateFormat('dd/MM/yyyy').format(args.value.endDate ?? args.value.startDate)}';
      } else if (args.value is DateTime) {
        _selectedDate = args.value.toString();
      } else if (args.value is List<DateTime>) {
        _dateCount = args.value.length.toString();
      } else {
        _rangeCount = args.value.length.toString();
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      backgroundColor:const Color(0xffF6FFFA),
      systemNavigationBarColor:const Color(0xffF6FFFA),
      appBar: CustomAppBar(title: AppTranslate.bookingDays.tr(),height: 65.h,bgColor:const Color(0xffF6FFFA),topColor:const Color(0xffF6FFFA),statusBarColor: const Color(0xffF6FFFA),),
      body: Padding(
        padding: EdgeInsets.all(Dimens.padding_16),
        child: Column(
          children: [
            SizedBox(height: 310.h,
              child: Material(elevation: 4,borderRadius: BorderRadius.circular(8.r) ,
                child: ClipRRect(borderRadius: BorderRadius.circular(8.r),
                  child: SfDateRangePicker(
                    // toggleDaySelection: true,
                    // showActionButtons: true,
                    // showTodayButton: true,
                    yearCellStyle:DateRangePickerYearCellStyle(
                      todayTextStyle: AppTextStyles().normalText(fontSize: AppFonts.font_14).textColorNormal(AppColors.primaryColor),
                        todayCellDecoration:BoxDecoration(borderRadius: BorderRadius.circular(100.r),border: Border.all(width: 1.w,color: AppColors.primaryColor)),
                        leadingDatesTextStyle:AppTextStyles().normalText(fontSize: AppFonts.font_14).textColorNormal(AppColors.blackColor),
                        disabledDatesTextStyle:AppTextStyles().normalText(fontSize: AppFonts.font_14).textColorNormal(AppColors.blackColor),
                      textStyle: AppTextStyles().normalText(fontSize: AppFonts.font_14).textColorNormal(AppColors.blackColor),) ,
                    monthCellStyle: DateRangePickerMonthCellStyle(selectionColor: AppColors.primaryColor,specialDatesTextStyle: AppTextStyles().normalText(fontSize: AppFonts.font_16,).textColorBold(AppColors.white),),
                    monthViewSettings: DateRangePickerMonthViewSettings(
                        viewHeaderStyle:DateRangePickerViewHeaderStyle(textStyle:
                        AppTextStyles().normalText(fontSize: AppFonts.font_9,).textColorBold(AppColors.darkPrimaryColor) ), ),
                    selectionTextStyle: AppTextStyles().normalText(fontSize: AppFonts.font_16,).textColorBold(AppColors.white),
                    rangeTextStyle: AppTextStyles().normalText(fontSize: AppFonts.font_16,).textColorBold(AppColors.white),
                    todayHighlightColor: AppColors.primaryColor,
                    selectionColor: AppColors.errorColor,
                    rangeSelectionColor: AppColors.errorColor,
                    startRangeSelectionColor: AppColors.errorColor,
                    endRangeSelectionColor: AppColors.errorColor,
                    backgroundColor: AppColors.white,
                    headerStyle: DateRangePickerHeaderStyle(backgroundColor: AppColors.white,textAlign: TextAlign.center,
                        textStyle:AppTextStyles().normalText(fontSize: AppFonts.font_14,).textColorBold(AppColors.textColor) ),
                    headerHeight: 56.h,
                    onSelectionChanged: _onSelectionChanged,
                    selectionMode: DateRangePickerSelectionMode.range,
                    initialSelectedRange: PickerDateRange(
                        DateTime.now().subtract(const Duration(days: 4)),
                        DateTime.now().add(const Duration(days: 3))),
                  ),
                ),
              ),
            ),
            // Expanded(
            //   child: AnimationLimiter(
            //     child: ListView.builder(
            //         padding: EdgeInsets.symmetric(vertical: Dimens.padding_12v),
            //         shrinkWrap: true,
            //         itemCount: 10,
            //         itemBuilder: (context, index) {
            //           return AnimationConfiguration.staggeredGrid(
            //               duration:const Duration(milliseconds: 900),
            //               position: index,
            //               columnCount: 1,
            //               child: ScaleAnimation(
            //                   duration:const Duration(milliseconds: 1000),
            //                   curve: Curves.fastLinearToSlowEaseIn,
            //                   child: FadeInAnimation(child:
            //                   Padding(
            //                     padding:EdgeInsets.symmetric(vertical:Dimens.padding_8v),
            //                     child: Material(elevation: 4,borderRadius:BorderRadius.circular(8.r),color: const Color(0xffFFFFFF),
            //                       child: Container(
            //                         padding: EdgeInsets.all(16.r),
            //                         decoration: BoxDecoration(border: Border.all(width: 1.w,color: const Color(0xff9F9F9F)),color: const Color(0xffFFFFFF),borderRadius: BorderRadius.circular(8.r)),
            //                         child:Row(crossAxisAlignment: CrossAxisAlignment.start,
            //                           children: [
            //                           CustomSvgIcon(assetName: AppAssets.bed,width: 13.w,height: 17.h),
            //                             SizedBox(width: 5.w),
            //                             CustomText(title: 'من يوم 2 : يوم 5  تم حجز غرفة 5 وغرفة 8',fontSize: AppFonts.font_12,fontWeight: FontWeight.w600,fontColor: AppColors.textColor3,)
            //                         ],) ,),
            //                     ),
            //                   ),
            //                   )));
            //         }),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
