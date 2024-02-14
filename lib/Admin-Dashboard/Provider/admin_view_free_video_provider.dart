import 'package:flutter/material.dart';
import 'package:login_register/Admin-Dashboard/Api_services/admin_view_free_video_api.dart';
import 'package:login_register/Admin-Dashboard/Model/free_video_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdminViewFreeVideoProvider extends ChangeNotifier{
  final _service = AdminViewFreeVideoAPI();
  bool isLoading = false;
  List<AdminViewFreeVideoModel> _freeVideoList = [];
  List<AdminViewFreeVideoModel> get freeVideoList => _freeVideoList;

  Future<void> getFreeVideoList() async {
    isLoading = true;
    notifyListeners();

    SharedPreferences localStorage = await SharedPreferences.getInstance();
    String? token = localStorage.getString('token');

    final response = await _service.getFreeVideo(token.toString());

    _freeVideoList = response;
    isLoading = false;
    notifyListeners();
  }
}