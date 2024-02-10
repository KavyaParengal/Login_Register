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
          // localStorage.setString('date', body['date']);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Login Successful!')),
          );
          if(body['role'] == 1 && body['date'] == true){
            Navigator.pushNamed(context, RouteName.home);
          }
          else if(body['role'] == 1 && body['date'] == false){
            Navigator.pushNamed(context, RouteName.add_menstration);
          }
          else if(body['role'] == 2){
            Navigator.pushNamed(context, RouteName.admin_home);
          }
          else {
            showErrorMessage(context, 'User not registered');
          }
          //redirectToRoute(context, body['role'], body['date']);
          print(body['role']);
        } else {
          if(body['error'] == "User matching query does not exist.") {
            showErrorMessage(context, 'Invalid email or password');
          } else {
            showErrorMessage(context, 'User not registered');
          }
        }
      } else {
        showErrorMessage(context, 'Error: ${response.statusCode}');
      }
    } catch (e) {
      showErrorMessage(context, 'Invalid username or password');
    }
  }

  static void redirectToRoute(BuildContext context, int role, bool date) {
    print("Redirecting with role: $role");
    switch (role) {
      case 1:
        if (date) {
          Navigator.pushNamed(context, RouteName.home);
        } else {
          Navigator.pushNamed(context, RouteName.add_menstration);
        }
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
