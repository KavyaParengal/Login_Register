
import 'dart:convert';

import 'package:http/http.dart' as http;
import '../Models/freecontentmodel.dart';
import '../../Utilities/constants.dart';

class ViewFreeContentDataAPI{

   Future<List<FreeContentDataModel>> getFreeContentData(String token) async {
    final url = APIConstants.get_video_free;
    print(url);
    var response = await http.get(Uri.parse(url), headers: {
      'Authorization': "Token $token",
    });
    print('Response : ${response.body}');
    if (response.statusCode == 200) {
      var body = json.decode(response.body);
      print(body);
      List<FreeContentDataModel> data =  body.map<FreeContentDataModel>((e) => FreeContentDataModel.fromJson(e)).toList();
      print(data);
      return data;
    } else {
      List<FreeContentDataModel> data = [];
      return data;
    }
  }
}