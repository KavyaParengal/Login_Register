
import 'dart:convert';

import 'package:login_register/CLIENT/Models/freecontentmodel.dart';
import 'package:http/http.dart' as http;
import '../Utilities/constants.dart';

class ViewFreeContentData{

  static Future<List<FreeContentDataModel>> getFreeContentData(String token) async {
    final url = ClientAPI.url + ClientAPI.get_video_free;
    print(url);
    var response = await http.get(Uri.parse(url), headers: {
      'Authorization': "Token $token",
    });
    print(response);
    if (response.statusCode == 200) {
      var body = json.decode(response.body);
      //print(body);
      List<FreeContentDataModel> data =  body.map<FreeContentDataModel>((e) => FreeContentDataModel.fromJson(e)).toList();
      //print(data);
      return data;

    } else {
      List<FreeContentDataModel> data = [];
      return data;
    }
  }
}