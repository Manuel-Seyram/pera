import 'package:flutter/material.dart';
import 'package:pera/screens/homepage/home.dart';
import 'package:pera/screens/widgets/pera_button.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage(
            'assets/bg.png',
          ),
          fit: BoxFit.fill,
        )),
        child: Column(children: [
          const Spacer(),
          Center(
            child: Flexible(
              child: Image.asset('assets/onboarding.png'),
            ),
          ),
          const Spacer(),
          const Center(
              child: Text(
            'Mange All Your Cards',
            maxLines: 2,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 28.0,
                color: Colors.white),
          )),
          const Center(
            child: Text('All in One Place',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28.0,
                    color: Colors.white)),
          ),
          const SizedBox(
            height: 10.0,
          ),
          const Center(
            child: Text(
              'Eliminate Physical Cards, go Virtual',
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12.0,
                  color: Colors.white),
            ),
          ),
          const Center(
            child: Text('Never lose your cards again',
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12.0,
                    color: Colors.white)),
          ),
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
        context, MaterialPageRoute(builder: (context) => const Home()));
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
