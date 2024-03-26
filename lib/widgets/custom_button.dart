import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.buttonName, this.onTap});
  final String buttonName;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: MediaQuery.sizeOf(context).width / 2,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        child: Text(
          buttonName,
          style: const TextStyle(
            color: Colors.black,
            fontFamily: 'Pacifico',
            fontSize: 17,
          ),
        ),
      ),
    );
  }
}
