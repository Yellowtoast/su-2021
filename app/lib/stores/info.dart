import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:mobx/mobx.dart';
import 'package:schooluniform/configs/api/user/get.dart';
import 'package:schooluniform/configs/api/user/signin.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:schooluniform/configs/api/info/get.dart';

part 'info.g.dart';

class InfoStore = InfoStoreBase with _$InfoStore;

abstract class InfoStoreBase with Store {
  @observable
  Map userInfo = {};

  @observable
  Map localInfo = {};

  @action
  Future<void> initData() async {
    List<Future<dynamic>> futures = [getInfoData()];

    String fcmToken = await FirebaseMessaging.instance.getToken();
    final prefs = await SharedPreferences.getInstance();

    var userInitialData = {
      "total": 0,
      "totalAlarmsDonate": 0,
      "totalAlarmsShop": 0,
      "totalAlarmsCart": 0,
      "fcm": fcmToken,
    };

    var token = prefs.getString('x-access-token');
    var uid = prefs.getString('userId');

    try {
      if (token == '' || uid == '') {
        var newUser = await signInUser(fcm: fcmToken);
        prefs.setString('x-access-token', newUser['token']);
        prefs.setString('userId', newUser['userId']);
      } else {
        futures.add(getUser(targetUid: uid, token: token));
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
