import 'package:pronight_vendor/core/dimens/dimens.dart';
import 'package:pronight_vendor/core/extensions/num_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomSvgIcon extends StatelessWidget {
  final String assetName;
  final double? width;
  final double? height;
  final Color? color;

  const CustomSvgIcon({super.key,required this.assetName,this.width,this.height,this.color});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset('assets/images/svg/$assetName.svg',width: width??20.w,height: height??20.w,color: color,);
  }
}

class CustomPngIcon extends StatelessWidget {
  final String assetName;
  final double? width;
  final double? height;
  final Color? color;
  final BoxFit? fit;

  const CustomPngIcon({super.key,required this.assetName,this.width,this.height,this.color, this.fit});

  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/images/icons/$assetName.png',width: width??20.w,height: height??20.w,color: color,fit: fit,);
  }
}
