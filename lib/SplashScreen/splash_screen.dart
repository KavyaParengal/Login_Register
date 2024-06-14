import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Admin-Dashboard/Screens/admin_home_page.dart';
import '../Login/login_page.dart';
import '../Utilities/global.dart';
import '../Widgets/loading_icon.dart';
import '../firebase_api.dart';
import '../Client-Dashboard/Screens/HomePage/home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late SharedPreferences localStorage;
  String? token;
  int role = 0;
  bool aniCon = false;

  animateFun() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        aniCon = !aniCon;
      });
    });
  }

  Future<void> checkRoleAndNavigate() async {
    localStorage = await SharedPreferences.getInstance();
    token = localStorage.getString("token") ?? '';
    role = localStorage.getInt("role") ?? 0;
    if (token != null && token!.isNotEmpty && role == 1) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
    } else if (token != null && token!.isNotEmpty && role == 2) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AdminHomePage()));
    } else {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
    }
  }

  @override
  void initState() {
    animateFun();
    super.initState();
    startTime();
    try {
      onInit();
    } catch (e) {
      // Handle error
    }
  }

  onInit() async {
    try {
      await FirebaseMessaging.instance.setAutoInitEnabled(true);
      await Global().validateToken(null);
      await Global().listenForTokenUpdate();
      await NotificationServices().setFCM();
    } catch (e) {
      // Handle error
    }
  }

  startTime() async {
    var duration = Duration(seconds: 6);
    return Timer(duration, checkRoleAndNavigate);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: AnimatedContainer(
                height: aniCon ? 130 : 70,
                duration: Duration(seconds: 1),
                child: Image.asset("assets/logo.png"),
              ),
            ),
            const Divider(
              color: Colors.transparent,
              thickness: .1,
            ),
            Text(
              "${Global().appName.toUpperCase()}",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.teal.shade500,
                fontWeight: FontWeight.bold,
                fontSize: 40.0,
              ),
            ),
            const Divider(
              thickness: .1,
              color: Colors.transparent,
            ),
            LoadingIcon(),
          ],
        ),
      ),
    );
  }
}
