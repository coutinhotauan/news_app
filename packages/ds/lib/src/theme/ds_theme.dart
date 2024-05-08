import 'package:ds/ds.dart';
import 'package:ds/src/font/ds_font.dart';
import 'package:flutter/material.dart';

class DSTheme extends ThemeExtension<DSTheme> {
  final DSColors colors;
  final DSFonts fonts;

  DSTheme({
    required this.colors,
    required this.fonts,
  });

  @override
  ThemeExtension<DSTheme> copyWith({DSColors? colors, DSFonts? fonts}) {
    return DSTheme(
      colors: colors ?? this.colors,
      fonts: fonts ?? this.fonts,
    );
  }

  @override
  ThemeExtension<DSTheme> lerp(covariant ThemeExtension<DSTheme>? other, double t) {
    return this;
  }

  ThemeData buildTheme() {
    return ThemeData(
      extensions: <ThemeExtension<dynamic>>[this],
      primaryColor: colors.grey1,
      cardColor: colors.grey1,
      appBarTheme: AppBarTheme(
        color: colors.grey1,
      ),
      textTheme: TextTheme(
        titleMedium: fonts.titleMedium,
        bodyMedium: fonts.bodyMedium,
      ),
    );
  }
}
