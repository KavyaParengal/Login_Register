
import 'package:flutter/material.dart';
import 'package:login_register/Client-Dashboard/Api_services/view_plan_list_Api.dart';
import 'package:login_register/Client-Dashboard/Models/planListModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PlanListProvider extends ChangeNotifier{

  final _service = PlanListAPI();
  bool isLoading = false;
  List<PlanListModel> _planList = [];
  List<PlanListModel> get planList => _planList;

  Future<void> getPlanList() async {
    isLoading = true;
    notifyListeners();

    SharedPreferences localStorage = await SharedPreferences.getInstance();
    String? token = localStorage.getString('token');

    final response = await _service.getFreeContentData(token.toString());

    _planList = response;
    isLoading = false;
    notifyListeners();
  }
}