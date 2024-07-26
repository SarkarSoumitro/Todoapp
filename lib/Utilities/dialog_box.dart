

import 'package:flutter/material.dart';
import 'package:todoapp/Utilities/my_buttons.dart';

class DialogBox extends StatelessWidget {
 final controller;
  DialogBox({
  super.key,
  required this.controller,
  required this.onCancel,
  required this.onSave
  });


 VoidCallback onSave;
 VoidCallback onCancel;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow,
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller:controller,
              decoration: InputDecoration(border: OutlineInputBorder(),
              hintText: "add a new task"
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //save button
                MyButton(text: "Save", onPressed: onSave),
                
                const SizedBox(width: 8),

                //cancel button
                 MyButton(text: "Cancel", onPressed: onCancel)

              ],
            )
          ],
        ),
      ),
    );
  }
}