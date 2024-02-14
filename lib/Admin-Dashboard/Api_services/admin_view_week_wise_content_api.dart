import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../Utilities/constants.dart';
import '../Model/week_wise_content_model.dart';

class AdminViewWeekWiseAPI{
  Future<List<AdminViewWeekWiseModel>> getWeekWiseContent(String token) async {
    final url = APIConstants.url + APIConstants.admin_view_week_wise_data;
    print(url);
    var response = await http.get(Uri.parse(url), headers: {
      'Authorization': "Token $token",
    });
    print(response);
    if (response.statusCode == 200) {
      var body = json.decode(response.body);
      print(body);
      List<AdminViewWeekWiseModel> data =  body['data'].map<AdminViewWeekWiseModel>((e) => AdminViewWeekWiseModel.fromJson(e)).toList();
      //print(data);
      return data;

    } else {
      List<AdminViewWeekWiseModel> data = [];
      return data;
    }
  }
}