import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:schooluniform/configs/api/routes.dart';

createLogsUniformDonate({token, data}) async {
  final url = '${ApiConfig.USER_REF}/logs/uniform/donate/create';

  Map body = {
    "uniformId": data['uniformId'],
    "title": data['title'],
    "thumbnail": data['thumbnail'],
    "status": data['status'],
    "showStatus": data['showStatus'],
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
