import 'package:flutter/material.dart';

class PeraButton extends StatelessWidget {
  final String text;
  final Gradient gradient;
  final VoidCallback onTap;
  const PeraButton(this.text, this.onTap, this.gradient, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Container(
        height: 50.0,
        width: 327.0,
        decoration: BoxDecoration(
            gradient: gradient, borderRadius: BorderRadius.circular(10.0)),
        child: MaterialButton(
          padding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          onPressed: onTap,
          child: Text(text,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16, color: Colors.white)),
        ),
      ),
    );
  }
}
