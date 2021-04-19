import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:schooluniform/configs/api/routes.dart';

updateUser({token, data}) async {
  var uid = data['targetUid'];
  final url = '${ApiConfig.USER_REF}/update/?targetUid=$uid';

  Map body = {
    "total": data['total'],
    "uniformCart": data['uniformCart'],
    "uniformDonate": data['uniformDonate'],
    "uniformShop": data['uniformShop'],
  };

  try {
    final request = await http.put(url,
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
