import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Routes/route_names.dart';
import '../../Utilities/constants.dart';

class EditWeekWiseContentApi {
  static Future<void> editWeekWiseContent(
      BuildContext context,
      String month,
      String imagePath,
      String size,
      String description,
      String length,
      String weight,
      int contentId
      ) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    try {
      var uri = Uri.parse(APIConstants.url + APIConstants.edit_week_wise_content);
      var request = http.MultipartRequest('PATCH', uri);

      // Add authorization token to headers
      String? token = localStorage.getString('token');
      if (token != null) {
        request.headers['Authorization'] = 'token $token';
      }

      request.fields['id'] = contentId.toString();
      request.fields['month'] = month;
      request.fields['size'] = size;
      request.fields['description'] = description;
      request.fields['length'] = length;
      request.fields['weight'] = weight;

      // Add image file
      final imageFile = File(imagePath);
      final imageStream = http.ByteStream(imageFile.openRead());
      final imageLength = await imageFile.length();

      final multipartFile = http.MultipartFile(
        'image',
        imageStream,
        imageLength,
        filename: basename(imagePath),
        contentType: MediaType('image', 'jpeg'), // Change this according to your image type
      );
      request.files.add(multipartFile);

      // Send request and handle response
      var response = await request.send();

      if (response.statusCode == 200) {
        print('Week Wise Content Edit successfully');
        Navigator.pushNamed(context, RouteName.admin_view_week_wise_content);
      } else {
        print('Error Editing Week Wise Content. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error Editing Week Wise Content: $e');
    }
  }
}
