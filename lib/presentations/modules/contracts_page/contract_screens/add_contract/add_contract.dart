
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pronight_vendor/core/extensions/num_extensions.dart';
import 'package:pronight_vendor/core/resources/app_translate.dart';
import 'package:pronight_vendor/presentations/modules/contracts_page/contract_screens/add_contract/pages/add_contract_page_four/add_contract_page_four.dart';
import 'package:pronight_vendor/presentations/modules/contracts_page/contract_screens/add_contract/pages/add_contract_page_one/add_contract_page_one.dart';
import 'package:pronight_vendor/presentations/modules/contracts_page/contract_screens/add_contract/pages/add_contract_page_three/add_contract_page_three.dart';
import 'package:pronight_vendor/presentations/modules/contracts_page/contract_screens/add_contract/pages/add_contract_page_two/add_contract_page_two.dart';
import 'package:pronight_vendor/presentations/modules/contracts_page/contract_screens/add_contract/widget/custom_add_contract_status.dart';
import 'package:provider/provider.dart';
import '../../../../../core/resources/font_size.dart';
import '../../../../../injection.dart';
import '../../../../components/custom_app_bar/custom_app_bar.dart';
import '../../../../components/custom_scaffold/custom_scaffold.dart';
import 'add_contract_view_model.dart';

class AddContract extends StatefulWidget {
  const AddContract({super.key});

  @override
  State<AddContract> createState() => _AddContractState();
}

class _AddContractState extends State<AddContract> {
AddContractViewModel provider = getIt();
@override
  void initState() {
    super.initState();
WidgetsBinding.instance.addPostFrameCallback((timeStamp){
  provider.initAddContract();
});
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      backgroundColor: const Color(0xffF6FFFA),
      systemNavigationBarColor: const Color(0xffF6FFFA),
      appBar: CustomAppBar(fontWeight: FontWeight.bold,fontSize: AppFonts.font_14,
        title: AppTranslate.addContract.tr(),bgColor: const Color(0xffF6FFFA),statusBarColor: const Color(0xffF6FFFA),height: 64.h,),
      body: Consumer<AddContractViewModel>(
        builder: (context,data,_) {
          return Column(crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
             const CustomAddContractStatus(),
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
                   AddContractPageOne(),
                   AddContractPageTwo(),
                   AddContractPageThree(),
                   AddContractPageFour(),
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
