// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../animations/card_animation.dart';
import '../../blocs/bloc_provider.dart';

import '../../blocs/national id/ghana_card_bloc.dart';
import '../../helpers/formatters.dart';
import '../../helpers/ghana_card_color.dart';
import '../../models/national id/ghana_card_color.dart';
import 'widget/ghana_card_back.dart';
import 'widget/ghana_card_front.dart';
import 'widget/pre_national_card.dart';

class GhanaCardCreate extends StatefulWidget {
  const GhanaCardCreate({super.key});

  @override
  _GhanaCardCreate createState() => _GhanaCardCreate();
}

class _GhanaCardCreate extends State<GhanaCardCreate> {
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
    GhanaCardBloc? bloc = BlocProvider.of<GhanaCardBloc>(context);

    final creditCard = Padding(
      padding: const EdgeInsets.only(top: 6.0),
      child: Container(
        margin: const EdgeInsets.fromLTRB(15.0, 2.0, 15.0, 0.0),
        child: FlipCard(
          key: animatedStateKey,
          front: const GhanaCardFront(rotatedTurnsValue: 0),
          back: const GhanaCardBack(),
        ),
      ),
    );

    final cardHolderName = StreamBuilder(
        stream: bloc!.cardHolderName,
        builder: (context, snapshot) {
          return TextField(
            textInputAction: TextInputAction.next,
            textCapitalization: TextCapitalization.characters,
            showCursor: false,
            style: const TextStyle(
              decorationColor: Colors.white,
              color: Colors.white,
            ),
            onChanged: bloc.changeCardHolderName,
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)),
              hintText: 'Ghana Card Holder Name',
              hintStyle: TextStyle(color: Colors.white12),
              //errorText: snapshot.error.toString(),
            ),
          );
        });

    final nationality = StreamBuilder(
        stream: bloc.nationality,
        builder: (context, snapshot) {
          return TextField(
            textInputAction: TextInputAction.next,
            textCapitalization: TextCapitalization.characters,
            showCursor: false,
            style: const TextStyle(
              decorationColor: Colors.white,
              color: Colors.white,
            ),
            onChanged: bloc.changenationality,
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)),
              hintText: 'Nationality',
              hintStyle: TextStyle(color: Colors.white12),
              //errorText: snapshot.error.toString(),
            ),
          );
        });

    final dob = StreamBuilder(
        stream: bloc.dob,
        builder: (context, snapshot) {
          return SizedBox(
            width: 150,
            child: TextField(
              textInputAction: TextInputAction.next,
              textCapitalization: TextCapitalization.characters,
              showCursor: false,
              style: const TextStyle(
                decorationColor: Colors.white,
                color: Colors.white,
              ),
              onChanged: bloc.changedob,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
                hintText: 'dob',
                hintStyle: TextStyle(color: Colors.white12),
                //errorText: snapshot.error.toString(),
              ),
            ),
          );
        });

    final sex = StreamBuilder(
        stream: bloc.sex,
        builder: (context, snapshot) {
          return SizedBox(
            width: 80,
            child: TextField(
              textInputAction: TextInputAction.next,
              textCapitalization: TextCapitalization.characters,
              showCursor: false,
              style: const TextStyle(
                decorationColor: Colors.white,
                color: Colors.white,
              ),
              onChanged: bloc.changesex,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
                hintText: 'sex',
                hintStyle: TextStyle(color: Colors.white12),
                //errorText: snapshot.error.toString(),
              ),
            ),
          );
        });

    final height = StreamBuilder(
        stream: bloc.height,
        builder: (context, snapshot) {
          return SizedBox(
            width: 130,
            child: TextField(
              textInputAction: TextInputAction.next,
              textCapitalization: TextCapitalization.characters,
              showCursor: false,
              style: const TextStyle(
                decorationColor: Colors.white,
                color: Colors.white,
              ),
              onChanged: bloc.changeheight,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
                hintText: 'Height(m)',
                hintStyle: TextStyle(color: Colors.white12),
                //errorText: snapshot.error.toString(),
              ),
            ),
          );
        });

    final row1 = Padding(
      padding: const EdgeInsets.all(1.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [dob, sex, height],
      ),
    );

    final idcardNumber = Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: StreamBuilder(
          stream: bloc.idcardNumber,
          builder: (context, snapshot) {
            return SizedBox(
              width: 200,
              child: TextField(
                textInputAction: TextInputAction.next,
                textCapitalization: TextCapitalization.characters,
                showCursor: false,
                style: const TextStyle(
                  decorationColor: Colors.white,
                  color: Colors.white,
                ),
                onChanged: bloc.changeidcardNumber,
                keyboardType: TextInputType.text,
                maxLength: 24,
                maxLengthEnforcement: MaxLengthEnforcement.enforced,
                inputFormatters: [
                  MaskedTextInputFormatter(
                    mask: 'xxxxxxxxxxxxxxxxxx',
                    separator: '-',
                  ),
                ],
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  hintText: 'Card  Number',
                  hintStyle: TextStyle(color: Colors.white12),
                  //errorText: snapshot.error.toString(),
                ),
              ),
            );
          }),
    );

    final documentNumber = StreamBuilder(
        stream: bloc.documentNumber,
        builder: (context, snapshot) {
          return SizedBox(
            width: 155,
            child: TextField(
              textInputAction: TextInputAction.next,
              textCapitalization: TextCapitalization.characters,
              showCursor: false,
              style: const TextStyle(
                decorationColor: Colors.white,
                color: Colors.white,
              ),
              onChanged: bloc.changedocumentNumber,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
                hintText: 'Document number',
                hintStyle: TextStyle(color: Colors.white12),
                //errorText: snapshot.error.toString(),
              ),
            ),
          );
        });

    final row2 = Padding(
      padding: const EdgeInsets.all(1.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [idcardNumber, documentNumber],
      ),
    );

    final placeofIssuance = StreamBuilder(
        stream: bloc.nationality,
        builder: (context, snapshot) {
          return SizedBox(
            width: 200,
            child: TextField(
              textInputAction: TextInputAction.next,
              textCapitalization: TextCapitalization.characters,
              showCursor: false,
              style: const TextStyle(
                decorationColor: Colors.white,
                color: Colors.white,
              ),
              onChanged: bloc.changeplaceOfIssuance,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
                hintText: 'Place of Issuance',
                hintStyle: TextStyle(color: Colors.white12),
                //errorText: snapshot.error.toString(),
              ),
            ),
          );
        });

    final exp = StreamBuilder(
        stream: bloc.expDate,
        builder: (context, snapshot) {
          return SizedBox(
            width: 150,
            child: TextField(
              textInputAction: TextInputAction.done,
              textCapitalization: TextCapitalization.characters,
              showCursor: false,
              style: const TextStyle(
                decorationColor: Colors.white,
                color: Colors.white,
              ),
              onChanged: bloc.changeexpDate,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
                hintText: 'Exp',
                hintStyle: TextStyle(color: Colors.white12),
                //errorText: snapshot.error.toString(),
              ),
            ),
          );
        });

    final row3 = Padding(
      padding: const EdgeInsets.all(1.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [placeofIssuance, exp],
      ),
    );

    final saveGhanaCard = StreamBuilder(
      stream: bloc.saveghanacardValid,
      builder: (context, snapshot) {
        return SizedBox(
          width: MediaQuery.of(context).size.width - 40,
          child: Container(
            height: 50.0,
            width: 370.0,
            decoration: BoxDecoration(
                gradient: _gradient(),
                borderRadius: BorderRadius.circular(10.0)),
            child: MaterialButton(
              padding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              onPressed: snapshot.hasData
                  ? () {
                      var blocProviderCardWallet = BlocProvider(
                        bloc: bloc,
                        child: const GhanaCardPre(),
                      );
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => blocProviderCardWallet));
                    }
                  : null,
              child: const Text(
                'Save Ghana Card',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        );
      },
    );

    return Scaffold(
        //extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(17, 16, 23, 1),
          automaticallyImplyLeading: true,
          //forceMaterialTransparency: true,
          title: const Text(
            'Create Card',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          titleSpacing: 100.0,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomCenter,
                        stops: [
                      0.1,
                      0.9
                    ],
                        colors: [
                      Color.fromRGBO(17, 16, 23, 1),
                      Color.fromRGBO(9, 3, 32, 1),
                    ])),
                child: Column(
                  children: <Widget>[
                    const SizedBox(
                      height: 20.0,
                    ),
                    Flexible(
                      //flex: 4,
                      fit: FlexFit.tight,
                      child: creditCard,
                    ),
                    const SizedBox(height: 10.0),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: <Widget>[
                          const SizedBox(height: 10.0),
                          cardHolderName,
                          const SizedBox(height: 25.0),
                          nationality,
                          const SizedBox(height: 25.0),
                          row1,
                          const SizedBox(height: 10.0),
                          row2,
                          const SizedBox(height: 10.0),
                          row3,
                          const SizedBox(height: 20.0),
                          ghanacardColors(bloc),
                          const SizedBox(height: 20.0),
                          saveGhanaCard,
                          const SizedBox(height: 20.0),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  Gradient _gradient() {
    return const LinearGradient(
        begin: Alignment.bottomLeft,
        end: Alignment.topRight,
        stops: [
          0.2,
          0.9
        ],
        colors: [
          Color.fromRGBO(255, 218, 21, 0.8),
          Color.fromRGBO(23, 154, 195, 0.6),
        ]);
  }

  Widget ghanacardColors(GhanaCardBloc bloc) {
    final dotSize = (MediaQuery.of(context).size.width - 370) /
        GhanaCardColor.baseColors.length;

    List<Widget> dotList = <Widget>[];

    for (var i = 0; i < GhanaCardColor.baseColors.length; i++) {
      dotList.add(
        StreamBuilder<List<GhanaCardColorModel>>(
          stream: bloc.ghanacardColorsList,
          builder: (context, snapshot) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: GestureDetector(
                onTap: () => bloc.selectGhanaCardColor(i),
                child: Container(
                  width: dotSize,
                  height: dotSize,
                  decoration: BoxDecoration(
                    color: GhanaCardColor.baseColors[i],
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
