import 'package:flutter/material.dart';

class MainColor {
  static Color backgroundColor = const Color(0xffFCFCFC);
  static Color searchBoxBorderColor = const Color(0xff3C76AB);
  static Color searchBoxFontColor = const Color(0xff3C76AB);
}

class MainGradientColor {
  static LinearGradient searchIconGradient = const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: <Color>[
      Color(0xff7CC6F0),
      Color(0xff21538D),
    ],
  );
  static LinearGradient defaultWeatherGradient = const LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: <Color>[
      Color(0xffFFFFFF),
      Color(0xffFCFCFC),
    ],
  );
  static LinearGradient sunnyWeatherGradient = const LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: <Color>[
      Color(0xffF2E855),
      Color(0xffF9F47F),
    ],
  );
  static LinearGradient rainWeatherGradient = const LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: <Color>[
      Color(0xffE87A00),
      Color(0xffF3B700),
    ],
  );
  static LinearGradient snowWeatherGradient = const LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: <Color>[
      Color(0xff20B9CB),
      Color(0xff30DCE6),
    ],
  );
  static LinearGradient mistWeatherGradient = const LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: <Color>[
      Color(0xff319517),
      Color(0xff49C722),
    ],
  );
  static LinearGradient cloudsWeatherGradient = const LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: <Color>[
      Color(0xff1B83B6),
      Color(0xff2AC1DC),
    ],
  );
  static LinearGradient thunderstormWeatherGradient = const LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: <Color>[
      Color(0xff9D74C3),
      Color(0xffCFAEE3),
    ],
  );
  static LinearGradient nightGradient = const LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: <Color>[
      Color(0xff536976),
      Color(0xff292E49),
    ],
  );
  static LinearGradient dayGradient = const LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: <Color>[
      Color(0xff00D2FF),
      Color(0xff3A7BD5),
    ],
  );
}
