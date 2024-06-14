
import 'package:flutter/material.dart';
import 'package:login_register/Client-Dashboard/Models/bannersModel.dart';
import 'package:login_register/Login/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Utilities/constants.dart';
import '../../Utilities/rest_service.dart';
import '../../Utilities/state_enum.dart';

class GetBannersController with ChangeNotifier {
  GetBannersController(this.context) {
    fetchGetBanners();
  }
  BuildContext context;
  BannersModel? model;
  late StateEnum state;

  changeState(StateEnum stateEnum) {
    state = stateEnum;
    notifyListeners();
  }

  fetchGetBanners() async {
    changeState(StateEnum.loading);
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    String? token = await localStorage.getString('token');
    if (token != null) {
      String url = APIConstants.admin_view_banners;
      Map<String, dynamic> header = {
        "Authorization": "Token ${token}"
      };
      dynamic response = await RestService.getMethod(url: url, headers: header);
      if (response is bool) {
        changeState(StateEnum.error);
      } else {
        model = BannersModel.fromJson(response);
        changeState(StateEnum.success);
      }
    }else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
            'Login Details not found. You will be rerouted to the login page'),
        backgroundColor: Colors.red,
      ));
      Future.delayed(const Duration(seconds: 2), () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
        );
      });
    }
  }
}