import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:schooluniform/configs/api/routes.dart';

requestUniformDonate({token, data}) async {
  final url = '${ApiConfig.UNIFORM_REF}/donate/request';

  Map body = {
    "uniformId": data['uniformId'],
    "totalImages": data['totalImages'],
    "images": data['images'],
    "status": data["status"],
    "code": data["code"],
    "giverName": data["giverName"],
    "giverUid": data["giverUid"],
    "giverPhone": data["giverPhone"],
    "giverAddress": data["giverAddress"],
    "giverDeliveryType": data["giverDeliveryType"],
    "uniforms": data["uniforms"],
    "filter-school": data["filter-school"],
    "filter-gender": data["filter-gender"],
    "filter-season": data["filter-season"],
    "filter-clothType": data["filter-clothType"],
  };

  try {
    final request = await http.post(url,
        headers: {
          "Content-Type": "application/json",
          "x-access-token": token,
        },
        body: json.encode(body));
    return request.body;
  } catch (err) {
    print(err);
  }
}
