import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../Client-Dashboard/Routes/route_names.dart';
import '../../Client-Dashboard/Utilities/constants.dart';

class AddWeekWiseContentApi {
  static Future<void> addWeekWiseContent(
      BuildContext context,String month,String image, String size ,String description, String length ,String weight) async {

    SharedPreferences localStorage = await SharedPreferences.getInstance();

    try {
      var data = {
        "month": month,
        "image": image,
        "size": size,
        "description": description,
        "length": length,
        "weight": weight,
      };
      print(data);
      final urls = APIConstants.url + APIConstants.add_week_wise_content;
      print(urls);
      String token = (localStorage.getString('token') ?? '' );
      String newToken = 'token $token';
      print(token);
      var response = await http.post(Uri.parse(urls), headers: {'Authorization': newToken}, body: data);
      var body = json.decode(response.body);
      print(response.statusCode);
      if (response.statusCode == 400) {
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
