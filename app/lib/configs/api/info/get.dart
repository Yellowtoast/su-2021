import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:schooluniform/configs/api/routes.dart';

getInfoData() async {
  final url = '${ApiConfig.INFO_REF}/getData';
  try {
    final respuesta =
        await http.get(url, headers: {"Accept": "application/json"});

    var datosConvertidosJson = jsonDecode(respuesta.body);
    return datosConvertidosJson;
  } catch (err) {
    print('err message');
    print(err);
  }
}
