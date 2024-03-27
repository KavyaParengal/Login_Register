import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:login_register/Admin-Dashboard/Screens/admin_view_premium_content.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Routes/route_names.dart';
import '../../Utilities/constants.dart';

class AddPremiumContentApi {
  static Future<void> addPremiumContent(
      BuildContext context,String video,String title, String description ,String month, String advice) async {

    SharedPreferences localStorage = await SharedPreferences.getInstance();

    try {
      var data = {
        "video": video,
        "title": title,
        "discription": description,
        "month": month,
        "advice": advice
      };
      print(data);
      final urls = APIConstants.add_premium_content;
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
        Navigator.push(context, MaterialPageRoute(builder: (context)=>AdminViewPremiumContent()));
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
