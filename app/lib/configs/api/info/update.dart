import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:schooluniform/configs/api/routes.dart';

updateInfo({token, data}) async {
  final url = '${ApiConfig.INFO_REF}/update';

  Map body = {
    "totalDonate": data['totalDonate'],
    "totalBeforeStock": data['totalBeforeStock'],
    "schoolDonate": data['schoolDonate'],
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
