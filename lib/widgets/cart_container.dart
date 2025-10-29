import 'package:flutter/material.dart';

class CartContainer extends StatefulWidget {
  final Map<String, dynamic> carted;
  const CartContainer({super.key, required this.carted});

  @override
  State<CartContainer> createState() => _CartContainerState();
}

class _CartContainerState extends State<CartContainer> {
  int noOfItems = 1;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CircleAvatar(
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  backgroundImage: AssetImage(
                    'assets/images/${widget.carted['image']}',
                  ),
                  radius: 30,
                ),
                const SizedBox(height: 10),
                Text(
                  'Price: Ksh ${widget.carted['price']}',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  widget.carted['name'],
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    FilledButton(
                      onPressed: () {
                        setState(() {
                          noOfItems > 1 ? noOfItems-- : noOfItems;
                        });
                      },
                      style: FilledButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.horizontal(
                            left: Radius.circular(12),
                          ),
                        ),
                        padding: EdgeInsets.all(0)
                      ),
                      child: Icon(Icons.remove),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: Text(
                        noOfItems.toString(),
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    FilledButton(
                      onPressed: () {
                        setState(() {
                          noOfItems++;
                        });
                      },
                      style: FilledButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.horizontal(
                            right: Radius.circular(12),
                          ),
                        ),
                        padding: EdgeInsets.all(0)
                      ),
                      child: Icon(Icons.add),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Text(
                  'Total: ${widget.carted['price'] * noOfItems}',
                  style: TextStyle(),
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.delete, color: Colors.red),
                    ),
                    PopupMenuButton(
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          child: Text('Add to Favourites'),
                          onTap: () {},
                        ),
                        PopupMenuItem(
                          child: Text('Add to Wishlist'),
                          onTap: () {},
                        ),
                        PopupMenuItem(
                          child: Text('Remove from Cart'),
                          onTap: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
