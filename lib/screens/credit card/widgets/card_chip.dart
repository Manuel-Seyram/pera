import 'package:flutter/material.dart';

class CardChip extends StatelessWidget {
  const CardChip({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding:  EdgeInsets.only(top: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Image(
            image: AssetImage('assets/creditcardchipsilver.png'),
            width: 50.0,
          ),
          SizedBox(width: 50.0),
          SizedBox(width: 50.0),
          SizedBox(width: 50.0),
        ],
      ),
    );
  }
}
