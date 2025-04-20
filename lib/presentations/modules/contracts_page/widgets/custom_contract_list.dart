import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:pronight_vendor/core/screen_state/no_data.dart';
import 'package:pronight_vendor/presentations/modules/contracts_page/contracts_view_model.dart';
import 'package:provider/provider.dart';
import '../../../../core/dimens/dimens.dart';
import '../../../app_loader.dart';
import 'custom_contract_item.dart';

class CustomContractList extends StatefulWidget {
  const CustomContractList({super.key});

  @override
  State<CustomContractList> createState() => _CustomContractListState();
}

class _CustomContractListState extends State<CustomContractList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ContractViewModel>(
      builder: (context,data,_) {
        return data.isLoading?const Center(child: AppLoader()):
        data.allContractsModel?.data?.isEmpty==true?const NoDataScreen():
        AnimationLimiter(
          child: ListView.builder(
              padding: EdgeInsets.symmetric(vertical: Dimens.padding_12v),
              shrinkWrap: true,
              itemCount: data.allContractsList?.length,
              itemBuilder: (context, index) {
                return AnimationConfiguration.staggeredGrid(
                    duration:const Duration(milliseconds: 900),
                    position: index,
                    columnCount: 1,
                    child: ScaleAnimation(
                        duration:const Duration(milliseconds: 1000),
                        curve: Curves.fastLinearToSlowEaseIn,
                        child: FadeInAnimation(child:
                        CustomContractItem(model: data.allContractsList?[index])
                        )));
              }),
        );
      }
    );
  }
}
