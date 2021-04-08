import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:schooluniform/configs/stores.dart';
import 'package:schooluniform/constants/theme.dart';
import 'package:url_launcher/url_launcher.dart';

class SelectDeliveryTypeWidget extends StatelessWidget {
  final String deliveryType;
  final String label;
  final String displayLabel;
  final String displaySecondaryLabel;
  final Function onClick;
  final dynamic actionButton;

  SelectDeliveryTypeWidget({
    @required this.deliveryType,
    this.label,
    this.displayLabel,
    this.displaySecondaryLabel,
    this.onClick,
    this.actionButton,
  }) {
    assert(this.deliveryType != null);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        height: 46,
        color: Colors.transparent,
        child: Row(
          children: [
            Container(
              alignment: Alignment.center,
              width: 18,
              height: 18,
              margin: EdgeInsets.only(right: 8),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                      color: deliveryType == label ? Colors.black : grey6)),
              child: deliveryType == label
                  ? Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.black),
                    )
                  : Container(),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      displayLabel,
                      style: GoogleFonts.notoSans(fontSize: 14, height: 1),
                    ),
                    // Observer(
                    //     builder: (_) => Container(
                    //           margin: EdgeInsets.only(left: 4),
                    //           child: GestureDetector(
                    //             onTap: () => launch(
                    //                 infoStore.localInfo["centerAddress"]),
                    //             child: Text(
                    //               "위치보기",
                    //               style: GoogleFonts.notoSans(
                    //                   color: colorSig1,
                    //                   fontWeight: FontWeight.bold,
                    //                   fontSize: 12),
                    //             ),
                    //           ),
                    //         )),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 8),
                ),
                Text(
                  displaySecondaryLabel,
                  style: GoogleFonts.notoSans(
                      fontSize: 12, color: Color(0xff666666), height: 1),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
