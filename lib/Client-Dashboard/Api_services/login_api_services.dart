import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:login_register/Utilities/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Routes/route_names.dart';

class LoginApi {
  static Future<void> loginUser(
      BuildContext context, String email, String password) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();

    try {
      var data = {
        "email": email,
        "password": password,
      };
      print(data);
      final urls = APIConstants.url + APIConstants.login;
      print(urls);
      var response = await http.post(Uri.parse(urls), body: data);
      var body = json.decode(response.body);
      print('Response body: $body');
      if (response.statusCode == 200) {
        if (body['token'] != null) {
          localStorage.setString('token', body['token']);
          localStorage.setInt('role', body['role']);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Login Successful!')),
          );
          print('Role: ${body['role']}, Date: ${body['date']}');
          if (body['role'] == 1) {
            if (body['date'] == true) {
              Navigator.pushNamed(context, RouteName.home);
            } else {
              Navigator.pushNamed(context, RouteName.add_menstration);
            }
          } else if (body['role'] == 2) {
            Navigator.pushNamed(context, RouteName.admin_home);
          }
        } else {
          if (body['message'] == "Invalid credentials") {
            showErrorMessage(context, 'Invalid email or password');
          } else {
            showErrorMessage(context, 'User not registered');
          }
        }
      } else {
        showErrorMessage(context, 'Error: ${response.statusCode}');
      }
    } catch (e) {
      print('Exception: $e');
      showErrorMessage(context, 'Error: Invalid username or password');
    }
  }

  // static void redirectToRoute(BuildContext context, int role, bool date) {
  //   switch (role) {
  //     case 1:
  //       if (date == true) {
  //         Navigator.pushNamed(context, RouteName.home);
  //       } else {
  //         Navigator.pushNamed(context, RouteName.add_menstration);
  //       }
  //       break;
  //     case 2:
  //       Navigator.pushNamed(context, RouteName.admin_home);
  //       break;
  //     default:
  //       showErrorMessage(context, 'Invalid Role: $role');
  //   }
  // }

  static void showErrorMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}
