
import 'package:flutter/material.dart';
import 'package:pronight_vendor/core/dimens/dimens.dart';
import 'package:pronight_vendor/core/extensions/num_extensions.dart';
import 'package:pronight_vendor/presentations/components/images/network_image.dart';
import '../../../../../../../../core/app_theme/app_colors.dart';
import '../../../../../../../core/resources/app_assets.dart';
import '../../../../../../../core/resources/font_size.dart';
import '../../../../../../components/custom_text/custom_text.dart';

class MessageChat extends StatefulWidget {
  const MessageChat({super.key, required this.isMe, required this.message, required this.senderName,required this.senderImage});
  final bool? isMe;
  final String? message;
  final String? senderName;
  final String? senderImage;


  @override
  State<MessageChat> createState() => _MessageChatState();
}

class _MessageChatState extends State<MessageChat> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection:widget.isMe==false? TextDirection.ltr:TextDirection.rtl,
      child: Padding(
        padding:EdgeInsets.all( Dimens.padding_8),
        child: Material(borderRadius: BorderRadius.circular(20.r),
          elevation: 6,color: AppColors.white,
          child: Container(padding: EdgeInsets.all(12.r),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.r),
              color:widget.isMe==false?AppColors.white: AppColors.primaryColor.withAlpha((0.10*255).round())
            ),
          child: Row(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(width: 30.w,height: 30.h,
                child: AppNetworkImage(imageUrl: widget.senderImage??'',width: 28.w,height: 29.w,borderRadius: 100.w,errorImage: AppAssets.splashLogo,),),
              SizedBox(width: 10.w),
              Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(title: widget.senderName,fontSize: AppFonts.font_12,),
                  SizedBox(height: 10.h),
                  SizedBox(width: 270.w,
                    child: CustomText(title: widget.message??'',
                      fontSize: AppFonts.font_11,fontColor: AppColors.textGrayColor),
                  ),
              ],),
            ],
          ),),
        ),
      ),
    );
  }
}
