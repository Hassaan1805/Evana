import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color lightBackground = Color(0xFFFCFCF9); // --color-cream-50
const Color lightSurface = Color(0xFFFFFFFF);    // --color-cream-100
const Color lightPrimary = Color(0xFF21808D);     // --color-teal-500
const Color lightText = Color(0xFF13343B);        // --color-slate-900
const Color lightTextSecondary = Color(0xFF626C71); // --color-slate-500

const Color darkBackground = Color(0xFF1F2121); // --color-charcoal-700
const Color darkSurface = Color(0xFF262828);    // --color-charcoal-800
const Color darkPrimary = Color(0xFF32B8C6);     // --color-teal-300
const Color darkText = Color(0xFFF5F5F5);        // --color-gray-200
const Color darkTextSecondary = Color(0xFFA7A9A9); // --color-gray-300 (with opacity in CSS)

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: lightPrimary,
  scaffoldBackgroundColor: lightBackground,
  cardColor: lightSurface,
  textTheme: GoogleFonts.interTextTheme(ThemeData.light().textTheme).copyWith(
    bodyLarge: const TextStyle(color: lightText),
    bodyMedium: const TextStyle(color: lightTextSecondary),
    headlineMedium: const TextStyle(color: lightText, fontWeight: FontWeight.bold),
    headlineSmall: const TextStyle(color: lightText, fontWeight: FontWeight.bold),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: lightBackground,
    foregroundColor: lightText,
    elevation: 0,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: lightSurface,
    selectedItemColor: lightPrimary,
    unselectedItemColor: lightTextSecondary,
    type: BottomNavigationBarType.fixed,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: lightPrimary,
      foregroundColor: lightSurface,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
    ),
  ),
);

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: darkPrimary,
  scaffoldBackgroundColor: darkBackground,
  cardColor: darkSurface,
  textTheme: GoogleFonts.interTextTheme(ThemeData.dark().textTheme).copyWith(
    bodyLarge: const TextStyle(color: darkText),
    bodyMedium: const TextStyle(color: darkTextSecondary),
    headlineMedium: const TextStyle(color: darkText, fontWeight: FontWeight.bold),
    headlineSmall: const TextStyle(color: darkText, fontWeight: FontWeight.bold),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: darkBackground,
    foregroundColor: darkText,
    elevation: 0,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: darkSurface,
    selectedItemColor: darkPrimary,
    unselectedItemColor: darkTextSecondary,
    type: BottomNavigationBarType.fixed,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: darkPrimary,
      foregroundColor: darkBackground,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
    ),
  ),
);