import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:schooluniform/configs/api/routes.dart';

getLogsUniformDonateList({token}) async {
  final url = '${ApiConfig.USER_REF}/logs/uniform/donate/list';
  try {
    final respuesta = await http.get(url,
        headers: {"Accept": "application/json", "x-access-token": token});

    var datosConvertidosJson = jsonDecode(respuesta.body);
    return datosConvertidosJson;
  } catch (err) {
    print(err);
  }
}
