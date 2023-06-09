// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pera/screens/card_pre_page.dart';

import '../../animations/card_animation.dart';
import '../../blocs/card/bloc_provider.dart';
import '../../blocs/card/card_bloc.dart';
import '../../helpers/card_colors.dart';
import '../../helpers/formatters.dart';
import '../../models/credit card/card_color_model.dart';
import 'widgets/card_back.dart';
import 'widgets/card_front.dart';

class CardCreate extends StatefulWidget {
  const CardCreate({super.key});

  @override
  _CardCreate createState() => _CardCreate();
}

class _CardCreate extends State<CardCreate> {
 GlobalKey<FlipCardState> animatedStateKey = GlobalKey<FlipCardState>();

  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_focusNodeListener);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_focusNodeListener);
    super.dispose();
  }

  Future<void> _focusNodeListener() async {
    animatedStateKey.currentState?.toggleCard();
  }

  @override
  Widget build(BuildContext context) {
   CardBloc? bloc = BlocProvider.of<CardBloc>(context);

    final creditCard = Padding(
      padding: const EdgeInsets.only(top: 6.0),
      child: Card(
        color: Colors.grey,
        elevation: 0.0,
        margin: const EdgeInsets.fromLTRB(15.0, 2.0, 15.0, 0.0),
        child: FlipCard(
          key: animatedStateKey,
          front: const CardFront(rotatedTurnsValue: 0),
          back: const CardBack(),
        ),
      ),
    );

    final cardHolderName = StreamBuilder(
        stream: bloc!.cardHolderName,
        builder: (context, snapshot) {
          return TextField(
            textCapitalization: TextCapitalization.characters,
            onChanged: bloc.changeCardHolderName,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              border: InputBorder.none,
              filled: true,
              fillColor: Colors.white,
              hintText: 'Cardholder Name',
              errorText: snapshot.error.toString(),
            ),
          );
        });

    final cardNumber = Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: StreamBuilder(
          stream: bloc.cardNumber,
          builder: (context, snapshot) {
            return TextField(
              onChanged: bloc.changeCardNumber,
              keyboardType: TextInputType.number,
              maxLength: 19,
              maxLengthEnforcement: MaxLengthEnforcement.enforced,
              inputFormatters: [
                MaskedTextInputFormatter(
                  mask: 'xxxx xxxx xxxx xxxx',
                  separator: ' ',
                ),
              ],
              decoration: InputDecoration(
                border: InputBorder.none,
                filled: true,
                fillColor: Colors.white,
                hintText: 'Card Number',
                counterText: '',
                errorText: snapshot.error.toString(),
              ),
            );
          }),
    );

    final cardMonth = StreamBuilder(
      stream: bloc.cardMonth,
      builder: (context, snapshot) {
        return SizedBox(
          width: 85.0,
          child: TextField(
            onChanged: bloc.changeCardMonth,
            keyboardType: TextInputType.number,
            maxLength: 2,
            maxLengthEnforcement: MaxLengthEnforcement.enforced,
            decoration: InputDecoration(
              border: InputBorder.none,
              filled: true,
              fillColor: Colors.white,
              hintText: 'MM',
              counterText: '',
              errorText: snapshot.error.toString(),
            ),
          ),
        );
      },
    );

    final cardYear = StreamBuilder(
        stream: bloc.cardYear,
        builder: (context, snapshot) {
          return SizedBox(
            width: 120.0,
            child: TextField(
              onChanged: bloc.changeCardYear,
              keyboardType: TextInputType.number,
              maxLength: 4,
              maxLengthEnforcement: MaxLengthEnforcement.enforced,
              decoration: InputDecoration(
                border: InputBorder.none,
                filled: true,
                fillColor: Colors.white,
                hintText: 'YYYY',
                counterText: '',
                errorText: snapshot.error.toString(),
              ),
            ),
          );
        });

    final cardVerificationValue = StreamBuilder(
        stream: bloc.cardCvv,
        builder: (context, snapshot) {
          return SizedBox(
            width: 85.0,
            child: TextField(
              focusNode: _focusNode,
              onChanged: bloc.changeCardCvv,
              keyboardType: TextInputType.number,
              maxLength: 3,
              maxLengthEnforcement: MaxLengthEnforcement.enforced,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  filled: true,
                  fillColor: Colors.white,
                  counterText: '',
                  hintText: 'CVV',
                  errorText: snapshot.error.toString()),
            ),
          );
        });

    final saveCard = StreamBuilder(
      stream: bloc.savecardValid,
      builder: (context, snapshot) {
        return SizedBox(
          width: MediaQuery.of(context).size.width - 40,
          child: Container(
            color: Colors.blue,
            child: MaterialButton(
              color: Colors.lightBlue,
              onPressed: snapshot.hasData
                  ? () {
                      var blocProviderCardWallet = BlocProvider(
                        bloc: bloc,
                        child: const CardPre(),
                      );
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => blocProviderCardWallet));
                    }
                  : null,
              child: const Text(
                'Save Card',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        );
      },
    );

    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          forceMaterialTransparency: true,
          title: const Center(
            child: Text(
              'Create Card',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
          ),
        ),
        backgroundColor: Colors.grey,
        body: ListView(
          itemExtent: 750.0,
          padding: const EdgeInsets.only(top: 10.0),
          children: <Widget>[
            Column(
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: creditCard,
                ),
                Expanded(
                  flex: 6,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: <Widget>[
                        const SizedBox(height: 8.0),
                        cardHolderName,
                        cardNumber,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            cardMonth,
                            const SizedBox(width: 16.0),
                            cardYear,
                            const SizedBox(width: 16.0),
                            cardVerificationValue,
                          ],
                        ),
                        const SizedBox(height: 20.0),
                        cardColors(bloc),
                        const SizedBox(height: 50.0),
                        saveCard,
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ));
  }

  Widget cardColors(CardBloc bloc) {
    final dotSize =
        (MediaQuery.of(context).size.width - 220) / CardColor.baseColors.length;

    List<Widget> dotList = <Widget>[];

    for (var i = 0; i < CardColor.baseColors.length; i++) {
      dotList.add(
        StreamBuilder<List<CardColorModel>>(
          stream: bloc.cardColorsList,
          builder: (context, snapshot) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: GestureDetector(
                onTap: () => bloc.selectCardColor(i),
                child: Container(
                  width: dotSize,
                  height: dotSize,
                  decoration: BoxDecoration(
                    color: CardColor.baseColors[i],
                    shape: BoxShape.circle,
                  ),
                  child: snapshot.hasData
                      ? snapshot.data![i].isSelected
                          ? const Icon(
                              Icons.check,
                              color: Colors.white,
                              size: 12.0,
                            )
                          : Container()
                      : Container(),
                ),
              ),
            );
          },
        ),
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: dotList,
    );
  }
}
