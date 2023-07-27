import 'package:flutter/material.dart';

import '../../blocs/bloc_provider.dart';
import '../../blocs/card/card_bloc.dart';
import '../homepage/credit_card_home.dart';
import 'widgets/card_front.dart';

class CardPre extends StatefulWidget {
  const CardPre({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CardPre createState() => _CardPre();
}

class _CardPre extends State<CardPre> with TickerProviderStateMixin {
  late AnimationController rotateController;
  late AnimationController opacityController;
  late Animation<double> animation;
  late Animation<double> opacityAnimation;

  @override
  void initState() {
    super.initState();
    final CardBloc? bloc = BlocProvider.of<CardBloc>(context);
    rotateController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    opacityController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000));

    CurvedAnimation curvedAnimation =
        CurvedAnimation(parent: opacityController, curve: Curves.fastOutSlowIn);

    animation = Tween(begin: -2.0, end: -3.15).animate(rotateController);
    opacityAnimation = Tween(begin: 0.0, end: 1.0).animate(curvedAnimation);

    opacityAnimation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        bloc?.saveCard();
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const CreditCardHome()));
      }
    });

    rotateController.forward();
    opacityController.forward();
  }

  @override
  dispose() {
    rotateController.dispose();
    opacityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        forceMaterialTransparency: true,
        title: const Center(
          child: Text(
            '',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Container(
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
            children: <Widget>[
              const SizedBox(height: 50.0,),
              Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: AnimatedBuilder(
                    animation: animation,
                    child: SizedBox(
                      width: screenSize.width / 1.6,
                      height: screenSize.height / 2.2,
                      child: const CardFront(rotatedTurnsValue: -3),
                    ),
                    builder: (context, widget) {
                      return Transform.rotate(
                        angle: animation.value,
                        child: widget,
                      );
                    }),
              ),
              const SizedBox(
                height: 100.0,
              ),
              const CircularProgressIndicator(
                strokeWidth: 2.0,
                color: Colors.white,
              ),
              const SizedBox(
                height: 30.0,
              ),
              FadeTransition(
                opacity: opacityAnimation,
                child: const Text(
                  'Adding Card',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
