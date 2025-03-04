import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../../../../core/dimens/dimens.dart';
import 'custom_visit_permits_item.dart';

class CustomVisitPermitsList extends StatefulWidget {
  const CustomVisitPermitsList({super.key});

  @override
  State<CustomVisitPermitsList> createState() => _CustomVisitPermitsListState();
}

class _CustomVisitPermitsListState extends State<CustomVisitPermitsList> {
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
                    duration: Duration(milliseconds: 1000),
                    curve: Curves.fastLinearToSlowEaseIn,
                    child: FadeInAnimation(child:
                    CustomVisitPermitsItem()
                    )));
          }),
    );
  }
}
