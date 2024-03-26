
import 'dart:async';
import 'dart:ffi';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:login_register/Routes/route_names.dart';
import 'package:login_register/Client-Dashboard/Screens/home_page.dart';
import 'package:login_register/Login/login_page.dart';
import 'package:login_register/Utilities/colors.dart';
import 'package:login_register/firebase_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Utilities/global.dart';
import '/Widgets/loading_icon.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  late SharedPreferences localStorage;
  String token = '';
  String check = '';
  int role = 0;
  bool aniCon = false;

  animateFun(){
    Timer mytimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {

        aniCon = !aniCon;
      });
    });
  }

  Future<void> checkRoleAndNavigate() async {
    localStorage = await SharedPreferences.getInstance();
    token = (localStorage.getString("token") ?? '');
    role = (localStorage.getInt("role") ?? 0);

    if (token != check && role == 1) {
      Navigator.pushNamed(context, RouteName.home);
    }
    else if(token != check && role == 2){
      Navigator.pushNamed(context, RouteName.admin_home);
    }
    else {
      Navigator.pushNamed(context, RouteName.login);

    }
  }

  @override
  void initState() {
    animateFun();
    super.initState();
    startTime();
    // try {
    //   super.initState();
    //   // onInit();
    // } catch (e) {
    //   //print(e);
    // }
  }

  // onInit() async {
  //   try {
  //     await FirebaseMessaging.instance.setAutoInitEnabled(true);
  //     await Global().validateToken(null);
  //     await Global().listenForTokenUpdate();
  //     await FirebaseApi().initNotifications();
  //   } catch (e) {
  //     //print(e);
  //   }
  // }

  startTime() async {
    var duration = new Duration(seconds: 6);
    return Timer(duration, checkRoleAndNavigate);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            // image: DecorationImage(
            //     image: Image.asset('assets/Background.png').image,
            //     fit: BoxFit.cover)
          color: Colors.white
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Center(
                  child: AnimatedContainer(
                    height: aniCon?130:70,
                    duration: Duration(seconds: 1)
                    ,child: Image.asset("assets/logo.png")
                    ,),
                ),
                Divider(
                  //height: 100,
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
                // Text(
                //   "An Initiative By Shebirth",
                //   textAlign: TextAlign.center,
                //   style: TextStyle(
                //     color: Colors.teal.shade700,
                //     fontWeight: FontWeight.bold,
                //     fontSize: 18.0,
                //   ),
                // ),
                Divider(
                  thickness: .1,
                  color: Colors.transparent,
                ),
                LoadingIcon()
              ],
            ),
          ],
        ),
      ),
    );
  }
}
