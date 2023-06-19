import 'package:flutter/material.dart';

import '../../../models/credit card/card_model.dart';
import 'card_chip.dart';

class CardFrontList extends StatelessWidget {
  final CardResults cardModel;
  const CardFrontList({super.key, required this.cardModel});

  @override
  Widget build(BuildContext context) {
    final cardLogo = Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.only(top: 25.0, right: 52.0),
          child: Image(
            image: AssetImage('assets/visa_logo.png'),
            width: 65.0,
            height: 32.0,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 52.0),
          child: Text(
            cardModel.cardType,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 14.0,
                fontWeight: FontWeight.w400),
          ),
        ),
      ],
    );

    final cardNumber = Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _buildDots(),
        ],
      ),
    );

    final cardLastNumber = Padding(
      padding: const EdgeInsets.only(top: 1.0, left: 55.0),
      child: Text(
        cardModel.cardNumber.substring(12),
        style: const TextStyle(color: Colors.white, fontSize: 8.0),
      ),
    );

    final cardValidThru = Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Column(
              children: <Widget>[
                Text(
                  'valid',
                  style: TextStyle(color: Colors.white, fontSize: 8.0),
                ),
                Text(
                  'thru',
                  style: TextStyle(color: Colors.white, fontSize: 8.0),
                ),
              ],
            ),
            const SizedBox(
              width: 5.0,
            ),
            Text(
              '${cardModel.cardMonth}/${cardModel.cardYear.substring(2)}',
              style: const TextStyle(color: Colors.white, fontSize: 16.0),
            ),
          ],
        ));

    final cardOwner = Padding(
      padding: const EdgeInsets.only(top: 15.0, left: 50.0),
      child: Text(
        cardModel.cardHolderName,
        style: const TextStyle(color: Colors.white, fontSize: 18.0),
      ),
    );

    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: cardModel.cardColor,
        ),
        child: RotatedBox(
          quarterTurns: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              cardLogo,
              const CardChip(),
              cardNumber,
              cardLastNumber,
              cardValidThru,
              cardOwner,
            ],
          ),
        ));
  }

  Widget _buildDots() {
    List<Widget> dotList = <Widget>[];
    var counter = 0;
    for (var i = 0; i < 12; i++) {
      counter += 1;
      dotList.add(
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 3.0),
          child: Container(
            width: 6.0,
            height: 6.0,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
          ),
        ),
      );
      if (counter == 4) {
        counter = 0;
        dotList.add(const SizedBox(width: 60.0));
      }
    }
    dotList.add(_buildNumbers());
    return Row(children: dotList);
  }

  Widget _buildNumbers() {
    return Text(
      cardModel.cardNumber.substring(12),
      style: const TextStyle(color: Colors.white),
    );
  }
}
