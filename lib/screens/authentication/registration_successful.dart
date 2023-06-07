import 'package:flutter/material.dart';
import 'package:pera/screens/onboarding/onboarding.dart';

import '../widgets/pera_button.dart';

class SuccessfulRegistration extends StatelessWidget {
  const SuccessfulRegistration({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: Column(children: [
          const Spacer(),
          const Spacer(),
          const Spacer(),
          const Spacer(),
          const Spacer(),
          Center(
            child: Flexible(
              child: Image.asset(
                'assets/success.png',
                height: 120.0,
                width: 100.0,
              ),
            ),
          ),
          const Spacer(),
          const Center(
              child: Text(
            'Success!',
            maxLines: 2,
            style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 32.0,
                color: Colors.white),
          )),
          const Center(
            child: Text('Registration is successful',
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12.0,
                    color: Colors.white)),
          ),
          const SizedBox(
            height: 10.0,
          ),
          const Center(
            child: Text(
              'Tap on Get Started button below to continue ',
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12.0,
                  color: Colors.white),
            ),
          ),
          const Spacer(),
          const Spacer(),
          const Spacer(),
          const Spacer(),
          PeraButton('Get Started', () {
            _nextPage(context);
          }, _gradient()),
          const Spacer(),
        ]),
      ),
    );
  }

  _nextPage(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const Onboarding()));
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
}
