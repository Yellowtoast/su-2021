import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:schooluniform/configs/api/routes.dart';

getUserCart({id}) async {
  final url = '${ApiConfig.USER_REF}/:$id/cart/list';
  try {
    final respuesta =
        await http.get(url, headers: {"Accept": "application/json"});

    var datosConvertidosJson = jsonDecode(respuesta.body);
    return datosConvertidosJson;
  } catch (err) {
    print(err);
  }
}
