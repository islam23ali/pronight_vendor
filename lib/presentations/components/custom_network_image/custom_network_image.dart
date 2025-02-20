import 'package:pronight_vendor/core/extensions/num_extensions.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:pronight_vendor/core/app_theme/app_colors.dart';
import 'package:pronight_vendor/presentations/components/custom_asset_image/custom_asset_image.dart';
import 'package:flutter/material.dart';

import '../../../core/resources/app_assets.dart';

class CustomNetworkImage extends StatelessWidget {
  final double? width;
  final double? height;
  final String? url;
  final BoxFit? boxFit;

  const CustomNetworkImage({super.key,required this.url,this.width,this.height,this.boxFit});

  @override
  Widget build(BuildContext context) {
    return url!=null?
    CachedNetworkImage(imageUrl: url!,width: width,height: height,fit: boxFit??BoxFit.cover,
      placeholder: (context,url){
      return Center(

        child:  Icon(Icons.error,size: 18.sp,),);},

      errorWidget: (context,url,error){return Center(

        child:  Icon(Icons.error,size: 18.sp,),);},)

        :Container(
      width: width,
      height: height,
      color: AppColors.darkColor,);
  }
}
