import 'package:pronight_vendor/core/extensions/num_extensions.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AppLoader extends StatefulWidget {
  final String? title;
  final double? height;
  final double? width;

  const AppLoader({super.key, this.title, this.height, this.width});
  @override
  _AppLoaderState createState() => _AppLoaderState();
}

class _AppLoaderState extends State<AppLoader> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
         Center(
          child: SizedBox(
              width: 36.w,
              height: 36.w,
              child: CircularProgressIndicator()),
        ),
        SizedBox(height: 20.h),
        Text(widget.title ?? '',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 17.sp, color: Colors.grey))
      ],
    );
  }
}
