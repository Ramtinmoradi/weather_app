import 'package:flutter/material.dart';

class MainColor {
  static Color backgroundColor = const Color(0xffFCFCFC);
  static Color searchBoxBorderColor = const Color(0xff3C76AB);
}

class MainGradientColor {
  static LinearGradient searchIconColor = const LinearGradient(
    begin: Alignment(0.78, -0.62),
    end: Alignment(-0.78, 0.62),
    colors: <Color>[
      Color(0xff7CC6F0),
      Color(0xff21538D),
    ],
  );
}
