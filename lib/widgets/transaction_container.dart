import 'dart:math';

import 'package:flutter/material.dart';

class TransactionContainer extends StatelessWidget {
  final bool isCrediting;
  final int index;
  const TransactionContainer({super.key, required this.isCrediting, required this.index});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 40,
            backgroundColor: Colors.transparent,
            child: isCrediting? Row(
              children: [
                Icon(Icons.arrow_upward, color: Color(0xff00ff00)),
                Icon(Icons.arrow_downward, color:Color(0xff00ff00)),
              ],
            ): Row(
              children: [
                Icon(Icons.arrow_upward, color: Color(0xffff0000)),
                Icon(Icons.arrow_downward, color: Color(0xffff0000)),
              ],
            ),
          ),
          title: const Text('Details for the Transaction'),
          subtitle: Text('Confirmed the transaction ...'),
          trailing: CircleAvatar(
            radius: 40,
            backgroundColor: Colors.transparent,
            child: Row(
              children: isCrediting? [
                Icon(Icons.add, color: Color(0xff00ff00), size: 10,),
                FittedBox(child: Text('\$ ${index * Random().nextInt(100)}'))
              ]:[
                Icon(Icons.remove, color: Color(0xffff0000), size: 10,),
                FittedBox(child: Text('\$ ${index * Random().nextInt(70)}'))
              ],
            )
          ),
        ),
      )
    );
  }
}
