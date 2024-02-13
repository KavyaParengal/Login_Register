
import 'package:flutter/material.dart';
import 'package:login_register/Admin-Dashboard/Model/admin_view_paid_video.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Api_services/admin_view_paid_video_api.dart';

class AdminViewPaidVideoProvider extends ChangeNotifier{
  final _service = AdminViewPaidVideoAPI();
  bool isLoading = false;
  List<AdminViewPaidVideoModel> _paidVideoList = [];
  List<AdminViewPaidVideoModel> get paidVideoList => _paidVideoList;

  Future<void> getPaidVideoList() async {
    isLoading = true;
    notifyListeners();

    SharedPreferences localStorage = await SharedPreferences.getInstance();
    String? token = localStorage.getString('token');

    final response = await _service.getPaidVideo(token.toString());

    _paidVideoList = response;
    isLoading = false;
    notifyListeners();
  }
}