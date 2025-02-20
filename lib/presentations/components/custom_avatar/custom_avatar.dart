import 'package:cached_network_image/cached_network_image.dart';
import 'package:pronight_vendor/core/app_theme/app_colors.dart';
import 'package:pronight_vendor/core/dimens/dimens.dart';
import 'package:pronight_vendor/core/extensions/num_extensions.dart';
import 'package:pronight_vendor/presentations/components/custom_asset_image/custom_asset_image.dart';
import 'package:flutter/material.dart';

class CustomAvatar extends StatelessWidget {
  final double radius;
  final String? url;
  final double? elevation;
  final Color? borderColor;
  final double? borderWidth;

  const CustomAvatar({super.key, required this.radius, this.url,this.elevation,this.borderColor, this.borderWidth});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: radius,
      height: radius,
      padding: EdgeInsets.all(borderColor!=null?borderWidth??2.w:0),
      decoration: BoxDecoration(color: borderColor??Colors.transparent,borderRadius: BorderRadius.circular(radius/2)),
      child: Container(
        width: radius,
        height: radius,
        decoration:
        BoxDecoration(borderRadius: BorderRadius.circular(radius / 2)),
        child: Card(
          margin: EdgeInsets.zero,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius/2)),
          elevation: elevation ?? 0,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(radius / 2),
            child: url != null ? url!.startsWith('assets')?CustomAssetImage(assetName: url!): CachedNetworkImage(
              imageUrl: url!,
              width: radius,
              height: radius,
              fit: BoxFit.cover,
                placeholder: (context,url){
                  return SizedBox(
                    width: radius/2,
                    height: radius/2,
                    child:  CustomAssetImage(assetName: 'placeholder_avatar',width: radius/2,height: radius/2,),);

                },
                errorWidget: (context,url,error){return SizedBox(
                  width: radius/2,
                  height: radius/2,
                  child:  CustomAssetImage(assetName: 'placeholder_avatar',width: radius/2,height: radius/2,),);}
            ) : Container(
              width: radius,
              height: radius,
              decoration: BoxDecoration(
                  color: AppColors.darkColor,
                  borderRadius: BorderRadius.circular(radius / 2)),
            ),
          ),
        ),
      ),
    );
  }
}
