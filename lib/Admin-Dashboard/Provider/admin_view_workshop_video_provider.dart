import 'package:flutter/material.dart';
import 'package:login_register/Admin-Dashboard/Api_services/admin_view_workshop_video_api.dart';
import 'package:login_register/Admin-Dashboard/Model/workshop_video_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdminViewWorkshopVideoProvider extends ChangeNotifier{
  final _service = AdminViewWorkshopVideoAPI();
  bool isLoading = false;
  List<WorkshopModel> _workshopVideoList = [];
  List<WorkshopModel> get workshopVideoList => _workshopVideoList;

  Future<void> getWorkshopVideoList() async {
    isLoading = true;
    notifyListeners();

    SharedPreferences localStorage = await SharedPreferences.getInstance();
    String? token = localStorage.getString('token');

    final response = await _service.getWorkshopVideo(token.toString());

    _workshopVideoList = response;
    isLoading = false;
    notifyListeners();
  }
}