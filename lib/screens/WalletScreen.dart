import 'package:flutter/material.dart';
import 'package:phanstore/widgets/transaction_container.dart';
import 'package:phanstore/widgets/wallet_actions_button.dart';

class Walletscreen extends StatefulWidget {
  const Walletscreen({super.key});

  @override
  State<Walletscreen> createState() => _WalletscreenState();
}

class _WalletscreenState extends State<Walletscreen> {
  bool isHidden = false;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isWideScreen = screenSize.width > 600;
    final isTablet = screenSize.width > 600 && screenSize.width <= 1024;

    return Scaffold(
      body: CustomScrollView(
        slivers: isWideScreen
            ? [
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  floating: true,
                  pinned: false,
                  backgroundColor: Theme.of(context).colorScheme.surface,
                  expandedHeight: 120,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Welcome Back!',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'John Doe',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.secondary,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const VerticalDivider(),
                        Flexible(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Wallet',
                                    style: TextStyle(
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.secondary,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 5.0,
                                        ),
                                        child: Text(
                                          isHidden ? 'Show Bal' : 'Hide Bal',
                                          style: TextStyle(
                                            color: Theme.of(
                                              context,
                                            ).colorScheme.secondary,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            isHidden = !isHidden;
                                          });
                                        },
                                        borderRadius: BorderRadius.circular(
                                          100,
                                        ),
                                        splashColor: Theme.of(
                                          context,
                                        ).colorScheme.secondary,
                                        child: Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: Icon(
                                            !isHidden
                                                ? Icons.visibility_off
                                                : Icons.visibility,
                                            color: Theme.of(
                                              context,
                                            ).colorScheme.secondary,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const Divider(),
                              Text(isHidden ? '\$ ********' : '\$ 300,000'),
                              const Text(
                                'Current Balance',
                                style: TextStyle(color: Color(0xff00ff00)),
                              ),
                            ],
                          ),
                        ),
                        const VerticalDivider(),
                        Flexible(
                          flex: 3,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  WalletActionsButton(
                                    hint: 'Send',
                                    icon: Icons.send,
                                  ),
                                  WalletActionsButton(
                                    hint: 'Request',
                                    icon: Icons.request_page,
                                  ),
                                  WalletActionsButton(
                                    hint: 'Top up',
                                    icon: Icons.add,
                                  ),
                                ],
                              ),
                              const Divider(),
                              const Text('Quick Actions'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SliverGrid(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: isTablet ? 2 : 3,
                    childAspectRatio: 4,
                  ),
                  delegate: SliverChildBuilderDelegate((context, index) {
                    return TransactionContainer(
                      index: index + 1,
                      isCrediting: index.isEven,
                    );
                  }, childCount: 20),
                ),
                SliverFillRemaining(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.lightbulb,
                        size: 40,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Explore New Features',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Stay tuned for the latest updates and improvements',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                      const SizedBox(height: 20),
                      FilledButton(
                        onPressed: () {},
                        child: const Text('Learn More'),
                      ),
                    ],
                  ),
                ),
              ]
            : [
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  pinned: false,
                  floating: false,
                  backgroundColor: Theme.of(context).colorScheme.surface,
                  expandedHeight: 70,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Column(
                            children: [
                              const Text(
                                'Welcome Back!',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'John Doe',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.secondary,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  pinned: false,
                  floating: true,
                  backgroundColor: Theme.of(context).cardColor,
                  expandedHeight: 120,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              'Wallet',
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.secondary,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 5.0,
                                ),
                                child: Text(
                                  isHidden ? 'Show Bal' : 'Hide Bal',
                                  style: TextStyle(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.secondary,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    isHidden = !isHidden;
                                  });
                                },
                                borderRadius: BorderRadius.circular(100),
                                splashColor: Theme.of(
                                  context,
                                ).colorScheme.secondary,
                                child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Icon(
                                    !isHidden
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.secondary,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Text(isHidden ? '\$ ********' : '\$ 300,000'),
                          const Text(
                            'Current Balance',
                            style: TextStyle(color: Color(0xff00ff00)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  pinned: true,
                  floating: false,
                  toolbarHeight: 120,
                  expandedHeight: 120,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              WalletActionsButton(
                                hint: 'Send',
                                icon: Icons.send,
                              ),
                              WalletActionsButton(
                                hint: 'Request',
                                icon: Icons.request_page,
                              ),
                              WalletActionsButton(
                                hint: 'Top up',
                                icon: Icons.add,
                              ),
                            ],
                          ),
                          const Divider(),
                          const Text('Quick Actions'),
                        ],
                      ),
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    return TransactionContainer(
                      index: index + 1,
                      isCrediting: index.isEven,
                    );
                  }, childCount: 16),
                ),
          SliverFillRemaining(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.lightbulb,
                  size: 40,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                const SizedBox(height: 20),
                Text(
                  'Explore New Features',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Stay tuned for the latest updates and improvements',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
                const SizedBox(height: 20),
                FilledButton(
                  onPressed: () {},
                  child: const Text('Learn More'),
                ),
              ],
            ),
          ),
              ],
      ),
    );
  }
}
