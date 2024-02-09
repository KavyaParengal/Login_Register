import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:login_register/Client-Dashboard/Models/planListModel.dart';

import '../Utilities/constants.dart';

class PlanListAPI{

  Future<List<PlanListModel>> getFreeContentData(String token) async {
    final url = ClientAPI.url + ClientAPI.plan_list;
    print(url);
    var response = await http.get(Uri.parse(url), headers: {
      'Authorization': "Token $token",
    });
    print(response);
    if (response.statusCode == 200) {
      var body = json.decode(response.body);
      print(body);
      List<PlanListModel> data =  body.map<PlanListModel>((e) => PlanListModel.fromJson(e)).toList();
      //print(data);
      return data;

    } else {
      List<PlanListModel> data = [];
      return data;
    }
  }
}