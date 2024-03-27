import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:login_register/Admin-Dashboard/Screens/admin_view_workshop_video.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Routes/route_names.dart';
import '../../Utilities/constants.dart';

class EditWorkshopVideoApi {
  static Future<void> editWorkshopVideo(
      BuildContext context,String video, int videoId) async {

    SharedPreferences localStorage = await SharedPreferences.getInstance();

    try {
      var data = {
        "video": video,
        "id": videoId.toString()
      };
      print(data);
      final urls = APIConstants.edit_workshop_video;
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
        Navigator.push(context, MaterialPageRoute(builder: (context)=>AdminViewWorkshopVideo()));
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
