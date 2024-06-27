import 'package:flutter/material.dart';
import 'package:gato/config/config.dart';


class FontsConfig {
  static const String fontFamily = 'Schyler';

  static const TextStyle regular = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.normal,
  );

  static const TextStyle italic = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontStyle: FontStyle.italic,
    fontWeight: FontWeight.normal,
  );

}
