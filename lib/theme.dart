import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MemoriaTheme {
  static const MaterialColor color = MaterialColor(
    _purplePrimaryValue,
    <int, Color>{
      50: Color(0xFFF3E5F5),
      100: Color(0xFFE1BEE7),
      200: Color(0xFFCE93D8),
      300: Color(0xFFBA68C8),
      400: Color(0xFFAB47BC),
      500: Color(_purplePrimaryValue),
      600: Color(0xFF8E24AA),
      700: Color(0xFF7B1FA2),
      800: Color(0xFF6A1B9A),
      900: Color(0xFF4A148C),
    },
  );
  static const int _purplePrimaryValue = 0xFF9C27B0;

  static const Color background = Color(0xFFE1BEE7);

  static ButtonStyle outlineButtonStyle({
    Color color = Colors.white,
    double padding = 24,
  }) {
    return OutlinedButton.styleFrom(
      foregroundColor: color,
      padding: EdgeInsets.symmetric(vertical: padding),
      side: BorderSide(color: color),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(100)),
      ),
    );
  }

  static ThemeData theme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: background,
    primarySwatch: color,
    primaryColor: color,
    textTheme: GoogleFonts.wendyOneTextTheme(
      ThemeData.light().textTheme,
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(style: outlineButtonStyle()),
    appBarTheme: ThemeData.dark().appBarTheme.copyWith(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.transparent,
          titleTextStyle: GoogleFonts.wendyOne(fontSize: 25),
        ),
  );
}
