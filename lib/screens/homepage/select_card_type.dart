import 'package:flutter/material.dart';
import 'package:pera/screens/credit%20card/create_card.dart';

import '../../blocs/card/bloc_provider.dart';
import '../../blocs/card/card_bloc.dart';

class SelectCardType extends StatelessWidget {
  final String buttonText;

  const SelectCardType({super.key, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        forceMaterialTransparency: true,
        title: const Center(
          child: Text(
            'Select Card Type',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
        ),
        //titleSpacing: 120.0,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.close),
            enableFeedback: false,
            splashRadius: 1.0,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
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
                children: [
                  const Spacer(),
                  _cardButton(
                      buttonColor: const Color.fromRGBO(32, 28, 48, 1.0),
                      buttonText: 'Credit or Debit Card',
                      click: () {
                         var blocProviderCardCreate = BlocProvider(
                          bloc: CardBloc(),
                          child: const CardCreate(),
                        );
                        blocProviderCardCreate.bloc.selectCardType(buttonText);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => blocProviderCardCreate));
                      },
                      textColor: Colors.white,
                      context: context),
                  const SizedBox(
                    height: 10,
                  ),
                  _cardButton(
                      buttonColor: const Color.fromRGBO(32, 28, 48, 1.0),
                      buttonText: 'National Identification Card',
                      click: () {},
                      textColor: Colors.white,
                      context: context),
                  const SizedBox(
                    height: 10,
                  ),
                  _cardButton(
                      buttonColor: const Color.fromRGBO(32, 28, 48, 1.0),
                      buttonText: 'Passport',
                      click: () {},
                      textColor: Colors.white,
                      context: context),
                  const SizedBox(
                    height: 10,
                  ),
                  _cardButton(
                      buttonColor: const Color.fromRGBO(32, 28, 48, 1.0),
                      buttonText: 'Driver License',
                      click: () {},
                      textColor: Colors.white,
                      context: context),
                  const Spacer(),
                  const Spacer(),
                  const Spacer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _cardButton(
      {required Color buttonColor,
      required String buttonText,
      required Color textColor,
      required VoidCallback click,
      required BuildContext context}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5.0),
      child: Container(
        width: 327.0,
        height: 50.0,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(40.0)),
        child: MaterialButton(
          elevation: 1.0,
          color: buttonColor,
          onPressed: click,
          child: Text(
            buttonText,
            style: TextStyle(
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}
