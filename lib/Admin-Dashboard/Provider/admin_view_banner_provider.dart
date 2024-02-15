
import 'package:flutter/material.dart';
import 'package:login_register/Admin-Dashboard/Api_services/admin_view_banner_api.dart';
import 'package:login_register/Admin-Dashboard/Model/banner_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdminViewBannerProvider extends ChangeNotifier{
  final _service = AdminViewBannersAPI();
  bool isLoading = false;
  List<BannerModel> _bannerList = [];
  List<BannerModel> get bannerList => _bannerList;

  Future<void> getBanners() async {
    isLoading = true;
    notifyListeners();

    SharedPreferences localStorage = await SharedPreferences.getInstance();
    String? token = localStorage.getString('token');

    final response = await _service.getBanners(token.toString());

    _bannerList = response;
    isLoading = false;
    notifyListeners();
  }
}