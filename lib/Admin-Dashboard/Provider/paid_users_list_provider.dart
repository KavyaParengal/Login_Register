
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../Login/login_page.dart';
import '../../Utilities/constants.dart';
import '../../Utilities/global.dart';
import '../../Utilities/state_enum.dart';
import '../Model/paid_users_model.dart';

class PaidUsersController extends ChangeNotifier {
  PaidUsersController(this.context) {
    fetchAllPaidUsers();
  }
  BuildContext context;

  List<PaidUserModel> paidUsers = [];
  late StateEnum state;

  changeState(StateEnum stateEnum) {
    state = stateEnum;
    notifyListeners();
  }

  Future<void> fetchAllPaidUsers() async {
    changeState(StateEnum.loading);
    var token = '${Global.prefs!.getString('token')}';
    if (token != null) {
      String url = APIConstants.paid_users;
      var response = await http.get(Uri.parse(url), headers: {
        'Authorization': "Token $token",
      });
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        paidUsers = (jsonData as List)
            .map((data) => PaidUserModel.fromJson(data))
            .toList();
        changeState(StateEnum.success);
        print(paidUsers);
      } else {
        changeState(StateEnum.error);
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Sales Person Not Found'),
        backgroundColor: Colors.red,
      ));
      Future.delayed(Duration(seconds: 2), () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
        );
      });
    }
  }
}
