import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:schooluniform/configs/api/networkHandler.dart';
import 'package:schooluniform/configs/api/routes.dart';

part 'info.g.dart';

class InfoStore = InfoStoreBase with _$InfoStore;

abstract class InfoStoreBase with Store {
  @observable
  Map userInfo = {};

  @observable
  Map localInfo = {};

  @action
  Future<void> initData() async {
    List<Future<dynamic>> futures = [
      NetworkHandler().get(InfoApiRoutes.GET),
    ];

    String fcmToken = await FirebaseMessaging.instance.getToken();
    final prefs = await SharedPreferences.getInstance();

    var userInitialData = {
      "total": 0,
      "uniformDonate": 0,
      "uniformShop": 0,
      "uniformCart": 0,
      "fcm": fcmToken,
    };

    var signInInfo = {
      "fcm": fcmToken,
    };

    var token = prefs.getString('x-access-token');
    var uid = prefs.getString('userId');

    try {
      if (token == '' || uid == '') {
        List<Future<dynamic>> futures2 = [
          NetworkHandler().post(UserApiRoutes.SIGN_IN, signInInfo),
        ];

        var newUser = await Future.wait(futures2);
        prefs.setString('x-access-token', newUser[0]['token']);
        prefs.setString('userId', newUser[0]['userId']);
      } else {
        futures.add(
          NetworkHandler().get('${UserApiRoutes.GET}?targetUid=$uid'),
        );
      }
    } catch (err) {
      print(err);
    }

    List res = await Future.wait(futures);

    localInfo = res[0];
    if (token == '' || uid == '') {
      userInfo = userInitialData;
    } else {
      userInfo = res[1]['alarms'];
    }
  }

  @action
  void updateUserData(key, value) {
    userInfo[key] = value;
  }
}
