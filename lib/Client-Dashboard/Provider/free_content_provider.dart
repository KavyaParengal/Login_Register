
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

import '../../Utilities/state_enum.dart';
import '../Api_services/free_content_data_view.dart';
import '../Models/freecontentmodel.dart';

class FreeContentDataProvider extends ChangeNotifier{

  final _service = ViewFreeContentDataAPI();
  // bool isLoading = false;
  late StateEnum state;
  late StateEnum userDataState;
  List<FreeContentDataModel> _freeDatas = [];
  List<FreeContentDataModel> get freeDatas => _freeDatas;

  changeState(StateEnum stateEnum) {
    state = stateEnum;
    notifyListeners();
  }

  Future getFreeContents() async {
    changeState(StateEnum.loading);
    notifyListeners();
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    String? token = localStorage.getString('token');
    final response = await _service.getFreeContentData(token.toString());
    print('----Response$response');
    _freeDatas = response;
    changeState(StateEnum.success);
    notifyListeners();
  }
}

