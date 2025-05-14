import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import '../../data/datasource/local/LocalUserData.dart';
import '../../injection.dart';
import '../../presentations/modules/notification_screen/notification_view_model.dart';

class NotificationServices {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  LocalUserData saveUserData = getIt();
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  void init(BuildContext context) async {
    requestNotificationPermission();
    requestPermission();
    forgroundMessage();
    firebaseInit(context);
    setupInteractMessage(context);
  }

  void initLocalNotifications(
      BuildContext context, RemoteMessage message) async {
    var androidInitializationSettings =
    const AndroidInitializationSettings('@mipmap/ic_launcher');
    var iosInitializationSettings = const DarwinInitializationSettings();

    var initializationSetting = InitializationSettings(
        android: androidInitializationSettings, iOS: iosInitializationSettings);

    await _flutterLocalNotificationsPlugin.initialize(initializationSetting,
        onDidReceiveNotificationResponse: (payload) {
          // handle interaction when app is active for android
          handleMessage(context, message);
        });
  }

  void firebaseInit(BuildContext context) {
    FirebaseMessaging.onMessage.listen((message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      setFCMDataInApp(message, context);

      if (Platform.isIOS) {
        print("lllllllllrrrrrrrr");
        forgroundMessage();
      }

      if (Platform.isAndroid) {
        initLocalNotifications(context, message);
        showNotification(message);
      }

      if (kDebugMode) {
        print("notifications title:${notification?.title}");
        print("notifications body:${notification?.body}");
        print('count:${android?.count}');
        print('data:${message.data.toString()}');
      }
    });
  }

  setFCMDataInApp(RemoteMessage message, BuildContext context) {
    /// set data in for ground
    if (message.data["notification_type"] != 'account_blocked') {
      Provider.of<NotificationsViewModel>(context, listen: false).initNotifications();
      // Provider.of<NotificationsViewModel>(context, listen: false).getNotificationCount();
    }
    // if (message.data["mes_type"] == 'text'||message.data["mes_type"] == 'voice'||message.data["mes_type"] == 'image') {
    //   print('notification payload333:1 ${message.data}');
    //   print('notification payload333:1 ${Provider.of<RoomViewModel>(context, listen: false).messageList.length}');
    //   Provider.of<RoomViewModel>(context, listen: false).messageList.insert(0,LastMessage(
    //     // id:int.tryParse(message.data['room_id']),
    //     chatRoomId:int.tryParse(message.data['room_id']),
    //     receiverId:int.tryParse(message.data['to_user_id']),
    //     // receiver:message.data['to_user_table'],
    //     senderId:int.tryParse(message.data['form_user_id']),
    //     message:message.data['message'],
    //     type:message.data['mes_type'] ,
    //     // reply:message.data['mes_type'] ,
    //     // voiceTime:message.data['mes_type'] ,
    //     file:message.data['file'],
    //     // isRead:message.data['file'],
    //     date:message.data['date'],
    //     time:message.data['time'] ,
    //     // createdAt:message.data['time']
    //   ));
    //   print('notification payload333:1 ${Provider.of<RoomViewModel>(context, listen: false).messageList.length}');
    //
    //   Provider.of<RoomViewModel>(context, listen: false).update();
    //
    //
    //
    //   // Provider.of<RoomViewModel>(context, listen: false)
    //   //     .getRoom(int.tryParse(message.data['room_id']) ?? 0,fromFirebase:true);
    // }
    // else if (message.data["notification_type"] == 'admin_message') {
    // }
    // else if (message.data["notification_type"] == 'account_blocked') {
    //   getIt<LocalUserData>().clearUserData();
    //   NavigatorHandler.pushAndRemoveUntil(const Login());
    //
    // }
    // else if (message.data["notification_type"] == 'verification_update') {
    //   Provider.of<ProfileViewModel>(context, listen: false).getProfile();
    // }
  }

  void requestNotificationPermission() async {
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: true,
      criticalAlert: true,
      provisional: true,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      if (kDebugMode) {
        print('user granted permission');
      }
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      if (kDebugMode) {
        print('user granted provisional permission');
      }
    } else {
      // appsetting.AppSettings.openNotificationSettings();
      if (kDebugMode) {
        print('user denied permission');
      }
    }
  }

  Future<Map<Permission, PermissionStatus>> requestPermission() async {
    /// this other Permission for ios
    Map<Permission, PermissionStatus> statuses =
    await [Permission.notification].request();
    return statuses;
  }

  Future<void> showNotification(RemoteMessage message) async {
    AndroidNotificationChannel channel = AndroidNotificationChannel(
        message.notification?.android?.channelId.toString() ?? '',
        message.notification?.android?.channelId.toString() ?? '',
        importance: Importance.max,
        showBadge: true,
        playSound: true,
        // sound: const RawResourceAndroidNotificationSound('jetsons_doorbell')
        sound: null);

    AndroidNotificationDetails androidNotificationDetails =
    AndroidNotificationDetails(
        channel.id.toString(), channel.name.toString(),
        channelDescription: 'your channel description',
        importance: Importance.high,
        priority: Priority.high,
        playSound: true,
        ticker: 'ticker',
        sound: channel.sound
      //     sound: RawResourceAndroidNotificationSound('jetsons_doorbell')
      //  icon: largeIconPath
    );

    const DarwinNotificationDetails darwinNotificationDetails =
    DarwinNotificationDetails(
        presentAlert: true, presentBadge: true, presentSound: true);

    NotificationDetails notificationDetails = NotificationDetails(
        android: androidNotificationDetails, iOS: darwinNotificationDetails);

    Future.delayed(Duration.zero, () {
      _flutterLocalNotificationsPlugin.show(
        0,
        message.notification?.title.toString(),
        message.notification?.body.toString(),
        notificationDetails,
      );
    });
  }

  Future<String> getDeviceToken() async {
    String? token = await messaging.getToken();
    return token ?? "";
  }

  // void isTokenRefresh()async{
  //   messaging.onTokenRefresh.listen((event) {
  //     event.toString();
  //     if (kDebugMode) {
  //       print('refresh');
  //     }
  //   });
  // }

  Future<void> setupInteractMessage(BuildContext context) async {
    // when app is terminated
    RemoteMessage? initialMessage =
    await FirebaseMessaging.instance.getInitialMessage();

    if (initialMessage != null) {
      handleMessage(context, initialMessage);
    }

    //when app ins background
    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      handleMessage(context, event);
    });
  }

  ///handel adar if terminated or background
  void handleMessage(BuildContext context, RemoteMessage message) {
    print("message.data--------oo0--------${message.data.toString()}");
    if (message.data["notification_type"] != 'account_blocked') {
      Provider.of<NotificationsViewModel>(context, listen: false).initNotifications();
      // Provider.of<NotificationsViewModel>(context, listen: false).getNotificationCount();
    }
    // if (message.data["mes_type"] == 'text'||message.data["mes_type"] == 'voice'||message.data["mes_type"] == 'image') {
    //   if (kDebugMode) {
    //     print('notification payload333:2 ${message.data}');
    //   }
    //   Provider.of<RoomViewModel>(context, listen: false)
    //       .getRoom(int.tryParse(message.data['room_id']) ?? 0);
    //   if (context.read<RoomViewModel>().id != null) {
    //     NavigatorHandler.push(OneRoomScreen(
    //         realEstateId: int.tryParse(message.data['real_estate_id']) ?? 0,
    //         id: int.tryParse(message.data['room_id']) ?? 0,
    //         fromUser: message.data['user_name'],
    //         fromUserImage: message.data['user_image']));
    //   } else {
    //     NavigatorHandler.push(OneRoomScreen(
    //         realEstateId: int.tryParse(message.data['real_estate_id']) ?? 0,
    //         id: int.tryParse(message.data['room_id']) ?? 0,
    //         fromUser: message.data['user_name'],
    //         fromUserImage: message.data['user_image']));
    //   }
    // }
    // else if (message.data["mes_type"] == 'admin_message') {
    //   NavigatorHandler.push(const NotificationScreen());
    // }
    // else if (message.data["mes_type"] == 'account_blocked') {
    //   getIt<LocalUserData>().clearUserData();
    //   NavigatorHandler.pushAndRemoveUntil(const Login());
    // }
    // else if (message.data["mes_type"] == 'verification_update') {
    //   NavigatorHandler.push(const MyAccountScreen());
    // }
  }

  Future forgroundMessage() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }
}
