import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../Client-Dashboard/Routes/route_names.dart';
import '../../Client-Dashboard/Utilities/constants.dart';

class DeleteFreeContent {
  static Future<void> deleteFreeContent(BuildContext context, String freeContentId) async {
    try {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      var data = {
        "id": freeContentId,
      };
      print(data);
      final urls = APIConstants.url + APIConstants.delete_free_content;
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
        Navigator.pushNamed(context, RouteName.admin_view_free_content);
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
