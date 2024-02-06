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
      //print(data);
      final urls = APIConstants.url + APIConstants.login;
      //print(urls);
      var response = await http.post(Uri.parse(urls), body: data);
      var body = response.body;

      try {
        var decodedBody = json.decode(body);
        //print(decodedBody);
        if (decodedBody['token'] != null) {
          localStorage.setString('token', decodedBody['token']);
          //print(localStorage.getString('token'));
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Login Successfully !')),
          );
          Navigator.pushNamed(context, RouteName.add_menstration);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Invalid User Name or Password')),
          );
        }
      } catch (e) {
        //print(body);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Invalid User Name or Password')),
        );
      }
    } catch (e) {
      throw e.toString();
    }
  }
}
