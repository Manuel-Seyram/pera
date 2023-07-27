import 'package:flutter/material.dart';

import '../credit card/widgets/card_list.dart';

class CreditCardHome extends StatelessWidget {
  const CreditCardHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        forceMaterialTransparency: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.close),
          splashRadius: 1.0,
          enableFeedback: false,
        ),
        title: const Center(
          child: Hero(
            tag: 'cc',
            child: Material(
              type: MaterialType.transparency,
              child: Text(
                'CREDIT CARDS',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
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
              child: const CardList(buttonText: '',),
            ),
          ],
        ),
      ),
    );
  }
}
