// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:to_do_app/util/my_button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  final VoidCallback onSave;
  final VoidCallback onCancel;
  const DialogBox(
    {
      super.key,
      required this.controller,
      required this.onSave,
      required this.onCancel,
    }
    );

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow, 
      content: Container(
        height: 150,
        child:Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
          TextField(
            controller: controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Add a new task",
              ),
          ),

Row(
  mainAxisAlignment: MainAxisAlignment.end,
  children: [
    MyButton(
      text: "SAVE",
      onPressed: onSave,
    ),
    SizedBox(width: 10), // Space between the buttons
    MyButton(
      text: "CANCEL",
      onPressed: onCancel,
    ),
  ],
)


        ],)
      ),
    );
  }
}