
import 'dart:async';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:login_register/CLIENT/Routes/route_names.dart';
import 'package:login_register/CLIENT/Screens/home_page.dart';
import 'package:login_register/CLIENT/Screens/login_page.dart';
import 'package:login_register/CLIENT/Utilities/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';


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

  Future<void> checkRoleAndNavigate() async {
    localStorage = await SharedPreferences.getInstance();
    token = (localStorage.getString("token") ?? '');
    role = (localStorage.getInt("role") ?? 0);

    if (token != check && role == 1) {
      Navigator.pushNamed(context, RouteName.home);
    }
    else if(token != check && role == 2){
      Navigator.pushNamed(context, RouteName.add_video);
    }
    else {
      Navigator.pushNamed(context, RouteName.login);

    }
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    var duration = new Duration(seconds: 6);
    return Timer(duration, checkRoleAndNavigate);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset('assets/logo.png'),
          ),
          SizedBox(height: 30,),
          CircularProgressIndicator(color: primary,)
        ],
      ),
    );
  }
}
