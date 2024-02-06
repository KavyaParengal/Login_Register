import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../Routes/route_names.dart';
import '../Utilities/constants.dart';

class LoginApi {
  static Future<void> addMenstruationDate(
      BuildContext context, String date) async {

    SharedPreferences localStorage = await SharedPreferences.getInstance();


  }
}
