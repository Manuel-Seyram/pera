import 'package:flutter/material.dart';

class GhanaCardChip extends StatelessWidget {
  const GhanaCardChip({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Image(
            image: AssetImage('assets/chip_gold.png'),
            width: 50.0,
          ),
        ],
      ),
    );
  }
}
