import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static final ThemeData lightTheme = ThemeData(
    primaryColor: const Color(0xFF699B19),
    buttonTheme: const ButtonThemeData(
      buttonColor: Color(0xFF04A24C), // Change button color to green
      textTheme: ButtonTextTheme.primary, // Set text to primary color
    ),
    indicatorColor: const Color(0xFFFCDC0C),
    hintColor: const Color(0xFF1C4494),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Color(0xFFDF3F3F)),
      bodyMedium: TextStyle(color: Color(0xFF090F13)),
      labelLarge: TextStyle(color: Color(0xFFFFFFFF)), // Change button text color to white
    ),
    colorScheme: const ColorScheme.light(
      secondary: Color(0xFF00731F),
      onPrimary: Color(0xFF101213),
      onSecondary: Color.fromARGB(255, 120, 150, 173),
      background: Color(0xFFF1F4F8),
      onBackground: Color(0xFFFFFFFF),
      surface: Color(0xFF616161),
      onSurface: Color(0xFF757575),
      error: Color(0xFFE0E0E0),
      onError: Color(0xFFEEEEEE),
    ).copyWith(background: const Color(0xFF1D2429)).copyWith(error: const Color(0xFFE21C3D)),
  );

  static final ThemeData darkTheme = ThemeData(
    primaryColor: const Color(0xFF699B19),
    buttonTheme: const ButtonThemeData(
      buttonColor: Color(0xFF04A24C), // Change button color to green
      textTheme: ButtonTextTheme.primary, // Set text to primary color
    ),
    indicatorColor: const Color(0xFFFCDC0C),
    hintColor: const Color(0xFF1C4494),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Color(0xFFDF3F3F)),
      bodyMedium: TextStyle(color: Color(0xFF090F13)),
      labelLarge: TextStyle(color: Color(0xFFFFFFFF)), // Change button text color to white
    ),
    colorScheme: const ColorScheme.dark(
      secondary: Color(0xFF00731F),
      onPrimary: Color(0xFFFFFFFF),
      onSecondary: Color(0xFF95A1AC),
      background: Color(0xFF1A1F24),
      onBackground: Color(0xFF101213),
      surface: Color(0xFFEEEEEE),
      onSurface: Color(0xFFE0E0E0),
      error: Color(0xFF757575),
      onError: Color(0xFF616161),
    ).copyWith(background: const Color(0xFF1D2429)).copyWith(error: const Color(0xFFE21C3D)),
  );
}

class CustomTheme {
  static const Color darkGreenColor = Color.fromARGB(255, 0, 32, 0); // Define your dark green color
}
