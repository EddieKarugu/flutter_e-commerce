import 'package:flutter/material.dart';
import 'package:phanstore/controllers/theme_controller.dart';
import 'package:phanstore/screens/landingScreen.dart';

import 'initializers/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserPrefs.init();
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
          theme: ThemeData.light(useMaterial3: true),
          darkTheme: ThemeData.dark(useMaterial3: true),
          home: LandingScreen(),
          themeMode: currentTheme == 0? ThemeMode.light
              : currentTheme == 1? ThemeMode.dark
              : ThemeMode.system,
        );
      },
    );
  }
}
