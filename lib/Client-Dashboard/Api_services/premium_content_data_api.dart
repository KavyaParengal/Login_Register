
import 'dart:convert';

import 'package:http/http.dart' as http;
import '../Models/premiumContentModel.dart';
import '../Utilities/constants.dart';

class ViewPremiumContentDataAPI{

  Future<List<PremiumContentDataModel>> getFreeContentData(String token) async {
    final url = ClientAPI.url + ClientAPI.get_video_premium;
    print(url);
    var response = await http.get(Uri.parse(url), headers: {
      'Authorization': "Token $token",
    });
    print(response);
    if (response.statusCode == 200) {
      var body = json.decode(response.body);
      print(body);
      List<PremiumContentDataModel> data =  body.map<PremiumContentDataModel>((e) => PremiumContentDataModel.fromJson(e)).toList();
      //print(data);
      return data;

    } else {
      List<PremiumContentDataModel> data = [];
      return data;
    }
  }
}