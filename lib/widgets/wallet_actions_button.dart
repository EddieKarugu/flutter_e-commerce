import 'package:flutter/material.dart';

class WalletActionsButton extends StatelessWidget {
  final String hint;
  final IconData icon;
  const WalletActionsButton({
    super.key,
    required this.hint,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: (){},
            borderRadius: BorderRadius.circular(100),
            splashColor: Theme.of(context).colorScheme.primary,
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: CircleAvatar(
                backgroundColor: Theme.of(context).colorScheme.primary,
                  child: Icon(icon)),
            )),
        Text(hint),
      ],
    );
  }
}
