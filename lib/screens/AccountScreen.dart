import 'package:flutter/material.dart';
import 'package:phanstore/controllers/theme_controller.dart';

import '../initializers/shared_preferences.dart';

class Accountscreen extends StatefulWidget {
  const Accountscreen({super.key});

  @override
  State<Accountscreen> createState() => _AccountscreenState();
}

class _AccountscreenState extends State<Accountscreen> {
  int groupValue =  ThemeController.currentTheme.value;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account & Settings'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.deepPurple,
                    backgroundImage: AssetImage('assets/images/chef.png'),
                    radius: 40,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Phantom',
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  Text('Phantom@gmail.com'),
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.centerLeft,
                    child:  const Text('Preferred Theme'),
                  ),
                  Column(
                    children: [
                      RadioListTile(
                        value: 0,
                        groupValue: groupValue,
                        onChanged: (value) {
                          setState(() {
                            ThemeController.currentTheme.value = value!;
                            groupValue = value;
                            UserPrefs.prefs?.setInt('phanStoreTheme', value);
                          });
                        },
                        title: const Row(
                          children: [
                            Icon(Icons.light_mode),
                            SizedBox(width: 10),
                            Text('Light Theme'),
                          ],
                        ),
                      ),
                      RadioListTile(
                        value: 1,
                        groupValue: groupValue,
                        onChanged: (value) {
                          setState(() {
                            ThemeController.currentTheme.value = value!;
                            groupValue = value;
                            UserPrefs.prefs?.setInt('phanStoreTheme', value);
                          });
                        },
                        title: const Row(
                          children: [
                            Icon(Icons.dark_mode),
                            SizedBox(width: 10),
                            Text('Dark Theme'),
                          ],
                        ),
                      ),
                      RadioListTile(
                        value: 2,
                        groupValue: groupValue,
                        onChanged: (value) {
                          setState(() {
                            ThemeController.currentTheme.value = value!;
                            groupValue = value;
                            UserPrefs.prefs?.setInt('phanStoreTheme', value);
                          });
                        },
                        title: const Row(
                           mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.settings),
                            SizedBox(width: 10),
                            Text('Follow System'),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
