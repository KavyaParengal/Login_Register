import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:login_register/Admin-Dashboard/Screens/admin_view_price_plan.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Utilities/constants.dart';

class AddPremiumPriceApi {
  static Future<void> addPremiumPrice(
      BuildContext context, String title ,String price, String description) async {

    SharedPreferences localStorage = await SharedPreferences.getInstance();

    try {
      var data = {
        "title": title,
        "price": price,
        "description": description,
      };
      print(data);
      final urls = APIConstants.add_price;
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
        Navigator.push(context, MaterialPageRoute(builder: (context)=>AdminViewPricePlan()));
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
