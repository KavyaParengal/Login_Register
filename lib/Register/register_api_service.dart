import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:login_register/Login/login_page.dart';

import '../Routes/route_names.dart';
import '../Utilities/constants.dart';

class RegisterApi{
  static Future<void> registerUser(BuildContext context,
      String email,
      String password,
      String mobile,
      String fname,
      String lname,
      String location) async{

    try{
      var data={
        "email": email,
        "password": password,
        "mobile": mobile,
        "firstname": fname,
        "lastname": lname,
        "location" : location,
      };
      print(data);
      final urls = APIConstants.register;
      print(urls);
      var response = await http.post(Uri.parse(urls),body: data);
      var body = json.decode(response.body);
      print(body);
      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Registration Successfully !'),
            ));
        Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
      }
      else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(body['message']),
            ));
      }
    }
    catch(e){
      throw e.toString();
    }
  }
}