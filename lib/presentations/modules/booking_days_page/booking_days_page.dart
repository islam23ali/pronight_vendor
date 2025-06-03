import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pronight_vendor/core/app_theme/app_colors.dart';
import 'package:pronight_vendor/core/dimens/dimens.dart';
import 'package:pronight_vendor/core/extensions/num_extensions.dart';
import 'package:pronight_vendor/core/resources/app_translate.dart';
import 'package:pronight_vendor/presentations/components/custom_app_bar/custom_app_bar.dart';
import 'package:pronight_vendor/presentations/components/custom_scaffold/custom_scaffold.dart';
import 'package:pronight_vendor/presentations/modules/add_unit_page/add_unit_view_model.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:intl/intl.dart';
import '../../../core/app_theme/text_styles.dart';
import '../../../core/resources/font_size.dart';
import '../../../injection.dart';

class BookingDaysPage extends StatefulWidget {
  final String? unitId;


  const BookingDaysPage({
    super.key,
    required this.unitId,

  });

  @override
  State<BookingDaysPage> createState() => _BookingDaysPageState();
}

class _BookingDaysPageState extends State<BookingDaysPage> {
  AddUnitViewModel provider = getIt();
  int month = DateTime.now().month;
  int year = DateTime.now().year;

  @override
  void initState() {
 WidgetsBinding.instance.addPostFrameCallback((_){
   provider.reservationDays(widget.unitId, '$month-$year');
 });
    super.initState();
  }

  DateTime _tryParseDate(String dateStr) {
    List<String> formats = ['dd-MM-yyyy', 'dd/MM/yyyy', 'yyyy-MM-dd'];
    for (final format in formats) {
      try {
        // return DateFormat(format).parseStrict(dateStr);
        return DateFormat('dd-MM-yyyy', 'en').parseStrict(dateStr);
      } catch (_) {}
    }
    debugPrint('All formats failed for $dateStr');
    return DateTime.now();
  }

  List<DateTime> _convertStringDatesToDateTime(List<String> dateStrings) {
    return dateStrings.map(_tryParseDate).toList();
  }

  @override
  Widget build(BuildContext context) {


    return CustomScaffold(
      backgroundColor: const Color(0xffF6FFFA),
      systemNavigationBarColor: const Color(0xffF6FFFA),
      appBar: CustomAppBar(
        title: AppTranslate.bookingDays.tr(),
        height: 65.h,
        bgColor: const Color(0xffF6FFFA),
        topColor: const Color(0xffF6FFFA),
        statusBarColor: const Color(0xffF6FFFA),
      ),
      body: Consumer<AddUnitViewModel>(
        builder: (context, data, _) {
          List<DateTime> initialDateTimes = data.reservationDaysModel?.data != null
              ? _convertStringDatesToDateTime(data.reservationDaysModel?.data??[])
              : [];
          return Padding(
            padding: EdgeInsets.all(Dimens.padding_16),
            child: Column(
              children: [
                SizedBox(
                  height: 310.h,
                  child: Material(
                    elevation: 4,
                    borderRadius: BorderRadius.circular(8.r),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.r),
                      child: IgnorePointer( ignoring: true,
                        child: SfDateRangePicker(
                          // تعطيل التفاعل مع التقويم
                          enableMultiView: false,
                          allowViewNavigation: false,
                          // allowInteraction: false,
                          showNavigationArrow: false,
                          showActionButtons: false,
                        
                          yearCellStyle: DateRangePickerYearCellStyle(
                            todayTextStyle: AppTextStyles()
                                .normalText(fontSize: AppFonts.font_14)
                                .textColorNormal(AppColors.primaryColor),
                            todayCellDecoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100.r),
                              border: Border.all(
                                width: 1.w,
                                color: AppColors.primaryColor,
                              ),
                            ),
                            leadingDatesTextStyle: AppTextStyles()
                                .normalText(fontSize: AppFonts.font_14)
                                .textColorNormal(AppColors.blackColor),
                            disabledDatesTextStyle: AppTextStyles()
                                .normalText(fontSize: AppFonts.font_14)
                                .textColorNormal(AppColors.blackColor),
                            textStyle: AppTextStyles()
                                .normalText(fontSize: AppFonts.font_14)
                                .textColorNormal(AppColors.blackColor),
                          ),
                          monthCellStyle: DateRangePickerMonthCellStyle(
                            selectionColor: AppColors.primaryColor,
                            specialDatesTextStyle: AppTextStyles()
                                .normalText(fontSize: AppFonts.font_16)
                                .textColorBold(AppColors.white),
                          ),
                          monthViewSettings: DateRangePickerMonthViewSettings(
                            viewHeaderStyle: DateRangePickerViewHeaderStyle(
                              textStyle: AppTextStyles()
                                  .normalText(fontSize: AppFonts.font_9)
                                  .textColorBold(AppColors.darkPrimaryColor),
                            ),
                          ),
                          selectionTextStyle: AppTextStyles()
                              .normalText(fontSize: AppFonts.font_16)
                              .textColorBold(AppColors.white),
                          rangeTextStyle: AppTextStyles()
                              .normalText(fontSize: AppFonts.font_16)
                              .textColorBold(AppColors.white),
                          todayHighlightColor: AppColors.primaryColor,
                          selectionColor: AppColors.primaryColor,
                          rangeSelectionColor: AppColors.primaryColor,
                          startRangeSelectionColor: AppColors.primaryColor,
                          endRangeSelectionColor: AppColors.primaryColor,
                          backgroundColor: AppColors.white,
                          headerStyle: DateRangePickerHeaderStyle(
                            backgroundColor: AppColors.white,
                            textAlign: TextAlign.center,
                            textStyle: AppTextStyles()
                                .normalText(fontSize: AppFonts.font_14)
                                .textColorBold(AppColors.textColor),
                          ),
                          headerHeight: 56.h,
                          // إزالة دالة onSelectionChanged
                          selectionMode: DateRangePickerSelectionMode.multiple,
                          initialSelectedDates: initialDateTimes,
                        ),
                      ),
                    ),
                  ),
                ),
                // عرض التواريخ المحددة مسبقاً
                if (initialDateTimes.isNotEmpty)
                  Padding(
                    padding: EdgeInsets.only(top: 16.h),
                    child: Text(
                      'التواريخ المحجوزة: ${initialDateTimes.map((date) => DateFormat('dd/MM/yyyy').format(date)).join(', ')}',
                      style: AppTextStyles()
                          .normalText(fontSize: AppFonts.font_14)
                          .textColorNormal(AppColors.textColor),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}