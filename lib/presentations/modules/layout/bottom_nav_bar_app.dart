import 'dart:async';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pronight_vendor/core/extensions/num_extensions.dart';
import 'package:pronight_vendor/presentations/components/custom_svg/CustomSvgIcon.dart';
import '../../../../core/resources/app_assets.dart';
import '../../../core/app_theme/app_colors.dart';
import '../contracts_page/contracts_page.dart';
import '../home_page/home_page.dart';
import '../setting_page/setting_page.dart';
import '../units_page/units_page.dart';


class BottomNavBar extends StatefulWidget {
  BottomNavBar({Key? key,required this.bottomNavIndex}) : super(key: key);
  int bottomNavIndex;


  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> with TickerProviderStateMixin {
  // final autoSizeGroup = AutoSizeGroup();
  // var _bottomNavIndex = widget.bottomNavIndex??0; //default index of a first screen

  late AnimationController _fabAnimationController;
  late AnimationController _borderRadiusAnimationController;
  late Animation<double> fabAnimation;
  late Animation<double> borderRadiusAnimation;
  late CurvedAnimation fabCurve;
  late CurvedAnimation borderRadiusCurve;
  late AnimationController _hideBottomBarAnimationController;

  final iconList = <String>[
    AppAssets.selectedHome,
    AppAssets.selectedFiles,
    AppAssets.selectedItem,
    AppAssets.selectedSetting,
  ];
  final iconListUn = <String>[
    AppAssets.unSelectedHome,
    AppAssets.unSelectedFiles,
    AppAssets.unSelectedItem,
    AppAssets.unSelectedSetting,
  ];
  final widgetList = <Widget>[
   const HomePage(),
   const ContractsPage(),
   const UnitsPage(),
   const SettingPage()
  ];

  @override
  void initState() {
    super.initState();

    _fabAnimationController = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    );
    _borderRadiusAnimationController = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    );
    fabCurve = CurvedAnimation(
      parent: _fabAnimationController,
      curve: Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
    );
    borderRadiusCurve = CurvedAnimation(
      parent: _borderRadiusAnimationController,
      curve: Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
    );

    fabAnimation = Tween<double>(begin: 0, end: 1).animate(fabCurve);
    borderRadiusAnimation = Tween<double>(begin: 0, end: 1).animate(
      borderRadiusCurve,
    );

    _hideBottomBarAnimationController = AnimationController(
      duration: Duration(milliseconds: 200),
      vsync: this,
    );

    Future.delayed(
      Duration(seconds: 1),
          () => _fabAnimationController.forward(),
    );
    Future.delayed(
      Duration(seconds: 1),
          () => _borderRadiusAnimationController.forward(),
    );
  }

  bool onScrollNotification(ScrollNotification notification) {
    if (notification is UserScrollNotification &&
        notification.metrics.axis == Axis.vertical) {
      switch (notification.direction) {
        case ScrollDirection.forward:
          _hideBottomBarAnimationController.reverse();
          _fabAnimationController.forward(from: 0);
          break;
        case ScrollDirection.reverse:
          _hideBottomBarAnimationController.forward();
          _fabAnimationController.reverse(from: 1);
          break;
        case ScrollDirection.idle:
          break;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar:CustomAppBar(height: 0,bgColor: AppColors.bgHomeColor,statusBarColor: AppColors.bgHomeColor,topColor: AppColors.bgHomeColor,),
      extendBody: true,
      body: SafeArea(
        child: NotificationListener<ScrollNotification>(
          onNotification: onScrollNotification,
          child: widgetList[widget.bottomNavIndex],
        ),
      ),
      floatingActionButton: SizedBox(height: 65.h,
        width: 65.w,
        child: FloatingActionButton(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          backgroundColor:Colors.transparent,
          elevation: 0,
          child: Container(
              height: 65.h,
              width: 65.w,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primaryColor),
              child: SizedBox(width: 40.w,height: 40.h,
                  child: Icon(Icons.add_rounded,size: 36.w,color: AppColors.white,))),
          onPressed: () {
            // _fabAnimationController.reset();
            // _borderRadiusAnimationController.reset();
            // _borderRadiusAnimationController.forward();
            // _fabAnimationController.forward();
            // push(MainScreen());
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
        itemCount: iconList.length,
        tabBuilder: (int index, bool isActive) {
          final color =isActive
              ? AppColors.primaryColor
              : AppColors.gray;
          return Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomSvgIcon(assetName:
                (!isActive)? iconListUn[index]: iconList[index],
                width: 23.w,
                height: 23.w,
                color: color,
              ),
              // SizedBox(height: 4.h),
              // Padding(
              //   padding: EdgeInsets.symmetric(horizontal: 8.w),
              //   child: CustomText(title:(index==0)?
              //   AppTranslate.app_name.tr():AppTranslate.app_name.tr(),)
              // )
            ],
          );
        },
        backgroundColor:AppColors.white,
        activeIndex: widget.bottomNavIndex,
        splashColor: AppColors.primaryColor,
        notchAndCornersAnimation: borderRadiusAnimation,
        splashSpeedInMilliseconds: 300,
        notchSmoothness: NotchSmoothness.softEdge,
        gapLocation: GapLocation.center,
        leftCornerRadius: 0,
        rightCornerRadius: 0,
        onTap: (index) => setState(() => widget.bottomNavIndex = index),
        hideAnimationController: _hideBottomBarAnimationController,
        shadow: BoxShadow(
          offset: Offset(0, 1),
          blurRadius: 20,
          spreadRadius: 0.5,
          color: Colors.white,
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:sportofy/core/extensions/num_extensions.dart';
// import 'package:sportofy/core/res/text_styles.dart';
// import '../../../core/resources/app_assets.dart';
// import '../../../core/resources/app_colors.dart';
// import '../../component/svg_icon.dart';
// import '../home/home.dart';
// import '../my_bookings/my_bookings.dart';

// class BottomNavigationBarApp extends StatefulWidget {
//   const BottomNavigationBarApp( this.selectIndex,{super.key});
//   final int? selectIndex;
//   @override
//   State<BottomNavigationBarApp> createState() =>
//       _BottomNavigationBar();
// }
//
// GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//
// void openDrawer() {
//   _scaffoldKey.currentState!.openDrawer();}
//
//
// class _BottomNavigationBar extends State<BottomNavigationBarApp> {
//
//   int _selectedIndex = 0;
//   static const TextStyle optionStyle =
//   TextStyle();
//   static  final List<Widget> _widgetOptions = <Widget>[
//     Home(),
//
//     MyBookings(),
//   ];
//
//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }
//   @override
//   void initState() {
//     super.initState();
//     if(widget.selectIndex != null){
//       _selectedIndex = widget.selectIndex!;
//     }
//   }
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: GestureDetector( onTap: () {FocusScope.of(context).requestFocus(FocusNode());},///to remove keyboard outside textField
//         child: Scaffold(
//           key: _scaffoldKey,
//           // drawer:const CustomDrawer(),
//           body: Center(
//             child: _widgetOptions.elementAt(_selectedIndex),
//           ),
//           bottomNavigationBar: BottomNavigationBar(
//
//             unselectedLabelStyle: TextStyles().getTitleStyle(fontSize: 13.sp).customColor(AppColors.textColor),
//             selectedLabelStyle: TextStyles().getTitleStyle(fontSize: 13.sp).customColor(AppColors.primaryColor),
//             backgroundColor: AppColors.white,
//             elevation: 24,
//             items: const <BottomNavigationBarItem>[
//               BottomNavigationBarItem(
//                 icon: SVGIcon(Assets.unSelectHome,color: Colors.grey,),
//                 activeIcon: SVGIcon(Assets.homeSelected,),
//                 label: 'الرئيسية',
//               ),
//               BottomNavigationBarItem(
//                 icon: SVGIcon(Assets.unSelectedBooking,color: Colors.grey,),
//                 activeIcon: SVGIcon(Assets.selectedBooking,),
//                 label: 'حجوزاتي',
//               ),
//             ],
//             currentIndex: _selectedIndex,
//             // selectedItemColor: _selectedIndex == 1 ? Colors.black : const Color(0xffE5C67D),
//             onTap: _onItemTapped,
//           ),
//         ),
//       ),
//     );
//   }
// }