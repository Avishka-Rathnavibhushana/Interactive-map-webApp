import 'package:flutter/material.dart';

class AppColors{
  //colors
  static const Color white = Colors.white;

//Primary Palette
  static const Color night = Color(0xFF263349);
  static const Color sea = Color(0xFF003C71);

//Gradients
  static const LinearGradient seaToSky = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: <Color>[
      sea,
      sky,
    ], // red to yellow
    tileMode: TileMode.clamp,
  );
  static const LinearGradient fogToWhite = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: <Color>[
      fog,
      white,
    ], // red to yellow
    tileMode: TileMode.clamp,
  );

//Secondary Palette
  static const Color fern = Color(0xFFCDDF4A);
  static const Color sky = Color(0xFF006AA6);

//Neutral Palette
  static const Color ash = Color(0xFF4D4D4D);
  static const Color smoke = Color(0xFFCCCCCC);
  static const Color fog = Color(0xFFEFEFEF);
}
