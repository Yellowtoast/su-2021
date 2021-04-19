import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:schooluniform/configs/api/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http_parser/http_parser.dart';

class NetworkHandler {
  String baseurl = ApiConfig.BASE_URI;

  Future get(String url) async {
    final prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token");
    url = formater(url);
    try {
      var response = await http.get(
        url,
        headers: {
          "Accept": "application/json",
          "Content-type": "application/json",
          "x-access-token": token,
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        print(response.body);

        return json.decode(response.body);
      } else {
        print(response.statusCode);
        print(response.body);
      }
    } catch (err) {
      print('err message');
      print(err);
    }
  }

  Future<http.Response> post(String url, Map<String, String> body) async {
    final prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token");
    url = formater(url);
    print(body);
    try {
      var response = await http.post(
        url,
        headers: {
          "Content-Type": "application/json",
          "x-access-token": token,
        },
        body: json.encode(body),
      );
      return response;
    } catch (err) {
      print('err message');
      print(err);
      return null;
    }
  }

  Future<http.Response> put(String url, Map<String, String> body) async {
    final prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token");
    url = formater(url);
    print(body);
    try {
      var response = await http.patch(
        url,
        headers: {
          "Content-Type": "application/json",
          "x-access-token": token,
        },
        body: json.encode(body),
      );
      return response;
    } catch (err) {
      print('err message');
      print(err);
      return null;
    }
  }

  // Future<http.StreamedResponse> putImage({String url, String filepath}) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   String token = prefs.getString("token");
  //   url = formater(url);
  //   var request = http.MultipartRequest('PUT', Uri.parse(url));
  //   request.files.add(await http.MultipartFile.fromPath("imageFile", filepath));
  //   request.headers.addAll({
  //     "Content-type": "multipart/form-data",
  //     "x-access-token": token,
  //   });
  //   var response = request.send();
  //   return response;
  // }

  putImage({filePath}) async {
    var uri = Uri.parse("${ApiConfig.SERVER_URI}/uploads");
    try {
      final prefs = await SharedPreferences.getInstance();
      var uid = prefs.getString('userId');
      var timestemp = DateTime.now().millisecondsSinceEpoch;

      var request = http.MultipartRequest('PUT', uri)
        ..files.add(await http.MultipartFile.fromPath('imageFile', filePath,
            filename: '$uid',
            contentType:
                MediaType('image', 'image/png', {'charset': 'utf-8'})));
      var response = await request.send();
      if (response.statusCode == 200) {
        return 'uploads/${uid}_${timestemp.toString()}.png';
      } else {
        return false;
      }
    } catch (err) {
      print(err);
    }
  }

  String formater(String url) {
    return baseurl + url;
  }

  NetworkImage getImage(String imageSrc) {
    String url = formater(imageSrc);
    return NetworkImage('/' + url);
  }
}
