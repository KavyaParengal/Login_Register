import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../Models/dashboardDataModal.dart';
import '../../Utilities/constants.dart';

class ViewDashboardData{
  Future<DashbordDataModel> getDashboardData(String token) async {
    final url = APIConstants.url + APIConstants.dashboard;
          var response = await http.get(Uri.parse(url), headers: {
            'Authorization': "Token $token",
          });
    if (response.statusCode == 200) {
      var body = json.decode(response.body);
      return DashbordDataModel.fromJson(body);
    }
    else {
      throw Exception('Failed to load user details');
    }
  }
}