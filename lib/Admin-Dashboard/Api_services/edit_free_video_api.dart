import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:login_register/Admin-Dashboard/Screens/admin_view_free_content.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Routes/route_names.dart';
import '../../Utilities/constants.dart';




class EditFreeContentApi {
  static Future<void> editFreeContent(
      BuildContext context,String video,String title ,String month, int videoId) async {

    SharedPreferences localStorage = await SharedPreferences.getInstance();

    try {
      var data = {
        "id": videoId.toString(),
        "video": video,
        "title": title,
        // "description": description,
        "month": month,
      };
      print(data);
      final urls = APIConstants.edit_free_content;
      print(urls);
      String token = (localStorage.getString('token') ?? '' );
      String newToken = 'token $token';
      print(token);
      var response = await http.patch(Uri.parse(urls), headers: {'Authorization': newToken}, body: data);
      print(response.statusCode);
      var body = json.decode(response.body);
      if (response.statusCode == 200) {
        // ScaffoldMessenger.of(context).showSnackBar(
        //     SnackBar(content: Text(body['message']),
        //     ));
        Navigator.push(context, MaterialPageRoute(builder: (context)=>AdminViewFreeContent()));
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
