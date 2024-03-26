// import 'dart:convert';
// import 'dart:developer';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'main.dart';
//
// class FirebaseApi {
//   final _firebaseMessaging = FirebaseMessaging.instance;
//
//   final _androidChannel = const AndroidNotificationChannel(
//       'high_importance_channel', // id
//       'High Importance Notifications', // title
//       description: 'This channel is used for important notifications.', // description
//       importance: Importance.high,
//       playSound: true
//   );
//   final _localNotifications = FlutterLocalNotificationsPlugin();
//
//   void handleMessage(RemoteMessage? message){
//     if(message == null)
//       return;
//   }
//
//   Future initPushNotifications() async{
//     await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
//       alert: true,
//       badge: true,
//       sound: true,
//     );
//     FirebaseMessaging.instance.getInitialMessage().then(handleMessage);
//     FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
//     FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
//     FirebaseMessaging.onMessage.listen((message) {
//       final notification = message.notification;
//       if(notification == null )
//         return;
//       _localNotifications.show(
//           notification.hashCode,
//           notification.title,
//           notification.body,
//           NotificationDetails(
//             android: AndroidNotificationDetails(
//               _androidChannel.id,
//               _androidChannel.name,
//               channelDescription: _androidChannel.description,
//               icon: '@mipmap/ic_launcher',
//               enableVibration: true,
//               visibility: NotificationVisibility.public
//             )
//           ),
//         payload: jsonEncode(message.toMap())
//       );
//     });
//   }
//
//   Future initLocalNotifications() async{
//     const android = AndroidInitializationSettings('@mipmap/ic_launcher');
//     const settings = InitializationSettings(
//       android: android
//     );
//     await _localNotifications.initialize(
//       settings,
//       // onSelectNotification: (payload){
//       //   final message = RemoteMessage.fromMap(jsonDecode(payload!));
//       //   handleMessage(message);
//       // }
//     );
//     final platform = _localNotifications.resolvePlatformSpecificImplementation<
//       AndroidFlutterLocalNotificationsPlugin>();
//     await platform?.createNotificationChannel(_androidChannel);
//   }
//
//   Future<void> handleBackgroundMessage(RemoteMessage message) async{
//     print('Title: ${message.notification?.title}');
//     print('body: ${message.notification?.body}');
//     print('payload: ${message.data}');
//   }
//
//   Future<void> initNotifications() async{
//     await _firebaseMessaging.requestPermission();
//     final fCMToken = await _firebaseMessaging.getToken();
//     print('Token: $fCMToken');
//     // FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
//     // initPushNotifications();
//     initLocalNotifications();
//     try {
//       FirebaseMessaging.instance.getInitialMessage();
//       await flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<
//           AndroidFlutterLocalNotificationsPlugin>()!.createNotificationChannel(_androidChannel);
//       await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
//         alert: true,
//         badge: true,
//         sound: true,
//       );
//
//       ///when app is opened
//       initPushNotifications();
//
//       /// when app in background
//       FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
//         print(message);
//         print(message.data);
//         log(message.data.toString()+"LOADED");
//         showNotification(message);
//       });
//       FirebaseMessaging.instance.getInitialMessage().then((message) {
//         if (message != null) {
//           showNotification(message);
//         }
//       });
//       } catch (e) {
//           print(e);
//           if (kDebugMode) {
//             print(e);
//           }
//     }
//   }
//
//   showNotification(RemoteMessage message) async {
//     try {
//       InitializationSettings initializationSettings = InitializationSettings(
//         android: AndroidInitializationSettings('@mipmap/ic_launcher'),
//         // iOS: IOSInitializationSettings()
//       );
//
//       await flutterLocalNotificationsPlugin.initialize(initializationSettings,
//           onSelectNotification: (payload) {
//             print(payload.toString() + "PAYLOAD");
//             print(message.data.toString() + "PAYLOAD");
//             print(message.toString() + "PAYLOAD");
//             print("clickAction${message.data['click_action']}");
//           });
//       RemoteNotification? notification = message.notification;
//       AndroidNotification? android = message.notification!.android;
//       if (notification != null && android != null) {
//         flutterLocalNotificationsPlugin.show(
//           notification.hashCode,
//           notification.title,
//           notification.body,
//           NotificationDetails(
//             android: AndroidNotificationDetails(
//               _androidChannel.id,
//               _androidChannel.name,
//               channelDescription: _androidChannel.description,
//               color: Colors.red,
//               playSound: true,
//               icon: '@mipmap/ic_launcher',
//             ),
//           ),
//         );
//       }
//     } catch (e) {
//       if (kDebugMode) {
//         print(e);
//       }
//     }
//   }
//
// }
