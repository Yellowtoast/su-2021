import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:mobx/mobx.dart';
import 'package:schooluniform/routes/api/info.dart';
import 'package:schooluniform/routes/api/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:schooluniform/routes/api/networkHandler.dart';

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

      ///api/info/getData
    ];

    String fcmToken = await FirebaseMessaging.instance.getToken();
    // print(fcmToken);
    final SharedPreferences prefs = await SharedPreferences.getInstance();

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
    print(token);
    var uid = prefs.getString('userId');
    print(uid);

    try {
      if (token != '' || uid != '') {
        var user =
            await NetworkHandler().get('${UserApiRoutes.GET}?targetUid=$uid');

        if (user == null) {
          var newUser = await NetworkHandler()
              .signinPost(UserApiRoutes.SIGN_IN, signInInfo);
          print(newUser);
          prefs.setString('x-access-token', newUser["token"]);
          prefs.setString('userId', newUser["userId"]);
          userInfo = userInitialData;
        } else {
          userInfo = user['alarms'];
        }
      } else {
        var newUser =
            await NetworkHandler().post(UserApiRoutes.SIGN_IN, signInInfo);
        prefs.setString('x-access-token', newUser["token"]);
        prefs.setString('userId', newUser["userId"]);
        userInfo = userInitialData;
      }
      List res = await Future.wait(futures);
      localInfo = res[0];
    } catch (err) {
      print(err);
    }
  }

  @action
  void updateUserData(key, value) {
    userInfo[key] = value;
  }
}
