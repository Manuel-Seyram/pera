import 'package:flutter/material.dart';
import '../../../blocs/bloc_provider.dart';
import '../../../blocs/national id/ghana_card_bloc.dart';
import '../../../helpers/ghana_card_color.dart';
import 'ghana_card_chip.dart';

class GhanaCardFront extends StatelessWidget {
  final int rotatedTurnsValue;
  const GhanaCardFront({super.key, required this.rotatedTurnsValue});

  @override
  Widget build(BuildContext context) {
    final GhanaCardBloc? bloc = BlocProvider.of<GhanaCardBloc>(context);

    //Cardlogo contains the card chip and ghana card logo.
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

// widget for the first line on the ghana card with name and nationality
    final cardline1 = Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 15.0, left: 12.0),
          child: StreamBuilder(
            stream: bloc?.cardHolderName,
            builder: (context, snapshot) => Text(
              snapshot.data ?? 'GHANA CARD HOLDER NAME',
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12.0,
                  fontWeight: FontWeight.w700),
            ),
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
              StreamBuilder<String>(
                  stream: bloc?.nationality,
                  builder: (context, snapshot) {
                    return Text(
                      snapshot.data ?? 'NATIONALITY',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12.0,
                          fontWeight: FontWeight.w700),
                    );
                  })
            ],
          ),
        ),
      ],
    );
// widget for the second line on the ghana card with dob, height and sex.
    final cardline2 = Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 15.0, left: 12.0),
          child: StreamBuilder<String>(
            stream: bloc?.dob,
            builder: (context, snapshot) => Text(
              snapshot.data ?? 'DATE OF BIRTH',
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12.0,
                  fontWeight: FontWeight.w700),
            ),
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
              StreamBuilder<String>(
                  stream: bloc?.sex,
                  builder: (context, snapshot) {
                    return Text(
                      snapshot.data ?? 'SEX',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12.0,
                          fontWeight: FontWeight.w700),
                    );
                  })
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
              StreamBuilder<String>(
                  stream: bloc?.height,
                  builder: (context, snapshot) {
                    return Text(
                      snapshot.data ?? 'HEIGHT(m)',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12.0,
                          fontWeight: FontWeight.w700),
                    );
                  })
            ],
          ),
        ),
      ],
    );

    // widget for the third line on the ghana card with id number and document number.
    final cardline3 = Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 15.0, left: 12.0),
          child: StreamBuilder<String>(
            stream: bloc?.idcardNumber,
            builder: (context, snapshot) {
              return snapshot.hasData
                  ? _formatCardNumber(snapshot.data!)
                  : _formatCardNumber('ID NUMBER');
            },
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
              StreamBuilder<String>(
                  stream: bloc?.documentNumber,
                  builder: (context, snapshot) {
                    return Text(
                      snapshot.data ?? 'DOCUMENT NUMBER',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w700),
                    );
                  })
            ],
          ),
        ),
      ],
    );

    // widget for the fourth line on the ghana card with place of issuance and expiry date
    final cardline4 = Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 15.0, left: 12.0),
          child: StreamBuilder(
            stream: bloc?.placeOfIssuance,
            builder: (context, snapshot) => Text(
              snapshot.data ?? 'PLACE OF ISSUANCE',
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12.0,
                  fontWeight: FontWeight.w700),
            ),
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
              StreamBuilder<String>(
                  stream: bloc?.expDate,
                  builder: (context, snapshot) {
                    return Text(
                      snapshot.data ?? 'EXPIRY DATE',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12.0,
                          fontWeight: FontWeight.w700),
                    );
                  })
            ],
          ),
        ),
      ],
    );

    return StreamBuilder<int>(
        stream: bloc?.ghanacardColorIndexSelected,
        initialData: 0,
        builder: (context, snapshopt) {
          return Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: GhanaCardColor.baseColors[snapshopt.data!]),
            child: RotatedBox(
              quarterTurns: rotatedTurnsValue,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  cardLogo,
                  const SizedBox(
                    height: 20,
                  ),
                  cardline1,
                  cardline2,
                  cardline3,
                  cardline4
                ],
              ),
            ),
          );
        });
  }

  Widget _formatCardNumber(String cardNumber) {
    cardNumber = cardNumber;
    List<Widget> numberList = <Widget>[];
    for (var i = 0; i < cardNumber.length; i++) {
      numberList.add(
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 1.0),
          child: Text(
            cardNumber[i],
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      );
    }
    return Row(
      children: numberList,
    );
  }
}
