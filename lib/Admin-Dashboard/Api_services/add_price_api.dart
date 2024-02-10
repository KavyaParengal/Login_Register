import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../Client-Dashboard/Routes/route_names.dart';
import '../../Client-Dashboard/Utilities/constants.dart';

class AddPremiumPriceApi {
  static Future<void> addPremiumPrice(
      BuildContext context, String title ,String price) async {

    SharedPreferences localStorage = await SharedPreferences.getInstance();

    try {
      var data = {
        "title": title,
        "price": price,
      };
      print(data);
      final urls = ClientAPI.url + ClientAPI.add_price;
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