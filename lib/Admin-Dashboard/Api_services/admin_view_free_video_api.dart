import 'dart:convert';

import 'package:login_register/Admin-Dashboard/Model/admin_view_free_video.dart';
import 'package:http/http.dart' as http;
import '../../Client-Dashboard/Utilities/constants.dart';

class AdminViewFreeVideoAPI{
  Future<List<AdminViewFreeVideoModel>> getFreeVideo(String token) async {
    final url = APIConstants.url + APIConstants.admin_view_free_video;
    print(url);
    var response = await http.get(Uri.parse(url), headers: {
      'Authorization': "Token $token",
    });
    print(response);
    if (response.statusCode == 200) {
      var body = json.decode(response.body);
      print(body);
      List<AdminViewFreeVideoModel> data =  body['data'].map<AdminViewFreeVideoModel>((e) => AdminViewFreeVideoModel.fromJson(e)).toList();
      //print(data);
      return data;

    } else {
      List<AdminViewFreeVideoModel> data = [];
      return data;
    }
  }
}