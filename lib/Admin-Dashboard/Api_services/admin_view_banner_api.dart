import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:login_register/Admin-Dashboard/Model/banner_model.dart';
import '../../Utilities/constants.dart';

class AdminViewBannersAPI{
  Future<List<BannerModel>> getBanners(String token) async {
    final url = APIConstants.admin_view_banners;
    print(url);
    var response = await http.get(Uri.parse(url), headers: {
      'Authorization': "Token $token",
    });
    print(response);
    if (response.statusCode == 200) {
      var body = json.decode(response.body);
      print(body);
     List<BannerModel> data =  body['data'].map<BannerModel>((e) => BannerModel.fromJson(e)).toList();
      print(data);
      return data;

    } else {
      List<BannerModel> data = [];
      return data;
    }
  }
}