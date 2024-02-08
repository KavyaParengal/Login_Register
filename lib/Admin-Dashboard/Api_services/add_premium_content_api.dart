import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../Client-Dashboard/Routes/route_names.dart';
import '../../Client-Dashboard/Utilities/constants.dart';




class AddPremiumContentApi {
  static Future<void> addPremiumContent(
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
      final urls = ClientAPI.url + ClientAPI.add_premium_content;
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
