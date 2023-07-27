import 'package:flutter/material.dart';
import 'package:pera/screens/national%20card/widget/ghana_card_chip.dart';

import '../../../models/national id/ghana_card_model.dart';

class GhanaCardFrontList extends StatelessWidget {
  final GhanaCardResults ghanacardModel;
  const GhanaCardFrontList({super.key, required this.ghanacardModel});

  @override
  Widget build(BuildContext context) {
    const cardLogo = Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Row(
          children: [
            SizedBox(
              width: 10.0,
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.0, right: 25.0),
              child: Image(
                image: AssetImage('assets/ghana_card.png'),
                width: 65.0,
                height: 32.0,
              ),
            ),
            SizedBox(
              width: 220,
            ),
            GhanaCardChip()
          ],
        ),
      ],
    );

    final cardline1 = Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 15.0, left: 12.0),
          child: Text(
            ghanacardModel.cardHolderName,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 16.0,
                fontWeight: FontWeight.w700),
          ),
        ),
        const SizedBox(
          width: 50,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                ghanacardModel.nationality,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ),
      ],
    );

    final cardline2 = Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 15.0, left: 12.0),
          child: Text(
            ghanacardModel.dob,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 16.0,
                fontWeight: FontWeight.w700),
          ),
        ),
        const SizedBox(
          width: 60,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                ghanacardModel.sex,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w700),
              )
            ],
          ),
        ),
        const SizedBox(
          width: 60,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                ghanacardModel.height,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w700),
              )
            ],
          ),
        ),
      ],
    );

    final cardline3 = Row(
      children: [
        Padding(
            padding: const EdgeInsets.only(top: 15.0, left: 12.0),
            child: Text(
              ghanacardModel.idcardNumber,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w700),
            )),
        const SizedBox(
          width: 60,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                ghanacardModel.documentNumber,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w700),
              )
            ],
          ),
        ),
      ],
    );

    final cardline4 = Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 15.0, left: 12.0),
          child: Text(
            ghanacardModel.placeOfIssuance,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 16.0,
                fontWeight: FontWeight.w700),
          ),
        ),
        const SizedBox(
          width: 100,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                ghanacardModel.expDate,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12.0,
                    fontWeight: FontWeight.w700),
              )
            ],
          ),
        ),
      ],
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
              cardline1,
              cardline2,
              cardline3,
              cardline4
            ],
          ),
        ));
  }
}
