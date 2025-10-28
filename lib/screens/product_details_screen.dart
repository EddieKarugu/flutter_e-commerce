import 'package:flutter/material.dart';
import 'package:phanstore/widgets/product_container.dart';

import '../dummy_data.dart';

class ProductDetailsScreen extends StatefulWidget {
  final Map<String, dynamic> product;
  const ProductDetailsScreen({super.key, required this.product});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  bool isCarted = false;
  bool isFaved = false;
  bool isStarred = false;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final bool isWideScreen = screenSize.width > 600;
    final width = screenSize.width;

    return Scaffold(
      body: SafeArea(
        child: isWideScreen
            ? Row(
                children: [
                  SizedBox(
                    width: screenSize.width * .4,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Theme.of(
                                  context,
                                ).colorScheme.primary,
                                foregroundColor: Colors.white,
                                shape: const CircleBorder(),
                                padding: const EdgeInsets.all(10),
                                elevation: 10,
                              ),
                              child: Icon(Icons.arrow_back),
                            ),
                            const Text('Product Details'),
                          ],
                        ),
                        const Spacer(),
                        Container(
                          constraints: BoxConstraints(maxHeight: 300),
                          child: Image.asset(
                            'assets/images/${widget.product['image']}',
                          ),
                        ),
                        const Spacer(),
                        Text('${widget.product['name']}'),
                        const SizedBox(height: 10),
                        Text('${widget.product['description']}'),
                        const SizedBox(height: 10),
                        Text('Ksh ${widget.product['price']}'),
                        const Spacer(),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  children: [
                                    InkWell(
                                      splashColor: Theme.of(
                                        context,
                                      ).colorScheme.primary,
                                      onTap: () {
                                        setState(() {
                                          isFaved = !isFaved;
                                        });
                                      },
                                      child: Icon(
                                        isFaved
                                            ? Icons.favorite
                                            : Icons.favorite_border,
                                        color: Colors.red,
                                        size: 40,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      'Favourites',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      softWrap: false,
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    InkWell(
                                      splashColor: Theme.of(
                                        context,
                                      ).colorScheme.primary,
                                      onTap: () {
                                        setState(() {
                                          isStarred = !isStarred;
                                        });
                                      },
                                      child: Icon(
                                        isStarred
                                            ? Icons.star
                                            : Icons.star_border,
                                        color: Colors.red,
                                        size: 40,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      'Wishlist',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      softWrap: false,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            AnimatedContainer(
                              duration: const Duration(milliseconds: 3000),
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    isCarted = !isCarted;
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: isCarted
                                      ? Colors.green
                                      : Theme.of(context).colorScheme.primary,
                                  foregroundColor: Colors.white,
                                  maximumSize: const Size(300, 50),
                                  padding: EdgeInsets.symmetric(
                                    vertical: 22,
                                    horizontal: 10,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                      isCarted ? 10 : 30,
                                    ),
                                  ),
                                ),
                                child: isCarted
                                    ? Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.check),
                                          Text('Added to Cart'),
                                        ],
                                      )
                                    : Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.shopping_cart),
                                          Text('Add to Cart'),
                                        ],
                                      ),
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        const Text('More Food Options'),
                        const SizedBox(height: 20),
                        Expanded(
                          child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: width > 800 ? 5 : 3,
                                  mainAxisSpacing: 10,
                                  childAspectRatio: .72,
                                  crossAxisSpacing: 10,
                                ),
                            itemBuilder: (context, index) {
                              return ProductContainer(product: products[index]);
                            },
                            itemCount: products.length,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            : Padding(
                padding: const EdgeInsets.all(14.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Theme.of(
                                context,
                              ).colorScheme.primary,
                              foregroundColor: Colors.white,
                              shape: const CircleBorder(),
                              padding: const EdgeInsets.all(10),
                              elevation: 10,
                            ),
                            child: Icon(Icons.arrow_back),
                          ),
                          const Text('Product Details'),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Container(
                        constraints: BoxConstraints(maxHeight: 300),
                        child: Image.asset(
                          'assets/images/${widget.product['image']}',
                        ),
                      ),
                      const SizedBox(height: 20),
                     Align(
                       alignment: Alignment.centerLeft,
                       child:  Text('${widget.product['name']}',
                         style: TextStyle(
                           color: Theme.of(context).colorScheme.secondary,
                           fontSize: 20,
                           fontWeight: FontWeight.bold,
                         )
                       ),
                     ),
                      const SizedBox(height: 10),
                      Text(
                        'Bursting with Freshness & Flavor: Dive into a vibrant symphony of garden-fresh ingredients, expertly combined to invigorate your palate and nourish your body. Pure, wholesome goodness in every colorful mouthful.'
                        '${widget.product['description']}',
                      ),
                      const SizedBox(height: 10),
                     Align(
                       alignment: Alignment.centerLeft,
                       child:  Row(
                         children: [
                           Text('Price: ',
                             style: TextStyle(
                               fontSize: 20,
                               fontWeight: FontWeight.bold,
                           ),
                                                ),
                           Text('Ksh ${widget.product['price']}',
                             style: TextStyle(
                               color: Theme.of(context).colorScheme.secondary,
                               fontSize: 20,
                               fontWeight: FontWeight.bold,
                             ),
                           ),
                         ],
                       )),
                      const SizedBox(height: 20),
                      SizedBox(
                        height: 200,
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'More from our store',
                                style: TextStyle(
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.secondary,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Expanded(
                              child: ListView.builder(
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0,
                                    ),
                                    child: ProductContainer(
                                      product: products[index],
                                    ),
                                  );
                                },
                                itemCount: products.length,
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  InkWell(
                                    splashColor: Theme.of(
                                      context,
                                    ).colorScheme.primary,
                                    onTap: () {
                                      setState(() {
                                        isFaved = !isFaved;
                                      });
                                    },
                                    child: Icon(
                                      isFaved
                                          ? Icons.favorite
                                          : Icons.favorite_border,
                                      color: Colors.red,
                                      size: 40,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    'Favourites',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    softWrap: false,
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  InkWell(
                                    splashColor: Theme.of(
                                      context,
                                    ).colorScheme.primary,
                                    onTap: () {
                                      setState(() {
                                        isStarred = !isStarred;
                                      });
                                    },
                                    child: Icon(
                                      isStarred
                                          ? Icons.star
                                          : Icons.star_border,
                                      color: Colors.red,
                                      size: 40,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    'Wishlist',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    softWrap: false,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 1200),
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  isCarted = !isCarted;
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: isCarted
                                    ? Colors.green
                                    : Theme.of(context).colorScheme.primary,
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 22,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    isCarted ? 10 : 30,
                                  ),
                                ),
                                maximumSize: const Size(300, 50),
                              ),
                              child: isCarted
                                  ? Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.check),
                                        Text('Added to Cart'),
                                      ],
                                    )
                                  : Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.shopping_cart),
                                        Text('Add to Cart'),
                                      ],
                                    ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
