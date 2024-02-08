
import 'package:flutter/material.dart';
import 'package:login_register/Client-Dashboard/Api_services/premium_content_data_api.dart';
import 'package:login_register/Client-Dashboard/Models/premiumContentModel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

class PremiumContentDataProvider extends ChangeNotifier{

  final _service = ViewPremiumContentDataAPI();
  bool isLoading = false;
  List<PremiumContentDataModel> _premiumDatas = [];
  List<PremiumContentDataModel> get premiumDatas => _premiumDatas;

  Future<void> getPremiumContents() async {
    isLoading = true;
    notifyListeners();

    SharedPreferences localStorage = await SharedPreferences.getInstance();
    String? token = localStorage.getString('token');

    final response = await _service.getFreeContentData(token.toString());

    _premiumDatas = response;
    isLoading = false;
    notifyListeners();
  }
}