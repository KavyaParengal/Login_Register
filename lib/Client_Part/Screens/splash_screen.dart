
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:login_register/Client_Part/Screens/home_page.dart';
import 'package:login_register/Client_Part/Screens/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  late SharedPreferences localStorage;
  String token = '';

  Future<void> checkRoleAndNavigate() async {
    localStorage = await SharedPreferences.getInstance();
    token = (localStorage.getString("token") ?? '');

    if (token == null) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginPage()));
    } else {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => HomePage()));
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
      body: Center(
        child: Image.asset('assets/logo.jpg'),
      ),
    );
  }
}
