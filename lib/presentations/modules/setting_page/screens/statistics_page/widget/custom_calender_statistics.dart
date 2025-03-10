import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:pronight_vendor/core/extensions/num_extensions.dart';
import '../../../../../../../../core/app_theme/app_colors.dart';
import '../../../../../../../../core/resources/app_translate.dart';
import '../../../../../../../../core/resources/font_size.dart';
import '../../../../../components/custom_text/custom_text.dart';

class CustomSelectDateStatistics extends StatefulWidget {
  final ValueChanged<String> onDateSelected;

  const CustomSelectDateStatistics({super.key, required this.onDateSelected});

  @override
  _CustomSelectDateStatisticsState createState() => _CustomSelectDateStatisticsState();
}

class _CustomSelectDateStatisticsState extends State<CustomSelectDateStatistics> {
  late int selectedMonth;
  // late int selectedDay;
  // late int selectedYear;
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
  // late List<int> days;
  // late List<int> years;

  @override
  void initState() {
    super.initState();
    DateTime now = DateTime.now();
    selectedMonth = now.month;
    controller.text = '${selectedMonth}';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 80.h,
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: months.length,
                  shrinkWrap: true,
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedMonth = index + 1;
                          controller.text=selectedMonth.toString();
                          widget.onDateSelected(controller.text);
                        });
                      },
                      child: Container(width: 69.w,height: 71.h,
                        margin: EdgeInsets.all(4.w),
                        decoration: BoxDecoration(
                          color: selectedMonth == index + 1 ? AppColors.primaryColor : AppColors.bgHomeColor,
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CustomText(
                              title: months[index],
                              fontSize: AppFonts.font_15,
                              fontColor: selectedMonth == index + 1 ? AppColors.white : AppColors.textColor,
                            ),
                            CustomText(
                              title: '${index+1}',
                              fontSize: AppFonts.font_20,fontWeight: FontWeight.w800,
                              fontColor: selectedMonth == index + 1 ? AppColors.white : AppColors.blackColor,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}