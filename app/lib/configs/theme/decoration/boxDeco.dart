import 'package:flutter/material.dart';

BoxShadow shadowSig = BoxShadow(
    offset: Offset(0, 12),
    blurRadius: 24,
    spreadRadius: -8,
    color: Color(0x8cff4a68));

InputDecoration deco(String hintText) {
  return InputDecoration(
    counterStyle: TextStyle(
      height: double.minPositive,
    ),
    counterText: "",
    enabledBorder: InputBorder.none,
    border: InputBorder.none,
    focusedBorder: InputBorder.none,
    isDense: true,
    labelStyle: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
    ),
    contentPadding: EdgeInsets.all(0),
    hintText: hintText,
    hintStyle: TextStyle(
        fontSize: 14, fontWeight: FontWeight.w500, color: Color(0xffb7b7b7)),
  );
}
