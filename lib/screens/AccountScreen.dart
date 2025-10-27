import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:phanstore/controllers/theme_controller.dart';

import '../initializers/shared_preferences.dart';

class Accountscreen extends StatefulWidget {
  const Accountscreen({super.key});

  @override
  State<Accountscreen> createState() => _AccountscreenState();
}

class _AccountscreenState extends State<Accountscreen> {
  int groupValue = ThemeController.currentTheme.value;

  String imagePath = '';

  @override
  void initState() {
    super.initState();
    imagePath = UserPrefs.prefs?.getString('phanStoreImage') ?? '';
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final bool isWideScreen = screenSize.width > 600;

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
                  Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          backgroundColor: Theme.of(context).colorScheme.primary,
                          backgroundImage: imagePath.isEmpty
                              ? AssetImage('assets/images/chef.png')
                              : FileImage(File(imagePath)),
                          radius: 40,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          selectImage();
                        },
                        icon: Icon(Icons.edit_note_sharp),
                      ),
                    ],
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
                    child: const Text('Preferred Theme'),
                  ),
                  isWideScreen?
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: RadioListTile(
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
                      ),
                      Flexible(
                        child: RadioListTile(
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
                      ),
                      Flexible(
                        child: RadioListTile(
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
                      ),
                    ],
                  )
                  :Column(
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
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> selectImage() async {
    final selectedImage = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );

    if (selectedImage != null) {
      setState(() {
        imagePath = selectedImage.path;
        UserPrefs.prefs?.setString('phanStoreImage', imagePath);
      });
    }
  }
}
