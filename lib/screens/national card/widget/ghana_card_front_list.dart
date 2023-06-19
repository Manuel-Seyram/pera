import 'package:flutter/material.dart';
import 'package:pera/screens/national%20card/widget/ghana_card_chip.dart';

import '../../../models/national id/ghana_card_model.dart';

class GhanaCardFrontList extends StatelessWidget {
  final GhanaCardResults ghanacardModel;
  const GhanaCardFrontList({super.key, required this.ghanacardModel});

  @override
  Widget build(BuildContext context) {
    const cardLogo = Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 25.0, right: 52.0),
          child: Image(
            image: AssetImage('assets/ghana_card.png'),
            width: 65.0,
            height: 32.0,
          ),
        ),
      ],
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
              ghanacardModel.nationality,
              style: const TextStyle(color: Colors.white, fontSize: 16.0),
            ),
          ],
        ));

    final ghanacardOwner = Padding(
      padding: const EdgeInsets.only(top: 15.0, left: 50.0),
      child: Text(
        ghanacardModel.cardHolderName,
        style: const TextStyle(color: Colors.white, fontSize: 18.0),
      ),
    );

    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: ghanacardModel.ghanacardColor,
        ),
        child: RotatedBox(
          quarterTurns: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              cardLogo,
              const GhanaCardChip(),
              cardValidThru,
              ghanacardOwner,
            ],
          ),
        ));
  }
}
