import 'package:chat_app/screens/login_screen.dart';
import 'package:chat_app/screens/register_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      routes:{
        LoginScreen.id:(context)=> const LoginScreen(),
        RegisterScreen.id:(context)=> const RegisterScreen(),
      },
      initialRoute: LoginScreen.id,
    );
  }
}

