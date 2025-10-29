import 'package:flutter/material.dart';
import 'package:phanstore/controllers/theme_controller.dart';
import 'package:phanstore/initializers/get_initializer.dart';
import 'package:phanstore/screens/landingScreen.dart';

import 'initializers/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserPrefs.init();
  GetInit.initializeControllers();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: ThemeController.currentTheme,
      builder: (context, currentTheme, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light(useMaterial3: true).copyWith(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Color(0xFFa31621), // Main branding color as seed
              primary: Color(0xFFa31621),
              onPrimary: Colors.white, // Good contrast for text/icons on primary
              secondary: Color(0xFFff9f1c),
              onSecondary: Colors.black,
              surface: Colors.white,
              onSurface: Colors.black87,
              background: Colors.white,
              error: Color(0xFFB00020),
              onError: Colors.white,
            ),
          ),
          darkTheme: ThemeData.dark(useMaterial3: true).copyWith(
            colorScheme:   ColorScheme.fromSeed(
              seedColor: Color(0xFFE4002B), // Use the same seed color
              brightness: Brightness.dark,
              primary: Color(0xFFE4002B),
              onPrimary: Colors.white,
              secondary: Color(0xFFFCCF03),
              onSecondary: Colors.black,
              surface: Color(0xFF1E1E1E),
              onSurface: Colors.white70,
              background: Color(0xFF121212),
              error: Color(0xFFCF6679),
              onError: Colors.black,
            ),
          ),
          home: LandingScreen(),
          themeMode: currentTheme == 0
              ? ThemeMode.light
              : currentTheme == 1
              ? ThemeMode.dark
              : ThemeMode.system,
        );
      },
    );
  }
}
