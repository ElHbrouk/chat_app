import 'package:flutter/material.dart';
class CustomButton extends StatelessWidget {
   CustomButton({Key? key,required this.textButton}) : super(key: key);
String textButton;
  @override
  Widget build(BuildContext context) {
    return   Container(
      decoration:BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ) ,

      width: double.infinity,
      height: 60,
      child:  Center(
        child: Text(
          textButton,

        ),
      ),
    );
  }
}
