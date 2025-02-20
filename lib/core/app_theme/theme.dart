import 'package:pronight_vendor/core/app_theme/app_colors.dart';
import 'package:pronight_vendor/core/extensions/num_extensions.dart';
import 'package:pronight_vendor/core/utils/preferences.dart';
import 'package:flutter/material.dart';

// ThemeData(
// brightness: isDarkMode() ? Brightness.dark : Brightness.light,
// primaryColor: isDarkMode() ? bodyBg : mainColor,
// scaffoldBackgroundColor: isDarkMode() ? Colors.black : Colors.white,
// primaryColorDark: mainColor,
// textSelectionTheme: const TextSelectionThemeData(cursorColor: mainColor,selectionHandleColor: mainColor,selectionColor: mainColor),
// cardTheme: CardTheme(color: isDarkMode() ? cardDark : Colors.white,surfaceTintColor: Colors.transparent),
// bottomSheetTheme: BottomSheetThemeData(backgroundColor: AppTheme.isDarkMode()?dark:Colors.white,surfaceTintColor: Colors.transparent),
// toggleButtonsTheme: const ToggleButtonsThemeData(
// color: mainColor,
// selectedColor: mainColor,
// disabledColor: greyColor));
// class AppTheme {
//   static bool isDarkMode() {
//     Preferences preferences = Preferences();
//     return preferences.isDarkMode();
//   }
//
//   static ThemeData themeLight() {
//     return ThemeData(
//       brightness:  isDarkMode() ? Brightness.dark : Brightness.light,
//       primaryColor: isDarkMode() ? Color(0xffededed) : AppColors.primaryColor,
//       splashColor: Colors.transparent,
//       hoverColor: Colors.transparent,
//       highlightColor: Colors.transparent,
//       focusColor: Colors.transparent,
//       scaffoldBackgroundColor: isDarkMode() ? Colors.black : Colors.white,
//       canvasColor: AppColors.white,
//       dialogBackgroundColor: AppColors.white,
//       // color: mainColor,
// // selectedColor: mainColor,
//       disabledColor: AppColors.darkColor,
//       appBarTheme: const AppBarTheme(surfaceTintColor: Colors.white,),
//       textSelectionTheme: TextSelectionThemeData(cursorColor: AppColors.primaryColor,selectionHandleColor: AppColors.primaryColor,selectionColor: AppColors.primaryColor),
//       cardTheme:CardTheme(color: isDarkMode() ? AppColors.darkColor : Colors.white,surfaceTintColor: Colors.transparent),
//       bottomSheetTheme:  BottomSheetThemeData(backgroundColor:AppTheme.isDarkMode()?AppColors.darkColor:Colors.white,surfaceTintColor: Colors.transparent,shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(24.r),topRight: Radius.circular(24.r)))),
//     toggleButtonsTheme: ToggleButtonsThemeData(
// color: AppColors.primaryColor,
// selectedColor: AppColors.primaryColor,
// disabledColor: AppColors.darkColor)
//     );
//   }
// }