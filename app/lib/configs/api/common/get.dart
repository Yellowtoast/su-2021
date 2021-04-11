import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:schooluniform/configs/api/configs.dart';

getCommon() async {
  final url = '${ApiConfig.SERVER_URI}/common';
  try {
    final respuesta =
        await http.get(url, headers: {"Accept": "application/json"});

    var datosConvertidosJson = jsonDecode(respuesta.body);
    return datosConvertidosJson;
  } catch (err) {
    print(err);
  }
}
