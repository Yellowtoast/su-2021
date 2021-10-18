import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FreshmanOrNotButton extends StatelessWidget {
  const FreshmanOrNotButton({Key key, this.text, this.onTapHandler})
      : super(key: key);

  final String text;
  final Function onTapHandler;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapHandler,
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.all(16),
        child: Text(
          text,
          style: GoogleFonts.notoSans(fontSize: 14),
        ),
      ),
    );
  }
}
