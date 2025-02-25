import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../../../../core/dimens/dimens.dart';
import 'custom_contract_item.dart';

class CustomContractList extends StatefulWidget {
  const CustomContractList({super.key});

  @override
  State<CustomContractList> createState() => _CustomContractListState();
}

class _CustomContractListState extends State<CustomContractList> {
  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: ListView.builder(
          padding: EdgeInsets.symmetric(vertical: Dimens.padding_12v),
          shrinkWrap: true,
          itemCount: 10,
          itemBuilder: (context, index) {
            return AnimationConfiguration.staggeredGrid(
                duration:const Duration(milliseconds: 900),
                position: index,
                columnCount: 1,
                child:const ScaleAnimation(
                    duration:const Duration(milliseconds: 1000),
                    curve: Curves.fastLinearToSlowEaseIn,
                    child: FadeInAnimation(child:
                    CustomContractItem()
                    )));
          }),
    );
  }
}
