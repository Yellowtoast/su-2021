import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:mobx/mobx.dart';
import 'package:schooluniform/utils/common/get.dart';

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
      getCommon()
    ];

    String fcmToken = await FirebaseMessaging.instance.getToken();

    var userInitialData = {
      "totalAlarms": 0,
      "totalAlarmsDonate": 0,
      "totalAlarmsShop": 0,
      "totalAlarmsCart": 0,
      "fcm": fcmToken,
    };
    
    // FirebaseAuth auth = FirebaseAuth.instance;
    // User user = auth.currentUser;
    // if (user == null) {
    //   UserCredential u = await auth.signInAnonymously();
    //   futures.add(collectionUsers.doc(u.user.uid).set(userInitialData));
    // } else {
    //   futures.add(collectionUsers.doc(user.uid).get());
    //   futures.add(collectionUsers.doc(user.uid).update({"fcm": fcmToken}));
    // }

    List res = await Future.wait(futures);

    localInfo = res[0];
    userInfo = userInitialData;
  }

  @action
  void updateUserData(key, value) {
    userInfo[key] = value;
  }
}
