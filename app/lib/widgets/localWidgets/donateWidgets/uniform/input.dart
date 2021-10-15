import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:schooluniform/configs/boxDeco.dart';
import 'package:schooluniform/configs/color.dart';

class InputWidget extends StatelessWidget {
  final String label;
  final Function onChanged;
  final String placeholder;
  final int maxLength;
  InputWidget({this.label, this.onChanged, this.placeholder, this.maxLength});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 8),
          child: Text(
            label,
            style: GoogleFonts.notoSans(fontSize: 12),
          ),
        ),
        Container(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: BGColors.grey3)),
            child: TextField(
              onChanged: onChanged,
              cursorColor: colorSig1,
              keyboardType: TextInputType.streetAddress,
              decoration: inputDecoStyle(placeholder),
              maxLength: maxLength,
            ),
          ),
        ),
      ],
    );
  }
}
