import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../Routes/route_names.dart';
import '../Utilities/constants.dart';

class LoginApi {
  static Future<void> loginUser(
      BuildContext context, String email, String password) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();

    try {
      var data = {
        "email": email,
        "password": password,
      };

      final urls = ClientAPI.url + ClientAPI.login;
      var response = await http.post(Uri.parse(urls), body: data);
      var body = json.decode(response.body);

      if (response.statusCode == 200) {
        if (body['token'] != null) {
          localStorage.setString('token', body['token']);
          localStorage.setInt('role', body['role']);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Login Successful!')),
          );
          redirectToRoute(context, body['role']);
        } else {
          showErrorMessage(context, 'Invalid User Name or Password');
        }
      } else {
        showErrorMessage(context, 'Error: ${response.statusCode}');
      }
    } catch (e) {
      showErrorMessage(context, 'Invalid User Name or Password');
    }
  }

  static void redirectToRoute(BuildContext context, int role) {
    switch (role) {
      case 1:
        Navigator.pushNamed(context, RouteName.add_menstration);
        break;
      case 2:
        Navigator.pushNamed(context, RouteName.admin_home);
        break;
      default:
        showErrorMessage(context, 'Invalid Role: $role');
    }
  }

  static void showErrorMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}
