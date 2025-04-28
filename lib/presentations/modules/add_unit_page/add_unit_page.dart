
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pronight_vendor/core/extensions/num_extensions.dart';
import 'package:pronight_vendor/core/resources/app_translate.dart';
import 'package:pronight_vendor/presentations/modules/add_unit_page/pages/add_unit_page_four/add_unit_page_four.dart';
import 'package:pronight_vendor/presentations/modules/add_unit_page/pages/add_unit_page_one/add_unit_page_one.dart';
import 'package:pronight_vendor/presentations/modules/add_unit_page/pages/add_unit_page_three/add_unit_page_three.dart';
import 'package:pronight_vendor/presentations/modules/add_unit_page/pages/add_unit_page_two/add_unit_page_two.dart';
import 'package:pronight_vendor/presentations/modules/add_unit_page/widget/custom_add_unit_status.dart';
import 'package:provider/provider.dart';
import '../../../../../core/resources/font_size.dart';
import '../../../injection.dart';
import '../../components/custom_app_bar/custom_app_bar.dart';
import '../../components/custom_scaffold/custom_scaffold.dart';
import 'add_unit_view_model.dart';

class AddUnit extends StatefulWidget {
  const AddUnit({super.key});

  @override
  State<AddUnit> createState() => _AddUnitState();
}

class _AddUnitState extends State<AddUnit> {
  AddUnitViewModel provider = getIt();
  @override
  void initState() {
    super.initState();
    provider.initAddUnit();
  }
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      backgroundColor: const Color(0xffF6FFFA),
      systemNavigationBarColor: const Color(0xffF6FFFA),
      appBar: CustomAppBar(fontWeight: FontWeight.bold,fontSize: AppFonts.font_14,
        title: AppTranslate.addUnit.tr(),bgColor: const Color(0xffF6FFFA),statusBarColor: const Color(0xffF6FFFA),height: 64.h,),
      body: Consumer<AddUnitViewModel>(
          builder: (context,data,_) {
            return Column(crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const CustomAddUnitStatus(),
                SizedBox(height: 10.h),
                Expanded(
                  child: PageView(
                    physics:const NeverScrollableScrollPhysics(),
                      controller: data.pageController,
                      onPageChanged: (index) {
                        setState(() {
                          data.currentPage = index;
                          data.refreshData();
                        });
                      },children:const [
                    AddUnitPageOne(),
                    AddUnitPageTwo(),
                    AddUnitPageThree(),
                    AddUnitPageFour(),
                  ]
                  ),
                ),
              ],
            );
          }
      ),
    );
  }
}
