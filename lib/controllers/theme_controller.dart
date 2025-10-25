import 'package:flutter/material.dart';
import 'package:phanstore/initializers/shared_preferences.dart';

class ThemeController{
  static final int _defaultTheme =  UserPrefs.prefs?.getInt('phanStoreTheme') ?? 2;
  static  ValueNotifier<int> currentTheme = ValueNotifier(_defaultTheme);
}