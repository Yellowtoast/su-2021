import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:schooluniform/widgets/localWidgets/shopWidgets/order/LinkToLocation.dart';

class SelectButtonLabel extends StatelessWidget {
  const SelectButtonLabel({Key key, this.mainLabel, this.secondaryLabel})
      : super(key: key);
  final String mainLabel;
  final String secondaryLabel;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              mainLabel,
              style: GoogleFonts.notoSans(fontSize: 14, height: 1),
            ),
            Container(
              margin: EdgeInsets.only(left: 4),
              child: LinkToLocation(),
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.only(bottom: 8),
        ),
        Text(
          secondaryLabel,
          style: GoogleFonts.notoSans(
              fontSize: 12, color: Color(0xff666666), height: 1),
        ),
      ],
    );
  }
}
