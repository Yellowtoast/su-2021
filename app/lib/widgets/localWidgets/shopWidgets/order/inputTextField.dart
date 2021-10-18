import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:schooluniform/configs/color.dart';

class InputLabel extends StatelessWidget {
  const InputLabel({Key key, @required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      child: Text(
        text,
        style: GoogleFonts.notoSans(fontSize: 12),
      ),
    );
  }
}

class InputTextField extends StatelessWidget {
  const InputTextField(
      {Key key, this.inputDecoration, this.onChanged, this.maxTextLength})
      : super(key: key);

  final InputDecoration inputDecoration;
  final Function onChanged;
  final int maxTextLength;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 24),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration:
            BoxDecoration(border: Border.all(width: 1, color: BGColors.grey3)),
        child: TextField(
          onChanged: onChanged,
          cursorColor: BGColors.colorSig1,
          keyboardType: TextInputType.text,
          decoration: inputDecoration,
          maxLength: maxTextLength,
        ),
      ),
    );
  }
}
