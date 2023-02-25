import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
   CustomTextField({Key? key,  this.hintText,required this.borderColor}) : super(key: key);
String? hintText;
Color borderColor;
  @override
  Widget build(BuildContext context) {
    return     TextField(

      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.white,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: borderColor,

          ),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: borderColor,

          ),
        ),
      ),
    );
  }
}
