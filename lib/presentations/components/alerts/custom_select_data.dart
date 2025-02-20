import 'package:pronight_vendor/core/dimens/dimens.dart';
import 'package:pronight_vendor/core/extensions/num_extensions.dart';
import 'package:pronight_vendor/core/navigator/navigator.dart';
import 'package:pronight_vendor/presentations/components/custom_button/custom_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../../../../core/app_theme/app_colors.dart';
import '../../../../../../../../core/resources/app_translate.dart';
import '../../../../../../../../core/resources/font_size.dart';
import '../custom_text/custom_text.dart';

class CustomSelectDate extends StatefulWidget {
  final ValueChanged<String> onDateSelected;

  const CustomSelectDate({super.key, required this.onDateSelected});

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

  @override
  void initState() {
    super.initState();
    DateTime now = DateTime.now();
    selectedMonth = now.month;
    selectedDay = now.day;
    selectedYear = now.year;
    years = List.generate(151, (index) => now.year - 150 + index);
    days = _getDaysInMonth(selectedMonth, selectedYear);
    controller.text = '${selectedDay}/${selectedMonth}/${selectedYear}';
  }

  /// دي ياباشا علشان تحديد السنه بسيطه ولا كبيسه والشهور اللي هيا 31 ولا 30 اخوك اسلام اللي عامل الكلام دة
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
      if (selectedDay > days.length) {
        selectedDay = days.last;
      }
      controller.text = '${selectedDay}/${selectedMonth}/${selectedYear}';
    });
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
                Expanded(
                  child: CupertinoPicker(
                    scrollController: FixedExtentScrollController(
                      initialItem: years.indexOf(selectedYear),
                    ),
                    itemExtent: 40.0,
                    onSelectedItemChanged: (int index) {
                      setState(() {
                        selectedYear = years[index];
                        _updateDays();
                      });
                    },
                    children: years.map((year) {
                      return Center(
                        child: CustomText(
                          title: year.toString(),
                          fontSize: AppFonts.font_20,
                        ),
                      );
                    }).toList(),
                  ),
                ),
                Expanded(
                  child: CupertinoPicker(
                    scrollController: FixedExtentScrollController(
                      initialItem: selectedDay - 1,
                    ),
                    itemExtent: 40.0,
                    onSelectedItemChanged: (int index) {
                      setState(() {
                        selectedDay = days[index];
                        controller.text = '${selectedDay}/${selectedMonth}/${selectedYear}';
                      });
                    },
                    children: days.map((day) {
                      return Center(
                        child: CustomText(
                          title: day.toString(),
                          fontSize: AppFonts.font_20,
                        ),
                      );
                    }).toList(),
                  ),
                ),
                Expanded(
                  child: CupertinoPicker(
                    scrollController: FixedExtentScrollController(
                      initialItem: selectedMonth - 1,
                    ),
                    itemExtent: 40.0,
                    onSelectedItemChanged: (int index) {
                      setState(() {
                        selectedMonth = index + 1;
                        _updateDays();
                      });
                    },
                    children: months.map((month) {
                      return Center(
                        child: CustomText(
                          title: month,
                          fontSize: AppFonts.font_20,
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