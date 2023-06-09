import 'package:flutter/material.dart';
import 'package:pera/screens/authentication/registration_successful.dart';
import 'package:pera/screens/authentication/sign_in.dart';

import '../widgets/pera_button.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:  SingleChildScrollView(
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
                children: [
                  const SizedBox(
                    height: 90.0,
                  ),
                  Center(
                      child: Image.asset(
                    'assets/logo.png',
                    height: 120.0,
                    width: 110.0,
                  )),
                  const Spacer(),
                  const Spacer(),
                  const Align(
                      alignment: Alignment.topLeft,
                      widthFactor: 5.4,
                      child: Text('Sign Up',
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w700,
                              color: Colors.white))),
                  const Spacer(),
                  const Align(
                      alignment: Alignment.topLeft,
                      widthFactor: 9.9,
                      child: Text('Name',
                          style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400,
                              color: Colors.white))),
                  const Align(
                    alignment: Alignment.topLeft,
                    widthFactor: 1.0,
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: TextField(
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.name,
                        style: TextStyle(
                          decorationColor: Colors.white,
                          color: Colors.white,
                        ),
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            hintText: 'John Snowman',
                            hintStyle: TextStyle(color: Colors.white12),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(20.0)),
                            ),
                            labelStyle: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ),
                  const Align(
                      alignment: Alignment.topLeft,
                      widthFactor: 10.7,
                      child: Text('Email',
                          style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400,
                              color: Colors.white))),
                  const Align(
                    alignment: Alignment.topLeft,
                    widthFactor: 1.0,
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: TextField(
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        style: TextStyle(
                          decorationColor: Colors.white,
                          color: Colors.white,
                        ),
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            hintText: 'example@gmail.com',
                            hintStyle: TextStyle(color: Colors.white12),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(20.0)),
                            ),
                            labelStyle: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ),
                  const Align(
                      alignment: Alignment.topLeft,
                      widthFactor: 6.0,
                      child: Text('Password',
                          style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400,
                              color: Colors.white))),
                  const Align(
                    alignment: Alignment.topLeft,
                    widthFactor: 1.0,
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: TextField(
                        textInputAction: TextInputAction.next,
                        obscureText: true,
                        keyboardType: TextInputType.text,
                        style: TextStyle(
                          decorationColor: Colors.white,
                          color: Colors.white,
                        ),
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            hintText: '**************',
                            hintStyle: TextStyle(color: Colors.white12),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(20.0)),
                            )),
                      ),
                    ),
                  ),
                  const Align(
                      alignment: Alignment.topLeft,
                      widthFactor: 3.2,
                      child: Text('Confirm Password',
                          style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400,
                              color: Colors.white))),
                  const Align(
                    alignment: Alignment.topLeft,
                    widthFactor: 1.0,
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: TextField(
                        textInputAction: TextInputAction.done,
                        obscureText: true,
                        keyboardType: TextInputType.text,
                        style: TextStyle(
                          decorationColor: Colors.white,
                          color: Colors.white,
                        ),
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            hintText: '**************',
                            hintStyle: TextStyle(color: Colors.white12),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(20.0)),
                            )),
                      ),
                    ),
                  ),
                  PeraButton('Sign Up', () {
                    _toOnboarding(context);
                  }, _gradient()),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => const SignIn()));
                      },
                      child: const Text(
                        'Already have an account? Sign In',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 12.0,
                            decoration: TextDecoration.underline),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Spacer(),
                  //const Spacer(),
                ],
              ),
                  ),
            ],
          ),
        ),
    );
  }

  _toOnboarding(BuildContext context) {
    Navigator.push(
    context, MaterialPageRoute(builder: (context) => const SuccessfulRegistration()));
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
