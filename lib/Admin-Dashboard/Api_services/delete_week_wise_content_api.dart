import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:login_register/Admin-Dashboard/Screens/admin_view_week_wise_content.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Utilities/constants.dart';


class DeleteWeekWiseContent {
  static Future<void> deleteWeekWiseContent(BuildContext context, String weekWiseContentId) async {
    try {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      var data = {
        "id": weekWiseContentId,
      };
      print(data);
      final urls = APIConstants.delete_week_wise_content;
      print(urls);
      String token = (localStorage.getString('token') ?? '' );
      String newToken = 'token $token';
      print(token);
      var response = await http.post(Uri.parse(urls), headers: {'Authorization': newToken}, body: data);
      var body = json.decode(response.body);
      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Delete successfully !'),
            ));
        Navigator.push(context, MaterialPageRoute(builder: (context)=>AdminViewWeekWiseContent()));
      }
      else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(body['message']),
            ));
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('An error occurred while deleting item: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
