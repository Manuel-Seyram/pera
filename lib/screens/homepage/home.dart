import 'package:flutter/material.dart';
import 'package:pera/screens/homepage/select_card_type.dart';


class Home extends StatelessWidget {
   const Home({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        forceMaterialTransparency: true,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu),
          splashRadius: 1.0,
          enableFeedback: false,
        ),
        title: const Center(
          child: Text(
            'Your Cards',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
        ),
        //titleSpacing: 100.0,
        actions: [
          IconButton(
            onPressed: () {
              _cardtype(context);
            },
            icon: const Icon(Icons.add),
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
              child: const Column(
                
              ),
            ),
          ],
        ),
      ),
    );
  }

  _cardtype(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const SelectCardType(
                  buttonText: '',
                )));
  }
}
