
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Api_services/admin_view_week_wise_content_api.dart';
import '../Model/week_wise_content_model.dart';

class AdminViewWeekWiseProvider extends ChangeNotifier{
  final _service = AdminViewWeekWiseAPI();
  bool isLoading = false;
  List<AdminViewWeekWiseModel> _weekWiseData = [];
  List<AdminViewWeekWiseModel> get weekWiseData => _weekWiseData;

  Future<void> getWeekWiseList() async {
    isLoading = true;
    notifyListeners();

    SharedPreferences localStorage = await SharedPreferences.getInstance();
    String? token = localStorage.getString('token');

    final response = await _service.getWeekWiseContent(token.toString());

    _weekWiseData = response;
    isLoading = false;
    notifyListeners();
  }
}