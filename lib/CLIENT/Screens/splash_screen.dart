
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:login_register/CLIENT/Routes/route_names.dart';
import 'package:login_register/CLIENT/Screens/home_page.dart';
import 'package:login_register/CLIENT/Screens/login_page.dart';
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

  Future<void> checkRoleAndNavigate() async {
    localStorage = await SharedPreferences.getInstance();
    token = (localStorage.getString("token") ?? '');

    if (token != check) {
      Navigator.pushNamed(context, RouteName.home);
    } else {
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
      body: Center(
        child: Image.asset('assets/logo.jpg'),
      ),
    );
  }
}
