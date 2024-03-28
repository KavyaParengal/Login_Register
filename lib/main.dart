
import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:login_register/Admin-Dashboard/Provider/admin_view_banner_provider.dart';
import 'package:login_register/Admin-Dashboard/Provider/admin_view_free_video_provider.dart';
import 'package:login_register/Admin-Dashboard/Provider/admin_view_paid_video_provider.dart';
import 'package:login_register/Admin-Dashboard/Provider/admin_view_workshop_video_provider.dart';
import 'package:login_register/Admin-Dashboard/Provider/client_list_provider.dart';
import 'package:login_register/Admin-Dashboard/Screens/add_notification.dart';
import 'package:login_register/Client-Dashboard/Provider/free_content_provider.dart';
import 'package:login_register/Client-Dashboard/Provider/plan_list_provider.dart';
import 'package:login_register/Client-Dashboard/Provider/premium_content_provider.dart';
import 'package:login_register/Client-Dashboard/Screens/splash_screen.dart';
import 'package:login_register/Routes/route_names.dart';
import 'package:login_register/Routes/route_navigations.dart';
import 'package:login_register/firebase_api.dart';
import 'package:provider/provider.dart';
import 'Admin-Dashboard/Provider/admin_view_wee_wise_provider.dart';
import 'firebase_options.dart';


const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    description:
    'This channel is used for important notifications.', // description
    importance: Importance.high,
    playSound: true);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  NotificationServices().setFCM();
  // await FirebaseMessaging.instance.getInitialMessage();
  // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  runApp(
      MultiProvider(
        providers:
        [
          ChangeNotifierProvider(create:  (context) => FreeContentDataProvider(),),
          ChangeNotifierProvider(create:  (context) => ClientListProvider(),),
          ChangeNotifierProvider(create:  (context) => PremiumContentDataProvider()),
          ChangeNotifierProvider(create:  (context) => PlanListProvider()),
          ChangeNotifierProvider(create:  (context) => AdminViewFreeVideoProvider()),
          ChangeNotifierProvider(create:  (context) => AdminViewPaidVideoProvider()),
          ChangeNotifierProvider(create:  (context) => AdminViewWeekWiseProvider()),
          ChangeNotifierProvider(create:  (context) => AdminViewWorkshopVideoProvider()),
          ChangeNotifierProvider(create:  (context) => AdminViewBannerProvider())
        ],
        child: MaterialApp(
          theme: ThemeData(
            primaryColor: Colors.teal,
            inputDecorationTheme: InputDecorationTheme(
              iconColor: Colors.white,
            ),
            // primarySwatch: Colors.grey
          ),
          debugShowCheckedModeBanner: false,
          home: SplashScreen(),
        ),
      )
  );
}