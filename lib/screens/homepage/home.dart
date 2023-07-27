import 'package:flutter/material.dart';
import 'package:pera/screens/homepage/credit_card_home.dart';
import 'package:pera/screens/homepage/ghana_card_home.dart';
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
            'HOME',
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
                child: Center(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 300,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              PageRouteBuilder(
                                transitionDuration:
                                    const Duration(milliseconds: 1500),
                                pageBuilder: (BuildContext context,
                                    Animation<double> animation,
                                    Animation<double> secondaryAnimation) {
                                  return const CreditCardHome();
                                },
                                transitionsBuilder: (BuildContext context,
                                    Animation<double> animation,
                                    Animation<double> secondaryAnimation,
                                    Widget child) {
                                  return FadeTransition(
                                    opacity: animation,
                                    child: child,
                                  );
                                },
                              ),
                            );
                          },
                          child: Hero(
                            tag: 'cc',
                            transitionOnUserGestures: true,
                            child: Container(
                              height: 70,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.white)),
                              child: const Center(
                                child: Material(
                                  type: MaterialType.transparency,
                                  child: Text('Credit Cards',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500)),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              PageRouteBuilder(
                                transitionDuration:
                                    const Duration(milliseconds: 1500),
                                pageBuilder: (BuildContext context,
                                    Animation<double> animation,
                                    Animation<double> secondaryAnimation) {
                                  return const GhanaCardHome();
                                },
                                transitionsBuilder: (BuildContext context,
                                    Animation<double> animation,
                                    Animation<double> secondaryAnimation,
                                    Widget child) {
                                  return FadeTransition(
                                    opacity: animation,
                                    child: child,
                                  );
                                },
                              ),
                            );
                          },
                          child: Hero(
                            tag: 'id',
                            transitionOnUserGestures: true,
                            child: Container(
                              height: 70,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.white)),
                              child: const Center(
                                child: Material(
                                  type: MaterialType.transparency,
                                  child: Text('Id Cards',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500)),
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )),
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
