import 'package:chat_app/components/custom_button.dart';
import 'package:chat_app/components/custom_text_field.dart';
import 'package:chat_app/screens/register_screen.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class LoginScreen extends StatelessWidget {
   const LoginScreen({Key? key}) : super(key: key);
static String id = 'LoginScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
          ),
          child: ListView(
            children: [
              const SizedBox(height: 75,),
              Image.asset(
                'assets/images/scholar.png',
              height: 100,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Scholar Chat',
                    style: TextStyle(
                      fontFamily: 'Pacifico',
                      fontSize: 32,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 75,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text(
                    'LOGIN',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                hintText: 'Email',
                borderColor: Colors.white,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextField(
                hintText: 'Password',
                borderColor: Colors.white,
              ),
              const SizedBox(
                height: 20,
              ),
               CustomButton(
                 textButton: 'LOGIN',

               ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'don\'t have an account?',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, RegisterScreen.id);
                    },
                    child: const Text(
                      ' Sign Up',
                      style: TextStyle(
                        color: Color(0xffc7ede6),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 100,),
            ],
          ),
        ),
      ),
    );
  }
}
