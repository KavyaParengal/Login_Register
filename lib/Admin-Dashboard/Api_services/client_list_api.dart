
import 'dart:convert';

import 'package:http/http.dart' as http;
import '../../Utilities/constants.dart';
import '../Model/client_model.dart';

class ViewClientListAPI{
  Future<List<ClientModel>> getClientList(String token) async {
    final url = APIConstants.url + APIConstants.client_list;
    print('------$url');
    print('------$token');
    var response = await http.get(Uri.parse(url), headers: {
      'Authorization': "Token $token",
    });
    print(response.statusCode);
    if (response.statusCode == 200) {
      var body = json.decode(response.body);
      print(body);
      List<ClientModel> data =  body.map<ClientModel>((e) => ClientModel.fromJson(e)).toList();
      //print(data);
      return data;

    } else {
      List<ClientModel> data = [];
      return data;
    }
  }
}