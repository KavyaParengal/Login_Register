import 'dart:convert';

import 'package:login_register/Admin-Dashboard/Model/workshop_video_model.dart';
import 'package:http/http.dart' as http;
import '../../Utilities/constants.dart';

class AdminViewWorkshopVideoAPI{
  Future<List<WorkshopModel>> getWorkshopVideo(String token) async {
    final url = APIConstants.admin_view_workshop_video;
    print(url + token);
    var response = await http.get(Uri.parse(url), headers: {
      'Authorization': "Token $token",
    });
    print(response);
    if (response.statusCode == 200) {
      var body = json.decode(response.body);
      print('-----$body');
      List<WorkshopModel> data =  body['data'].map<WorkshopModel>((e) => WorkshopModel.fromJson(e)).toList();
      print('========= $data');
      return data;

    } else {
      List<WorkshopModel> data = [];
      return data;
    }
  }
}