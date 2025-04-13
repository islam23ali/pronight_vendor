import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:pronight_vendor/core/extensions/num_extensions.dart';

import '../../../../../../core/app_theme/app_colors.dart';


class ZoomableImage extends StatelessWidget {
  final String image;

  const ZoomableImage({super.key, required this.image});
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.transparent,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 80.h,horizontal: 16.w),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(onTap: (){
              Navigator.pop(context);
            },child: Icon(Icons.close,size: 30.r,color: AppColors.blackColor,)),
            SizedBox(height: 500,
              child: PhotoView(
                imageProvider: NetworkImage(image),
                minScale: PhotoViewComputedScale.contained,
                maxScale: PhotoViewComputedScale.covered * 2.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}