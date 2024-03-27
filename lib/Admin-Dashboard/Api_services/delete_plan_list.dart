import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:login_register/Admin-Dashboard/Screens/admin_view_price_plan.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Routes/route_names.dart';
import '../../Utilities/constants.dart';

class DeletePlanItem {
  static Future<void> deletePlanItem(BuildContext context, String planId) async {
    try {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      var data = {
        "id": planId,
      };
      //print(data);
      final urls = APIConstants.delete_plan_item;
      //print(urls);
      String token = (localStorage.getString('token') ?? '' );
      String newToken = 'token $token';
      //print(token);
      var response = await http.post(Uri.parse(urls), headers: {'Authorization': newToken}, body: data);
      var body = json.decode(response.body);
      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Delete successfully !'),
            ));
        Navigator.push(context, MaterialPageRoute(builder: (context)=>AdminViewPricePlan()));
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
