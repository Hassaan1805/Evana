import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Evana Brand Colors - Women empowerment theme
const Color lightBackground = Color(0xFFFCFCF9); // Warm cream background
const Color lightSurface = Color(0xFFFFFFFF); // Pure white surface
const Color lightPrimary =
    Color(0xFFE91E63); // Pink primary - women empowerment
const Color lightSecondary = Color(0xFFAD1457); // Darker pink secondary
const Color lightAccent = Color(0xFFF8BBD9); // Light pink accent
const Color lightText = Color(0xFF2C2C2C); // Dark gray text
const Color lightTextSecondary = Color(0xFF666666); // Medium gray text

const Color darkBackground = Color(0xFF1A1A1A); // Dark background
const Color darkSurface = Color(0xFF2D2D2D); // Dark surface
const Color darkPrimary = Color(0xFFEC407A); // Lighter pink for dark mode
const Color darkSecondary = Color(0xFFC2185B); // Pink secondary for dark
const Color darkAccent = Color(0xFF4A148C); // Purple accent for dark
const Color darkText = Color(0xFFF5F5F5); // Light gray text
const Color darkTextSecondary = Color(0xFFBDBDBD); // Medium light gray text

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: lightPrimary,
  scaffoldBackgroundColor: lightBackground,
  cardColor: lightSurface,
  colorScheme: const ColorScheme.light(
    primary: lightPrimary,
    secondary: lightSecondary,
    surface: lightSurface,
    background: lightBackground,
    onPrimary: Colors.white,
    onSecondary: Colors.white,
    onSurface: lightText,
    onBackground: lightText,
  ),
  textTheme: GoogleFonts.poppinsTextTheme(ThemeData.light().textTheme).copyWith(
    bodyLarge: const TextStyle(color: lightText, fontSize: 16),
    bodyMedium: const TextStyle(color: lightTextSecondary, fontSize: 14),
    headlineLarge: const TextStyle(
        color: lightText, fontWeight: FontWeight.bold, fontSize: 32),
    headlineMedium: const TextStyle(
        color: lightText, fontWeight: FontWeight.bold, fontSize: 24),
    headlineSmall: const TextStyle(
        color: lightText, fontWeight: FontWeight.bold, fontSize: 20),
    titleLarge: const TextStyle(
        color: lightText, fontWeight: FontWeight.w600, fontSize: 18),
    titleMedium: const TextStyle(
        color: lightText, fontWeight: FontWeight.w600, fontSize: 16),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: lightSurface,
    foregroundColor: lightText,
    elevation: 1,
    shadowColor: Colors.black12,
    titleTextStyle: TextStyle(
      color: lightText,
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: lightSurface,
    selectedItemColor: lightPrimary,
    unselectedItemColor: lightTextSecondary,
    type: BottomNavigationBarType.fixed,
    elevation: 8,
    selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: lightPrimary,
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      elevation: 2,
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: lightPrimary,
      side: const BorderSide(color: lightPrimary, width: 2),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
    ),
  ),
  cardTheme: CardThemeData(
    color: lightSurface,
    elevation: 2,
    shadowColor: Colors.black12,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: Colors.grey[300]!),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: lightPrimary, width: 2),
    ),
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
    labelStyle: TextStyle(color: lightTextSecondary),
    hintStyle: TextStyle(color: lightTextSecondary),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: lightPrimary,
    foregroundColor: Colors.white,
  ),
);

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: darkPrimary,
  scaffoldBackgroundColor: darkBackground,
  cardColor: darkSurface,
  colorScheme: const ColorScheme.dark(
    primary: darkPrimary,
    secondary: darkSecondary,
    surface: darkSurface,
    background: darkBackground,
    onPrimary: Colors.white,
    onSecondary: Colors.white,
    onSurface: darkText,
    onBackground: darkText,
  ),
  textTheme: GoogleFonts.poppinsTextTheme(ThemeData.dark().textTheme).copyWith(
    bodyLarge: const TextStyle(color: darkText, fontSize: 16),
    bodyMedium: const TextStyle(color: darkTextSecondary, fontSize: 14),
    headlineLarge: const TextStyle(
        color: darkText, fontWeight: FontWeight.bold, fontSize: 32),
    headlineMedium: const TextStyle(
        color: darkText, fontWeight: FontWeight.bold, fontSize: 24),
    headlineSmall: const TextStyle(
        color: darkText, fontWeight: FontWeight.bold, fontSize: 20),
    titleLarge: const TextStyle(
        color: darkText, fontWeight: FontWeight.w600, fontSize: 18),
    titleMedium: const TextStyle(
        color: darkText, fontWeight: FontWeight.w600, fontSize: 16),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: darkSurface,
    foregroundColor: darkText,
    elevation: 1,
    shadowColor: Colors.black26,
    titleTextStyle: TextStyle(
      color: darkText,
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: darkSurface,
    selectedItemColor: darkPrimary,
    unselectedItemColor: darkTextSecondary,
    type: BottomNavigationBarType.fixed,
    elevation: 8,
    selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: darkPrimary,
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      elevation: 2,
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: darkPrimary,
      side: const BorderSide(color: darkPrimary, width: 2),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
    ),
  ),
  cardTheme: CardThemeData(
    color: darkSurface,
    elevation: 2,
    shadowColor: Colors.black26,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: Colors.grey[600]!),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: darkPrimary, width: 2),
    ),
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
    labelStyle: TextStyle(color: darkTextSecondary),
    hintStyle: TextStyle(color: darkTextSecondary),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: darkPrimary,
    foregroundColor: Colors.white,
  ),
);
