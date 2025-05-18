import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pronight_vendor/core/extensions/num_extensions.dart';
import '../../../../../../../../core/app_theme/app_colors.dart';
import '../../../../../../../../core/resources/app_translate.dart';
import '../../../../../../../../core/resources/font_size.dart';
import '../../../../../core/dimens/dimens.dart';
import '../../../../../core/navigator/navigator.dart';
import '../custom_button/custom_button.dart';
import '../custom_text/custom_text.dart';

class CustomSelectDate extends StatefulWidget {
  final ValueChanged<String> onDateSelected;
  final String? initialDate; // Optional initial date
  final bool disablePastDates; // Flag to disable past dates

  const CustomSelectDate({
    super.key,
    required this.onDateSelected,
    this.initialDate,
    this.disablePastDates = false,
  });

  @override
  _CustomSelectDateState createState() => _CustomSelectDateState();
}

class _CustomSelectDateState extends State<CustomSelectDate> {
  late int selectedMonth;
  late int selectedDay;
  late int selectedYear;
  TextEditingController controller = TextEditingController();
  final List<String> months = [
    AppTranslate.january.tr(),
    AppTranslate.february.tr(),
    AppTranslate.march.tr(),
    AppTranslate.april.tr(),
    AppTranslate.may.tr(),
    AppTranslate.june.tr(),
    AppTranslate.july.tr(),
    AppTranslate.august.tr(),
    AppTranslate.september.tr(),
    AppTranslate.october.tr(),
    AppTranslate.november.tr(),
    AppTranslate.december.tr(),
  ];
  late List<int> days;
  late List<int> years;
  late DateTime now;
  late DateTime minDate;
  late DateTime toDate;

  @override
  void initState() {
    super.initState();
    now = DateTime.now();
    minDate = widget.disablePastDates ? now : DateTime(now.year - 150);
    toDate = widget.disablePastDates ? now : DateTime(now.year + 150);

    // Parse initial date if provided
    if (widget.initialDate != null) {
      try {
        final parts = widget.initialDate!.split('-');
        selectedYear = int.parse(parts[0]);
        selectedMonth = int.parse(parts[1]);
        selectedDay = int.parse(parts[2]);
      } catch (e) {
        // Fallback to current date if parsing fails
        selectedYear = now.year;
        selectedMonth = now.month;
        selectedDay = now.day;
      }
    } else {
      selectedYear = now.year;
      selectedMonth = now.month;
      selectedDay = now.day;
    }

    // Generate years (150 years back from now)
    years = List.generate(151, (index) => now.year - 150 + index)
        .where((year) => year >= minDate.year)
        .toList();

    // Adjust selected year if it's before min date
    if (selectedYear < minDate.year) {
      selectedYear = minDate.year;
    }

    days = _getDaysInMonth(selectedMonth, selectedYear);

    // Adjust selected day if it's invalid for the month
    if (selectedDay > days.length) {
      selectedDay = days.last;
    }

    // Adjust selected month if it's before min date month (when year is min year)
    if (selectedYear == minDate.year && selectedMonth < minDate.month) {
      selectedMonth = minDate.month;
    }

    // Adjust selected day if it's before min date day (when year and month match min date)
    if (selectedYear == minDate.year &&
        selectedMonth == minDate.month &&
        selectedDay < minDate.day) {
      selectedDay = minDate.day;
    }

    controller.text = '$selectedYear-${_formatNumber(selectedMonth)}-${_formatNumber(selectedDay)}';
  }

  String _formatNumber(int number) {
    return number.toString().padLeft(2, '0');
  }

  List<int> _getDaysInMonth(int month, int year) {
    if (month == 2) {
      if ((year % 4 == 0 && year % 100 != 0) || (year % 400 == 0)) {
        return List.generate(29, (index) => index + 1);
      } else {
        return List.generate(28, (index) => index + 1);
      }
    } else if ([4, 6, 9, 11].contains(month)) {
      return List.generate(30, (index) => index + 1);
    } else {
      return List.generate(31, (index) => index + 1);
    }
  }

  void _updateDays() {
    setState(() {
      days = _getDaysInMonth(selectedMonth, selectedYear);

      // Ensure selected day is valid for the new month
      if (selectedDay > days.length) {
        selectedDay = days.last;
      }

      // If we're at the min date year/month, ensure day isn't before min date
      if (widget.disablePastDates &&
          selectedYear == minDate.year &&
          selectedMonth == minDate.month &&
          selectedDay < minDate.day) {
        selectedDay = minDate.day;
      }

      controller.text = '$selectedYear-${_formatNumber(selectedMonth)}-${_formatNumber(selectedDay)}';
    });
  }

  bool _isDateDisabled(int year, int month, int day) {
    if (!widget.disablePastDates) return false;

    final date = DateTime(year, month, day);
    return date.isBefore(minDate);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      surfaceTintColor: AppColors.white,
      backgroundColor: AppColors.white,
      contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
      insetPadding: EdgeInsets.all(10.w),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24.r),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 250.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Year Picker
                Expanded(
                  child: CupertinoPicker(
                    scrollController: FixedExtentScrollController(
                      initialItem: years.indexOf(selectedYear),
                    ),
                    itemExtent: 40.0,
                    onSelectedItemChanged: (int index) {
                      setState(() {
                        selectedYear = years[index];
                        // If we're at the min year, ensure month isn't before min month
                        if (widget.disablePastDates && selectedYear == minDate.year && selectedMonth < minDate.month) {
                          selectedMonth = minDate.month;
                        }
                        _updateDays();
                      });
                    },
                    children: years.map((year) {
                      final isDisabled = widget.disablePastDates && year < minDate.year;
                      return Center(
                        child: CustomText(
                          title: year.toString(),
                          fontSize: AppFonts.font_19,
                          fontColor: isDisabled ? AppColors.gray : null,
                        ),
                      );
                    }).toList(),
                  ),
                ),

                // Day Picker
                Expanded(
                  child: CupertinoPicker(
                    scrollController: FixedExtentScrollController(
                      initialItem: selectedDay - 1,
                    ),
                    itemExtent: 40.0,
                    onSelectedItemChanged: (int index) {
                      setState(() {
                        selectedDay = days[index];
                        controller.text = '$selectedYear-${_formatNumber(selectedMonth)}-${_formatNumber(selectedDay)}';
                      });
                    },
                    children: days.map((day) {
                      final isDisabled = _isDateDisabled(selectedYear, selectedMonth, day);
                      return Center(
                        child: CustomText(
                          title: day.toString(),
                          fontSize: AppFonts.font_19,
                          fontColor: isDisabled ? AppColors.gray : null,
                        ),
                      );
                    }).toList(),
                  ),
                ),

                // Month Picker
                Expanded(
                  child: CupertinoPicker(
                    scrollController: FixedExtentScrollController(
                      initialItem: selectedMonth - 1,
                    ),
                    itemExtent: 40.0,
                    onSelectedItemChanged: (int index) {
                      setState(() {
                        selectedMonth = index + 1;
                        // If we're at the min year/month, ensure day isn't before min day
                        if (widget.disablePastDates &&
                            selectedYear == minDate.year &&
                            selectedMonth == minDate.month) {
                          selectedDay = minDate.day;
                        }
                        _updateDays();
                      });
                    },
                    children: months.asMap().entries.map((entry) {
                      final monthIndex = entry.key + 1;
                      final isDisabled = widget.disablePastDates &&
                          selectedYear == minDate.year &&
                          monthIndex < minDate.month;

                      return Center(
                        child: CustomText(
                          title: entry.value,
                          fontSize: AppFonts.font_22,
                          fontColor: isDisabled ? AppColors.gray : null,
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
          CustomButton(
            width: Dimens.width - 100.w,
            title: AppTranslate.confirm.tr(),
            onTap: () {
              setState(() {
                widget.onDateSelected(controller.text);
                NavigatorHandler.pop();
              });
            },
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}