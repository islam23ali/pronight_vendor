import 'package:pronight_vendor/core/app_theme/app_colors.dart';
import 'package:flutter/material.dart';
import '../../../core/utils/preferences.dart';
import 'love_animation_widget.dart';

class LoveIcon extends StatefulWidget {
  final VoidCallback onPress;
  bool isLiked;
  LoveIcon({super.key,required this.isLiked, required this.onPress});


  @override
  State<LoveIcon> createState() => _LoveIconState();
}

class _LoveIconState extends State<LoveIcon> {
  @override
  Widget build(BuildContext context) {
    return LoveAnimationWidget(
      isAnimated: widget.isLiked,
      duration: const Duration(milliseconds: 150),
      alwayesAnimate: true,
      child: SizedBox(
        width: 24,
        height: 24,
        child: IconButton(
            alignment: Alignment.center,
            padding: EdgeInsets.zero,
            onPressed: (){

              Preferences preference = Preferences();
             /* UserModel? userModel = preference.getUserData();
              if(userModel!=null){
                if(mounted){
                  widget.onPress();
                }
              }else{
                CustomDialog.showAlerNotLogin();
              }*/

        }, icon: Icon(widget.isLiked?Icons.favorite_rounded:Icons.favorite_outline_rounded,color: widget.isLiked?AppColors.primaryColor:AppColors.darkColor,)),
      ),
    );
  }
}
