import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:easy_localization/easy_localization.dart' as el;
import 'package:pronight_vendor/core/dimens/dimens.dart';
import 'package:pronight_vendor/core/extensions/num_extensions.dart';
import 'package:pronight_vendor/core/resources/app_translate.dart';
import 'package:pronight_vendor/presentations/modules/setting_page/screens/messages_screen/chat/widget/message_chat.dart';
import '../../../../../../core/app_theme/app_colors.dart';
import '../../../../../../core/resources/app_assets.dart';
import '../../../../../../core/resources/font_size.dart';
import '../../../../../components/custom_app_bar/custom_app_bar.dart';
import '../../../../../components/custom_scaffold/custom_scaffold.dart';
import '../../../../../components/custom_svg/CustomSvgIcon.dart';
import '../../../../../components/inputs/custom_text_form.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}
TextEditingController controller =TextEditingController();
class _ChatScreenState extends State<ChatScreen> {
  List<Message>messages=[
    Message(senderId: 2,message: 'السلام عليكم',time: '10:00',date: '10/5/2022',type: 'files',duration: '2:00',name: 'محمد أحمد عبدالرحمن',
        latitude: 0,longitude: 0,file: 'https://cdn.pixabay.com/photo/2018/01/14/23/12/nature-3082832__340.jpg'),
    Message(senderId: 1,message: 'السلام عليكم ورحمة الله وبركاته أستاذ أحمد محمد أرجو الموافقة على طلب اجازة وذلك يوم الثلاثاء الموافق يوم 23/7/2024',
        time: '10:00',date: '10/5/2022',type: 'files',duration: '2:00',name: 'محمد أحمد عبدالرحمن',
        latitude: 0,longitude: 0,file: 'https://cdn.pixabay.com/photo/2018/01/14/23/12/nature-3082832__340.jpg')
  ];
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: CustomAppBar(height: 64.h,fontSize: AppFonts.font_14,fontWeight: FontWeight.bold,title: AppTranslate.messages.tr(),),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(12.r),
              child:
              ListView.builder(
                itemCount: messages.length,
                  shrinkWrap: true,
                  itemBuilder: (context,index){
                  return
                    MessageChat(
                      isMe:messages[index].senderId==1?true : false,
                      message:  messages[index].message??'',
                      senderName: messages[index].name,
                      senderImage: messages[index].file,
                    );
                }),),
          ),
          Container(color: AppColors.white,
            padding: EdgeInsets.symmetric(horizontal:Dimens.padding_24,vertical: Dimens.padding_16),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomTextFormField(height: 40.h,width: 230.w,
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  underLineColor: Colors.transparent,
                  suffix: InkWell(
                    onTap: (){},
                    child:const CustomSvgIcon(assetName: AppAssets.sendMessage),
                  ),hint: '',
                  controller: controller,bgColor: AppColors.gray.withAlpha((0.40*255).round()),borderRaduis: 25.r,),
                Material(borderRadius: BorderRadius.circular(100.r),color: AppColors.white,
                    elevation: 1,
                    child: CustomSvgIcon(assetName: AppAssets.mic,width: 35.w,height: 35.h)),
                Material(borderRadius: BorderRadius.circular(100.r),color: AppColors.white,
                    elevation: 1,
                    child: CustomSvgIcon(assetName: AppAssets.smile,width: 35.w,height: 35.h,))
              ],
            ),)
        ],
      ),);
  }
}
class Message {
  int? senderId;
  int? roomId;
  String? msgType;
  String? date;
  String? time;
  String? duration;
  String? message;
  String? file;
  String? ext;
  String? type;
  String? name;
  String? size;
  dynamic latitude;
  dynamic longitude;

  Message({
    this.senderId,
    this.roomId,
    this.msgType,
    this.date,
    this.time,
    this.duration,
    this.message,
    this.file,
    this.ext,
    this.type,
    this.name,
    this.size,
    this.latitude,
    this.longitude,
  });

  factory Message.fromJson(Map<String, dynamic> json) => Message(
    senderId: json["sender_id"],
    roomId: json["room_id"],
    msgType: json["msg_type"],
    date: json["date"],
    time: json["time"],
    duration: json["duration"],
    message: json["message"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    file: json["file"],
    ext: json["ext"],
    type: json["type"],
    name: json["name"],
    size: json["size"],
  );

  Map<String, dynamic> toJson() => {
    "sender_id": senderId,
    "room_id": roomId,
    "msg_type": msgType,
    "date": date,
    "time": time,
    "duration": duration,
    "message": message,
    "latitude": latitude,
    "longitude": longitude,
    "file": file,
    "ext": ext,
    "type": type,
    "name": name,
    "size": size,
  };
}