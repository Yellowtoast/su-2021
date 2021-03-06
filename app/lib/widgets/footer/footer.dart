import 'package:flutter/material.dart';
import 'package:schooluniform/configs/stores.dart';
import 'package:schooluniform/configs/style/footerStyle.dart';
import 'package:url_launcher/url_launcher.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 48),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 12),
            child: Text(
              "북구 행복나눔은 대구광역시 북구에서 운영하고 있습니다.",
              style: footerStyle,
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 8),
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "북구청 복지정책과",
                  style: footerStyle,
                ),
                Container(
                  margin: EdgeInsets.only(left: 8),
                  child: GestureDetector(
                    onTap: () =>
                        launch("tel://${BGinfoStore.localInfo["officePhone"]}"),
                    child: Text(
                      "${BGinfoStore.localInfo["officePhone"]}",
                      style: footerStyle,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 8),
                  child: GestureDetector(
                    onTap: () => launch(
                        "tel://${BGinfoStore.localInfo["officePhoneDonation"]}"),
                    child: Text(
                      "${BGinfoStore.localInfo["officePhoneDonation"]}",
                      style: footerStyle,
                    ),
                  ),
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () => launch("tel://${BGinfoStore.localInfo["centerPhone"]}"),
            child: Text(
              "북구자원봉사센터 ${BGinfoStore.localInfo["centerPhone"]}",
              style: footerStyle,
            ),
          )
        ],
      ),
    );
  }
}
