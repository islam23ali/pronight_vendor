import 'package:pronight_vendor/core/app_theme/app_colors.dart';
import 'package:pronight_vendor/core/extensions/num_extensions.dart';
import 'package:pronight_vendor/presentations/components/custom_svg/CustomSvgIcon.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppNetworkImage extends StatelessWidget {
  final String? imageUrl;
  final double? borderRadius;
  final double? height;
  final double? width;
  final BoxFit? fit;
  final String? errorImage;

  const AppNetworkImage(
      {super.key,
      this.fit = BoxFit.fitWidth,
      required this.imageUrl,
      this.borderRadius,
      this.height,
      this.width,
      this.errorImage});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius ?? 0),
        child: imageUrl!.contains("svg")
            ? SvgPicture.network(
                imageUrl!,
                placeholderBuilder: (BuildContext context) => Center(
                    child: SizedBox(
                        width: 30.r,
                        height: 30.r,
                        child: const CircularProgressIndicator())),
                width: height,
                height: width,
              )
            : CachedNetworkImage(
                fit: fit,
                imageUrl: imageUrl ?? '',
                placeholder: (context, url) => SpinKitDoubleBounce(
                  color: AppColors.primaryColor,
                  size: 50.r,
                ),
                errorWidget: (context, url, error) =>(errorImage!='')?CustomPngIcon(assetName: errorImage??'',width: width,height: height,fit: fit,): Icon(Icons.error_outline, color: Colors.red,size: 24.sp,),

                /// remove this picture before adding logic from assets for size
              ),
      ),
    );
  }
}
