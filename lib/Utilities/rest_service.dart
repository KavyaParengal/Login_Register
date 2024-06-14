
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'global.dart';

class RestService {
  static Future<dynamic> getMethod(
      {Map<String, dynamic>? headers, required String url}) async {
    try {
      Dio dio = new Dio();
      var response = await dio.get(
        url,
        options: Options(headers: headers),
      );
      if (response.statusCode == 200) {
        return response.data;
      } else {
        return false;
      }
    } catch (e) {
      log(DioErrorType.response.toString());
      if (e is DioError) {
        if (e.error.toString().contains('404')) {
          return e.error.toString();
        }
      }
      print(e);
      return false;
    }
  }
}
