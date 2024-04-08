import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:login_register/Utilities/global.dart';

import '../../Utilities/constants.dart';

class NotificationAPI{
  static Future<void> sendNotification(BuildContext context, String title, String description) async{
    Global.getPreferences();
    try{
      var data = {
        "title": title,
        "body": description
      };
      print(data);
      final urls = APIConstants.add_notification;
      print(urls);
      String token = (Global.prefs!.getString('token') ?? '' );
      String newToken = 'token $token';
      print(token);
      var response = await http.post(Uri.parse(urls), headers: {'Authorization': newToken}, body: data);
      print(response.body);
      var body = json.decode(response.body);
      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Notification added successfully'),backgroundColor: Colors.green,)
        );
        // Navigator.push(context, MaterialPageRoute(builder: (context)=>AdminViewFreeContent()));
      }
      else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(body['message']),
            ));
      }
    }catch(e){
      if(kDebugMode){
        print('error push notification');
      }
    }
  }
}