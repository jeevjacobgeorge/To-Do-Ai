import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  MyButton(
    {
      super.key,
      required this.text,
      required this.onPressed,
    }
    );


@override
 Widget build(BuildContext context) {
  return MaterialButton(
    onPressed: onPressed,
    color: const Color.fromARGB(255, 196, 180, 30),
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12), // Good border radius
    ),
    child: Text(
      text,
      style: const TextStyle(
        color: Color.fromARGB(255, 0, 0, 0), // Text color for contrast
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}

}