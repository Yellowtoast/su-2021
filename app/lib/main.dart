import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:schooluniform/routes/client/client.dart';

void main() {
  runApp(Mogwon());
}

class Mogwon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.dark,
    ));

    return GetMaterialApp(
      title: "daegu-bukgu-schooluniform",
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      initialRoute: Routes.initUrl,
      getPages: Routes.pages,
    );
  }
}
