  import 'package:flutter/material.dart';

void customSnakBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          backgroundColor: Colors.grey[900],
          content: Text(
              style: const TextStyle(
                color: Colors.white,
              ),
              message)),
    );
  }

