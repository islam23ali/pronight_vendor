//
// import 'dart:io';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:pronight_vendor/data/datasource/local/LocalUserData.dart';
//
//
// import '../../injection.dart';
// import '../navigator/navigator.dart';
//
// class NotificationServices {
//   FirebaseMessaging messaging = FirebaseMessaging.instance ;
//   LocalUserData saveUserData =getIt();
//   final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin  = FlutterLocalNotificationsPlugin();
//   void init(BuildContext context)async{
//     requestNotificationPermission();
//     requestPermission();
//     forgroundMessage();
//     firebaseInit(context);
//     setupInteractMessage(context);
//   }
//   void initLocalNotifications(BuildContext context, RemoteMessage message)async{
//     var androidInitializationSettings = const AndroidInitializationSettings('@mipmap/ic_launcher');
//     var iosInitializationSettings = const DarwinInitializationSettings();
//
//     var initializationSetting = InitializationSettings(
//         android: androidInitializationSettings ,
//         iOS: iosInitializationSettings
//     );
//
//     await _flutterLocalNotificationsPlugin.initialize(
//         initializationSetting,
//       onDidReceiveNotificationResponse: (payload){
//           // handle interaction when app is active for android
//           handleMessage(context, message);
//       }
//     );
//   }
//
//   void firebaseInit(BuildContext context){
//     FirebaseMessaging.onMessage.listen((message) {
//
//       RemoteNotification? notification = message.notification ;
//       AndroidNotification? android = message.notification?.android ;
//       setFCMDataInApp(message,context);
//
//       if(Platform.isIOS){
//         print("lllllllllrrrrrrrr");
//         forgroundMessage();
//       }
//
//       if(Platform.isAndroid){
//         initLocalNotifications(context, message);
//         showNotification(message);
//       }
//
//       if (kDebugMode) {
//         print("notifications title:${notification?.title}");
//         print("notifications body:${notification?.body}");
//         print('count:${android?.count}');
//         print('data:${message.data.toString()}');
//       }
//
//     });
//   }
//
//   setFCMDataInApp(RemoteMessage message,BuildContext context){
//     /// set data in for ground
//     // var notiType = message.data["notification_type"].toString();
//     // Provider.of<NotificationViewModel>(context,listen: false).getNotifications();
//     // if(notiType=='order'){
//     //   Provider.of<HomeViewModel>(context,listen: false).homeDetails();
//     //   Provider.of<OrdersViewModel>(context,listen: false).initHome();
//     //   Provider.of<OrderDetailsViewModel>(context,listen: false).orderDetails(message.data['order_id']);
//     // }else if(notiType=='wallet'){
//     //   Provider.of<WalletViewModel>(context,listen: false).wallet();
//     // }else if(notiType=='rate'){
//     //   Provider.of<HomeViewModel>(context,listen: false).homeDetails();
//     // }else if(notiType=='chat'){
//     //   Provider.of<RoomDetailsViewModel>(context,listen: false).getChatMessages(message.data["room_id"].toString());
//     // }
//   }
//
//   void requestNotificationPermission() async {
//     NotificationSettings settings = await messaging.requestPermission(
//         alert: true,
//         announcement: true,
//         badge: true,
//         carPlay: true,
//         criticalAlert: true,
//         provisional: true,
//         sound: true ,
//     );
//
//     if (settings.authorizationStatus == AuthorizationStatus.authorized) {
//       if (kDebugMode) {
//         print('user granted permission');
//       }
//     } else if (settings.authorizationStatus ==
//         AuthorizationStatus.provisional) {
//       if (kDebugMode) {
//         print('user granted provisional permission');
//       }
//     } else {
//       //appsetting.AppSettings.openNotificationSettings();
//       if (kDebugMode) {
//         print('user denied permission');
//       }
//     }
//   }
//
//   Future<Map<Permission, PermissionStatus>> requestPermission() async {
//     /// this other Permission for ios
//     Map<Permission, PermissionStatus> statuses = await [
//       Permission.notification
//     ].request();
//     return statuses;
//   }
//
//   Future<void> showNotification(RemoteMessage message)async{
//
//     AndroidNotificationChannel channel = AndroidNotificationChannel(
//         message.notification?.android?.channelId.toString()??'',
//       message.notification?.android?.channelId.toString()??'' ,
//       importance: Importance.max  ,
//       showBadge: true ,
//       playSound: true,
//       // sound: const RawResourceAndroidNotificationSound('jetsons_doorbell')
//       sound: null
//     );
//
//      AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails(
//       channel.id.toString(),
//       channel.name.toString() ,
//       channelDescription: 'your channel description',
//       importance: Importance.high,
//       priority: Priority.high ,
//       playSound: true,
//       ticker: 'ticker' ,
//          sound: channel.sound
//     //     sound: RawResourceAndroidNotificationSound('jetsons_doorbell')
//     //  icon: largeIconPath
//     );
//
//     const DarwinNotificationDetails darwinNotificationDetails = DarwinNotificationDetails(
//       presentAlert: true ,
//       presentBadge: true ,
//       presentSound: true
//     ) ;
//
//     NotificationDetails notificationDetails = NotificationDetails(
//       android: androidNotificationDetails,
//       iOS: darwinNotificationDetails
//     );
//
//     Future.delayed(Duration.zero , (){
//       _flutterLocalNotificationsPlugin.show(0,
//           message.notification?.title.toString(),
//           message.notification?.body.toString(),
//           notificationDetails ,
//       );
//     });
//
//   }
//
//   Future<String> getDeviceToken() async {
//     String? token = await messaging.getToken();
//     return token ?? "";
//   }
//
//   // void isTokenRefresh()async{
//   //   messaging.onTokenRefresh.listen((event) {
//   //     event.toString();
//   //     if (kDebugMode) {
//   //       print('refresh');
//   //     }
//   //   });
//   // }
//
//   Future<void> setupInteractMessage(BuildContext context)async{
//
//     // when app is terminated
//     RemoteMessage? initialMessage = await FirebaseMessaging.instance.getInitialMessage();
//
//     if(initialMessage != null){
//       handleMessage(context, initialMessage);
//     }
//
//
//     //when app ins background
//     FirebaseMessaging.onMessageOpenedApp.listen((event) {
//       handleMessage(context, event);
//     });
//
//   }
//
//   ///handel adar if terminated or background
//   void handleMessage(BuildContext context, RemoteMessage message) {
//
//     print("message.data--------oo0--------${message.data.toString()}");
//
//     var notiType = message.data["notification_type"].toString();
//     // Provider.of<NotificationViewModel>(context,listen: false).getNotifications();
//     // if (notiType == 'order') {
//     //   print('notification payload333: ${message.data}');
//     //   Provider.of<HomeViewModel>(context,listen: false).homeDetails();
//     //   Provider.of<OrdersViewModel>(context,listen: false).initHome();
//     //   if(context.read<OrderDetailsViewModel>().orderId!=null){
//     //     NavigatorHandler.pushReplacement( OrderDetailsScreen(orderId: message.data['order_id']));
//     //   }else{
//     //     NavigatorHandler.push( OrderDetailsScreen(orderId: message.data['order_id']));
//     //   }
//     // }else if(notiType == 'rate'){
//     //   Provider.of<HomeViewModel>(context,listen: false).homeDetails();
//     // }else if(notiType == 'wallet'){
//     //   NavigatorHandler.push(const WalletScreen());
//     // }else if(notiType == 'chat'){
//     //   if(context.read<RoomDetailsViewModel>().chatId!=null){
//     //     NavigatorHandler.pushReplacement(RoomDetailsScreen(ordersDetailsModel:
//     //     OrdersDetailsModel(
//     //       data: OneOrderModel(
//     //         id:int.tryParse(message.data['order_id'])??0,
//     //         chat: Chat(
//     //           id:int.tryParse(message.data['room_id'])??0,
//     //         ),
//     //         admin: Admin(
//     //           id:int.tryParse(message.data['admin_id'])??0,
//     //           name: message.data['admin_name'],
//     //           image: message.data['admin_image'],
//     //           phone: message.data['admin_phone'],
//     //         ),
//     //         client: Client(
//     //           id:saveUserData.getUserData()?.data?.id,
//     //           name:saveUserData.getUserData()?.data?.name,
//     //           image:saveUserData.getUserData()?.data?.image,
//     //         ),
//     //       )
//     //     ),));
//     //   }else{
//     //     NavigatorHandler.push(RoomDetailsScreen(ordersDetailsModel: OrdersDetailsModel(
//     //         data: OneOrderModel(
//     //           id:int.tryParse(message.data['order_id'])??0,
//     //           chat: Chat(
//     //             id:int.tryParse(message.data['room_id'])??0,
//     //           ),
//     //           admin: Admin(
//     //             id:int.tryParse(message.data['admin_id'])??0,
//     //             name: message.data['admin_name'],
//     //             image: message.data['admin_image'],
//     //             phone: message.data['admin_phone'],
//     //           ),
//     //           client: Client(
//     //             id:saveUserData.getUserData()?.data?.id,
//     //             name:saveUserData.getUserData()?.data?.name,
//     //             image:saveUserData.getUserData()?.data?.image,
//     //           ),
//     //         )
//     //     ),));
//     //   }
//     // }
//   }
//
//
//   Future forgroundMessage() async {
//     await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
//       alert: true,
//       badge: true,
//       sound: true,
//
//     );
//   }
// }