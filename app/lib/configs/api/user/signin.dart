import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:schooluniform/configs/api/routes.dart';

signInUser({fcm}) async {
  final url = '${ApiConfig.USER_REF}/signin';
  try {
    final respuesta = await http.post(url, headers: {
      "Accept": "application/json"
    }, body: <String, String>{
      'fcm': fcm,
    });

    var datosConvertidosJson = jsonDecode(respuesta.body);
    return datosConvertidosJson;
  } catch (err) {
    print(err);
  }
}
