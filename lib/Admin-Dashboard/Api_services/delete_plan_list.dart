import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../Client-Dashboard/Utilities/constants.dart';

class DeletePlanItem{

  static Future<void> deleteCartItem(BuildContext context, String itemId) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    final url = APIConstants.url + APIConstants.delete_plan_item;
    final Map<String, String> body = {
      'id': itemId,
    };

    try {
      String token = (localStorage.getString('token') ?? '' );
      final response = await http.delete(Uri.parse(url), body: json.encode(body), headers: {'Authorization': 'token $token'},
      );

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Delete successful!'),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
                'Failed to delete item. Status code: ${response.statusCode}'),
            backgroundColor: Colors.red,
          ),
        );
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