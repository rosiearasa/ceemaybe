import 'package:cee_prototype/screens/launch_screen.dart';
import 'package:cee_prototype/theme/theme_constants.dart';
import 'package:cee_prototype/theme/theme_manager.dart';

import 'package:flutter/material.dart';

ThemeManager _themeManager = ThemeManager();

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
    
      title: "CEE Health",
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: _themeManager.themeMode,
      // home: const SplashScreen(),
    home: const SplashScreen(),
    );
  }
}
