import 'package:flutter/material.dart';
import 'package:phanstore/screens/AccountScreen.dart';
import 'package:phanstore/screens/WalletScreen.dart';
import 'package:phanstore/screens/cart_screen.dart';
import 'package:phanstore/screens/home_screen.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  final List<Widget> screens = [
    const HomeScreen(),
    const CartScreen(),
    const Walletscreen(),
    const Accountscreen(),
  ];

  final List<String> titles = ['Home', 'Cart', 'Wallet', 'Account'];

  int activeScreenIndex = 0;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isWideScreen = screenSize.width >= 600;
    return Scaffold(
      bottomNavigationBar: isWideScreen
          ? null
          : BottomNavigationBar(
              items: [
                BottomNavigationBarItem(
                  icon: const Icon(Icons.home_outlined),
                  label: 'Home',
                  activeIcon: const Icon(Icons.home),
                ),
                BottomNavigationBarItem(
                  icon: const Icon(Icons.shopping_cart_outlined),
                  label: 'Cart',
                  activeIcon: const Icon(Icons.shopping_cart),
                ),
                BottomNavigationBarItem(
                  icon: const Icon(Icons.wallet_outlined),
                  label: 'Wallet',
                  activeIcon: const Icon(Icons.wallet),
                ),
                BottomNavigationBarItem(
                  icon: const Icon(Icons.account_circle_outlined),
                  label: 'Account',
                  activeIcon: const Icon(Icons.account_circle),
                ),
              ],
              showSelectedLabels: true,
              selectedItemColor: Colors.deepPurple,
              unselectedItemColor: Colors.grey,
              currentIndex: activeScreenIndex,
              onTap: (int index) {
                setState(() {
                  activeScreenIndex = index;
                });
              },
            ),
      body: isWideScreen
          ? Column(
              children: [
                Row(
                  children: [
                    const Spacer(),
                    ShaderMask(shaderCallback: (Rect bounds){
                      return LinearGradient(colors: [
                        Colors.black,
                        Colors.deepPurple,
                        Colors.white
                      ]).createShader(bounds);
                    },
                    blendMode: BlendMode.srcIn,
                    child: FittedBox(
                      child: const Text(
                        'PHANSTORE',
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 5,
                        ),
                      ),
                    ),
                    ),
                    const Spacer(flex: 2,),
                    SizedBox(
                      height: 50,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: titles.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ActionChip(
                              pressElevation: 20,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)
                              ),
                              onPressed: (){
                                setState(() {
                                  activeScreenIndex = index;
                                });
                              },
                              label: Text(titles[index]),
                              backgroundColor: activeScreenIndex == index
                                  ? Colors.deepPurple
                                  : null,
                            ),
                          );
                        },
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
                Expanded(child: screens[activeScreenIndex]),
              ],
            )
          : screens[activeScreenIndex],
    );
  }
}
