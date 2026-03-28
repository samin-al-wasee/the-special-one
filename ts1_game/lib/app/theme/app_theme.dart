import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get light {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
      scaffoldBackgroundColor: const Color(0xFFF7F7F7),
      appBarTheme: const AppBarTheme(
        centerTitle: false,
        elevation: 0,
      ),
    );
  }
}
