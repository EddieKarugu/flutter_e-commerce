import 'package:flutter/material.dart';
import 'package:phanstore/widgets/custom_input_field.dart';

import '../dummy_data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int activeTile = 0;
  late TextEditingController searchController;

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final bool isWideScreen = screenSize.width > 600;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            isWideScreen
                ? const SizedBox()
                :ShaderMask(shaderCallback: (Rect bounds){
                  return LinearGradient(colors: [
                    Colors.black,
                    Colors.deepPurple,
                    Colors.white
                  ]).createShader(bounds);
            }, blendMode: BlendMode.srcIn,
            child: FittedBox(
              child: Text(
                'PHANSTORE',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                  letterSpacing: 6,
                ),
              ),
            ),),
            Row(
              mainAxisAlignment: isWideScreen
                  ? MainAxisAlignment.center
                  : MainAxisAlignment.spaceBetween,
              children: [
                isWideScreen
                    ? Container(
                        constraints: BoxConstraints(maxWidth: 600),
                        child: CustomInputField(
                          icon: Icons.search,
                          hint: 'Search Food items here',
                          controller: searchController,
                          obscureText: false,
                        ),
                      )
                    : Expanded(
                        child: CustomInputField(
                          icon: Icons.search,
                          hint: 'Search Food items here',
                          controller: searchController,
                          obscureText: false,
                        ),
                      ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: InkWell(
                    onTap: () {},
                    splashColor: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      margin: const EdgeInsets.all(3),
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(Icons.search, size: 40),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 70,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 12.0,
                      horizontal: 4,
                    ),
                    child: ActionChip(
                      label: Row(
                        children: [
                          Image.asset(
                            'assets/images/${tiles[index]['image']}',
                            width: 30,
                            height: 30,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8.0,
                            ),
                            child: Text(tiles[index]['name']),
                          ),
                        ],
                      ),
                      backgroundColor: activeTile == index
                          ? Colors.deepPurple
                          : null,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(color: Colors.deepPurple, width: 1),
                      ),
                      onPressed: () {
                        setState(() {
                          activeTile = index;
                        });
                      },
                    ),
                  );
                },
                itemCount: tiles.length,
                scrollDirection: Axis.horizontal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
