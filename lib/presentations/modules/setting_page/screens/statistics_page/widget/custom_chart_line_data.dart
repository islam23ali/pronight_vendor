import 'package:easy_localization/easy_localization.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:pronight_vendor/core/extensions/num_extensions.dart';
import 'package:pronight_vendor/core/resources/app_translate.dart';
import 'package:pronight_vendor/core/resources/font_size.dart';
import '../../../../../../core/app_theme/app_colors.dart';
import '../../../../../components/custom_text/custom_text.dart';

class CustomChartLineData extends StatelessWidget {
  final List<double> weights = [15,50, 40, 13, 20,40, 13, 20, 10, 0];
  // final List<String> ages = ['30 وحدة ','20 وحدة', '50 وحدة', '30 وحدة', '40 وحدة', '55 وحدة'];
  final List<int> ages = [1,2,3,4,5,6,7,8,9,10];

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(

        gridData:const FlGridData(show: false),
        titlesData: FlTitlesData(
          topTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: false,
              getTitlesWidget: (value, meta) {
                return CustomText(title: value.toInt().toString());
              },
            ),
          ),
          bottomTitles: AxisTitles(
            // sideTitles: SideTitles(showTitles: false), // Hide top titles
            sideTitles: SideTitles(reservedSize: 73.h,
              showTitles: true,
              getTitlesWidget: (value, meta) {
                return RotatedBox(quarterTurns: 1,
                    child: CustomText(title: '${AppTranslate.unit.tr()} ${ages[value.toInt()].toString()}',fontColor: AppColors.textGrayColor,fontSize: AppFonts.font_12,));
              },
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: false,
              getTitlesWidget: (value, meta) {
                return CustomText(title: value.toInt().toString());
              },
            ),
          ),
          rightTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
        ),
        borderData: FlBorderData(show: false,border: Border.all(width: 2.w,color: AppColors.darkColor.withAlpha((0.03*255).round()))),
        lineBarsData: [
          LineChartBarData(
            spots: weights.asMap().entries.map((entry) {
              return FlSpot(entry.key.toDouble(), entry.value);
            }).toList(),
            isCurved: true,
            color: AppColors.secondColor,
            dotData:const FlDotData(show: false),
            belowBarData: BarAreaData(
              show: true,
              gradient: LinearGradient(
                colors: [
                  AppColors.primaryColor,
                  AppColors.primaryColor.withAlpha((0.010*255).round()),
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            )),
        ],
      ),
    );
  }
}