import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:login_register/CLIENT/Routes/route_names.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../CLIENT/Utilities/constants.dart';



class AddFreeContentApi {
  static Future<void> addFreeContent(
      BuildContext context,String video,String title, String description ,String month) async {

    SharedPreferences localStorage = await SharedPreferences.getInstance();

    try {
      var data = {
        "video": video,
        "title": title,
        "description": description,
        "month": month,
      };
      print(data);
      final urls = ClientAPI.url + ClientAPI.add_free_content;
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
        Navigator.pushNamed(context, RouteName.admin_home);
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
