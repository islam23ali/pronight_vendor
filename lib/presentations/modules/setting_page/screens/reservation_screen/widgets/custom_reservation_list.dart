import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../../../../../../core/dimens/dimens.dart';
import 'custom_reservation_item.dart';

class CustomReservationList extends StatefulWidget {
  const CustomReservationList({super.key, required this.isNew});
final bool isNew;
  @override
  State<CustomReservationList> createState() => _CustomReservationListState();
}

class _CustomReservationListState extends State<CustomReservationList> {
  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: ListView.builder(
          padding: EdgeInsets.symmetric(vertical: Dimens.padding_12v,horizontal: Dimens.padding_16h),
          shrinkWrap: true,
          itemCount: 10,
          itemBuilder: (context, index) {
            return AnimationConfiguration.staggeredGrid(
                duration:const Duration(milliseconds: 900),
                position: index,
                columnCount: 1,
                child: ScaleAnimation(
                    duration:const Duration(milliseconds: 1000),
                    curve: Curves.fastLinearToSlowEaseIn,
                    child: FadeInAnimation(child:
                    CustomReservationItem(isNew: widget.isNew,)
                    )));
          }),
    );
  }
}
