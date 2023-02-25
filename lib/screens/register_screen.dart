import 'package:chat_app/constants.dart';
import 'package:flutter/material.dart';
import '../components/custom_button.dart';
import '../components/custom_text_field.dart';

class RegisterScreen extends StatelessWidget {
   const RegisterScreen({Key? key}) : super(key: key);
static String id = 'registerScreen';
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: kPrimaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
          ),
          child: ListView(
            children: [
              const SizedBox(height: 75,),
              Image.asset('assets/images/scholar.png',
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
                    'REGISTER',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20,),
              CustomTextField(
                hintText: 'Email',
                borderColor: Colors.white,
              ),
              const SizedBox(height: 10,),
              CustomTextField(
                hintText: 'Password',
                borderColor: Colors.white,
              ),
              const SizedBox(height: 20,),
               CustomButton(
                 textButton: 'Register',

               ),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:  [
                  const Text(
                    'already have an account?',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                     Navigator.pop(context);
                    },
                    child: const Text(
                      'Login',
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
