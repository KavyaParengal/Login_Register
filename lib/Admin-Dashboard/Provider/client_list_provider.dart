
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Api_services/client_list_api.dart';
import '../Model/client_model.dart';

class ClientListProvider extends ChangeNotifier{
  final _service = ViewClientListAPI();
  bool isLoading = false;
  List<ClientModel> _clientList = [];
  List<ClientModel> get clientList => _clientList;

  Future<void> getClientList() async {
    isLoading = true;
    notifyListeners();

    SharedPreferences localStorage = await SharedPreferences.getInstance();
    String? token = localStorage.getString('token');

    final response = await _service.getClientList(token.toString());

    _clientList = response;
    isLoading = false;
    notifyListeners();
  }
}