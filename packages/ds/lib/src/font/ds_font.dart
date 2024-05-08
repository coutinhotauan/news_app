import 'package:ds/ds.dart';
import 'package:flutter/material.dart';

class DSFonts {
  DSFonts();

  final TextStyle titleMedium = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: const DSColors().black,
  );

  final TextStyle bodyMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: const DSColors().black,
  );
}

extension TextStyleExt on TextStyle {
  TextStyle fontSize(double size) => copyWith(fontSize: size);
  TextStyle color(Color color) => copyWith(color: color);
}
