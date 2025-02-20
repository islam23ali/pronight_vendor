
import 'package:pronight_vendor/core/extensions/num_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../core/app_theme/app_colors.dart';


class RateWidget extends StatefulWidget {
  final num? initialRating;
  final ValueChanged<double>? onRatingUpdate;
  final bool ignoreGestures;
  final double iconSize;
  final double? itemSize;

  const RateWidget({super.key,this.initialRating,this.onRatingUpdate,this.ignoreGestures = true,this.iconSize = 15, this.itemSize});

  @override
  State<RateWidget> createState() => _RateWidgetState();
}

class _RateWidgetState extends State<RateWidget> {
  @override
  Widget build(BuildContext context) {

    return RatingBar.builder(

      itemSize: widget.itemSize??24.r,
      initialRating:(widget.initialRating?? 0).toDouble(),
      ignoreGestures: widget.ignoreGestures,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      unratedColor: AppColors.darkColor,
      itemPadding: const EdgeInsets.symmetric(horizontal: 0.0),
      itemBuilder: (context, _) => Icon(
        Icons.star_rounded,
        color: Colors.amber,
        size: widget.iconSize,
      ),
      onRatingUpdate:widget.onRatingUpdate??(rate){
        // Provider.of<MyOrdersViewModel>(context, listen: false).rate=rate;
      },
      // onRatingUpdate: (rating) {
      //   print(rating);
      // },
    );

  }
}