import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:login_register/Client-Dashboard/Screens/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Utilities/constants.dart';


class AddMenstruationDateApi {
  static Future<void> addMenstruationDate(
      BuildContext context, String date) async {

    SharedPreferences localStorage = await SharedPreferences.getInstance();

    try {
      var data = {
        "menstration": date,
      };
      print(data);
      final urls = APIConstants.add_menstrual_date;
      print(urls);
      String token = (localStorage.getString('token') ?? '' );
      String newToken = 'token $token';
      print(token);
      var response = await http.post(Uri.parse(urls), headers: {'Authorization': newToken}, body: data);
      var body = json.decode(response.body);
      if (response.statusCode == 200) {
        // ScaffoldMessenger.of(context).showSnackBar(
        //     SnackBar(content: Text(body['message']),
        //     ));
        Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
      }
      else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(body['message']),
            ));
      }
    } catch (e) {
      throw e.toString();
    }
  }
}
