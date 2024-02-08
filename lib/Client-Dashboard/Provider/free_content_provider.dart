
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

import '../Api_services/free_content_data_view.dart';
import '../Models/freecontentmodel.dart';

class FreeContentDataProvider extends ChangeNotifier{

  final _service = ViewFreeContentDataAPI();
  bool isLoading = false;
  List<FreeContentDataModel> _freeDatas = [];
  List<FreeContentDataModel> get freeDatas => _freeDatas;

  Future<void> getFreeContents() async {
    isLoading = true;
    notifyListeners();

    SharedPreferences localStorage = await SharedPreferences.getInstance();
    String? token = localStorage.getString('token');

    final response = await _service.getFreeContentData(token.toString());

    _freeDatas = response;
    isLoading = false;
    notifyListeners();
  }
}