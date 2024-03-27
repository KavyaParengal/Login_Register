import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:login_register/Admin-Dashboard/Model/paid_video_model.dart';
import '../../Utilities/constants.dart';

class AdminViewPaidVideoAPI{
  Future<List<AdminViewPaidVideoModel>> getPaidVideo(String token) async {
    final url = APIConstants.admin_view_paid_video;
    print(url);
    var response = await http.get(Uri.parse(url), headers: {
      'Authorization': "Token $token",
    });
    print(response);
    if (response.statusCode == 200) {
      var body = json.decode(response.body);
      print(body);
      List<AdminViewPaidVideoModel> data =  body['data'].map<AdminViewPaidVideoModel>((e) => AdminViewPaidVideoModel.fromJson(e)).toList();
      //print(data);
      return data;

    } else {
      List<AdminViewPaidVideoModel> data = [];
      return data;
    }
  }
}