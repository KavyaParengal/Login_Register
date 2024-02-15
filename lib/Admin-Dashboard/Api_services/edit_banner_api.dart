import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Routes/route_names.dart';
import '../../Utilities/constants.dart';

class EditBannerAPI {
  static Future<void> editBanner(
      BuildContext context,
      String order,
      String imagePath,
      int id
      ) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    try {
      var uri = Uri.parse(APIConstants.url + APIConstants.edit_banner);
      var request = http.MultipartRequest('PATCH', uri);

      // Add authorization token to headers
      String? token = localStorage.getString('token');
      if (token != null) {
        request.headers['Authorization'] = 'token $token';
      }

      // Add fields
      request.fields['order'] = order;
      request.fields['id'] = id.toString();

      // Add image file
      final imageFile = File(imagePath);
      final imageStream = http.ByteStream(imageFile.openRead());
      final imageLength = await imageFile.length();

      final multipartFile = http.MultipartFile(
        'banners',
        imageStream,
        imageLength,
        filename: basename(imagePath),
        contentType: MediaType('image', 'jpeg'), // Change this according to your image type
      );
      request.files.add(multipartFile);
      print('URL --- ${APIConstants.url + APIConstants.edit_banner}');
      // Send request and handle response
      var response = await request.send();

      if (response.statusCode == 200) {
        print('Banners added successfully');
        Navigator.pushNamed(context, RouteName.admin_view_banners);
      } else {
        print('Error Adding Banners. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error Adding Banners: $e');
    }
  }
}
