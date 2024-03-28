import 'dart:developer';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import '../firebase_options.dart';
import '../main.dart';

class NotificationServices {

  showNotification(RemoteMessage message) async {
    try {
      InitializationSettings initializationSettings = InitializationSettings(
          android: AndroidInitializationSettings('@mipmap/ic_launcher'),
          iOS: IOSInitializationSettings());

      await flutterLocalNotificationsPlugin.initialize(initializationSettings,
          onSelectNotification: (payload) {
            print(payload.toString() + "PAYLOAD");
            print(message.data.toString() + "PAYLOAD");
            print(message.toString() + "PAYLOAD");
            print("clickAction${message.data['click_action']}");
          });
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification!.android;
      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              channelDescription: channel.description,
              color: Colors.red,
              playSound: true,
              icon: '@mipmap/ic_launcher',
            ),
          ),
        );
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

//@pragma('vm:entry-point')
  Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
    try {
      showNotification(message);
    } catch (e) {
      if (kDebugMode) {
        print(e.toString() + "99999999");
      }
    }
  }

  setFCM() async {
    FirebaseMessaging.instance.requestPermission();

    try {
      FirebaseMessaging.instance.getInitialMessage();

      await flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()!.createNotificationChannel(channel);

      await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
        alert: true,
        badge: true,
        sound: true,
      );

      ///when app is opened
      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        showNotification(message);

        print(message.data);
      });

      /// when app in background
      FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
        print(message);
        print(message.data);
        log(message.data.toString()+"LOADED");
        showNotification(message);
      });
      FirebaseMessaging.instance.getInitialMessage().then((message) {
        if (message != null) {
          showNotification(message);
        }
      });

      /// when app is killed
      try {
        await Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        );
        FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
      } catch (e) {
        print('Error initializing Firebase or setting background message handler: $e');
      }    } catch (e) {
      print(e);
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
