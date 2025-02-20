// import 'package:pronight_vendor/core/app_theme/app_colors.dart';
// import 'package:pronight_vendor/core/extensions/num_extensions.dart';
// import 'package:pronight_vendor/core/resources/font_size.dart';
// import 'package:easy_localization/easy_localization.dart' as el;
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
//
// import '../../../../../../core/dimens/dimens.dart';
// import '../../../../../../core/navigator/navigator.dart';
// import '../../../../../../core/resources/app_assets.dart';
// import '../components/custom_app_bar/custom_app_bar.dart';
// import '../components/custom_svg/CustomSvgIcon.dart';
// import '../components/custom_text/custom_text.dart';
// import 'dart:math' as math;
//
// class BackAppBar extends StatelessWidget implements PreferredSizeWidget {
//   final String? title;
//   final Color? topColor;
//   final double? height;
//   final double? leadingWidth;
//   final Widget? leading;
//   final Brightness? topColorIcons;
//   final List<Widget>? actions;
//   final PreferredSizeWidget? bottom;
//   final SystemUiOverlayStyle? systemUiOverlayStyle;
//
//   const BackAppBar({
//     super.key,
//     this.title,
//     this.systemUiOverlayStyle,
//     this.topColor,
//     this.topColorIcons,
//     this.actions, this.bottom, this.height, this.leading, this.leadingWidth,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       shape: CustomShape(),
//       systemOverlayStyle: systemUiOverlayStyle ??
//           SystemUiOverlayStyle(
//               statusBarColor: AppColors.white,
//               statusBarIconBrightness: topColorIcons ?? (preferences.isDarkMode()?Brightness.dark:Brightness.light)),
//       backgroundColor: AppColors.white,
//       surfaceTintColor: AppColors.white,
//       shadowColor: AppColors.white,
//       elevation: .3,
//       bottom: bottom,
//       title: CustomText(
//           title: title ?? '',
//           fontSize: AppFonts.font_16,
//           fontColor: AppColors.darkColor,
//           fontWeight: FontWeight.bold),
//       centerTitle: false,
//       leading:leading?? InkWell(
//         splashColor: Colors.transparent,
//         highlightColor: Colors.transparent,
//         onTap: () {
//           NavigatorHandler.pop(context);
//         },
//         child: Padding(
//           padding: EdgeInsets.only(right:context.locale.languageCode == 'ar' ?  Dimens.padding_16: 0,left:context.locale.languageCode == 'en' ?  Dimens.padding_16 : 0),
//           child: Transform.rotate(
//             angle: context.locale.languageCode == 'en' ? math.pi : 0, // Rotate by 45 degrees (π/4 radians)
//             child: CustomSvgIcon(color: AppColors.darkColor,
//                 assetName: AppAssets.back, width: 32.w, height: 32.h),
//           ),
//         ),
//       ),
//       actions: actions,
//       leadingWidth:leadingWidth?? 46.w,
//       automaticallyImplyLeading: true,
//     );
//   }
//
//   @override
//   // TODO: implement preferredSize
//   Size get preferredSize => Size(Dimens.width, height??60.h);
// }
//
// class CustomShape extends ContinuousRectangleBorder {
//   @override
//   Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
//     final double radius = 16.r;
//     Path path = Path();
//     path.lineTo(rect.left, rect.top);
//     path.lineTo(rect.right, rect.top);
//     path.lineTo(rect.right, rect.bottom - radius);
//     path.arcToPoint(Offset(rect.right - radius, rect.bottom),
//         radius: Radius.circular(radius));
//     path.lineTo(rect.left + radius, rect.bottom);
//     path.arcToPoint(Offset(rect.left, rect.bottom - radius),
//         radius: Radius.circular(radius), clockwise: true);
//     path.close();
//     return path;
//   }
// }
