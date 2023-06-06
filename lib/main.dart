import 'package:flutter/material.dart';
import 'package:pera/screens/authentication/sign_In.dart';


void main() {
  runApp( MaterialApp(
    theme: ThemeData(
     focusColor: Colors.white
    ),
    home: const SignIn(),
    debugShowCheckedModeBanner: false,
  ));
}

