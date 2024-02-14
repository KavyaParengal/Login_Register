import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../Routes/route_names.dart';
import '../../Utilities/constants.dart';

class EditPremiumContentApi {
  static Future<void> editPremiumContent(
      BuildContext context,String video,String title, String description ,String month, String advice, int videoId) async {

    SharedPreferences localStorage = await SharedPreferences.getInstance();

    try {
      var data = {
        "id": videoId.toString(),
        "video": video,
        "title": title,
        "discription": description,
        "month": month,
        "advice": advice
      };
      print(data);
      final urls = APIConstants.url + APIConstants.edit_paid_content;
      print(urls);
      String token = (localStorage.getString('token') ?? '' );
      String newToken = 'token $token';
      print(token);
      var response = await http.patch(Uri.parse(urls), headers: {'Authorization': newToken}, body: data);
      var body = json.decode(response.body);
      if (response.statusCode == 200) {
        // ScaffoldMessenger.of(context).showSnackBar(
        //     SnackBar(content: Text(body['message']),
        //     ));
        Navigator.pushNamed(context, RouteName.admin_view_premium_content);
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
