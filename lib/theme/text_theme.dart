import 'package:flutter/material.dart';

TextTheme textTheme = const TextTheme(
  headline4: _TextStyles.headline4,
  headline5: _TextStyles.headline5,
  headline6: _TextStyles.headline6,
  subtitle1: _TextStyles.subtitle1,
  subtitle2: _TextStyles.subtitle2,
  bodyText1: _TextStyles.bodyText1,
  bodyText2: _TextStyles.bodyText2,
);

class _TextStyles {
  static const TextStyle headline6 = TextStyle(
    fontFamily: 'Avenir',
    fontSize: 34.0,
    color: Colors.black,
  );
  static const TextStyle headline5 = TextStyle(
    fontFamily: 'Avenir',
    fontSize: 26.0,
    color: Colors.black,
  );
  static const TextStyle headline4 = TextStyle(
    fontFamily: 'Avenir',
    fontSize: 24.0,
    color: Colors.black,
  );
  static const TextStyle subtitle1 = TextStyle(
    fontFamily: 'Avenir',
    fontSize: 15.0,
    color: Colors.black,
  );
  static const TextStyle subtitle2 = TextStyle(
    fontFamily: 'Avenir',
    fontSize: 20.0,
    color: Colors.black,
  );
  static const TextStyle bodyText1 = TextStyle(
    fontFamily: 'Avenir',
    fontSize: 18.0,
    color: Colors.black,
  );
  static const TextStyle bodyText2 = TextStyle(
    fontFamily: 'Avenir',
    fontSize: 14.0,
    color: Colors.black,
  );
}
