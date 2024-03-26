import 'package:chat_app/helper/custom_snack_bar.dart';
import 'package:chat_app/routes.dart';
import 'package:chat_app/widgets/login_and_signup_body.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  String? email;
  String? password;
  bool isLoading = false;
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Form(
          key: formKey,
          child: LoginAndSignUpBody(
            emailOnChanged: (emailValue) {
              email = emailValue;
            },
            passwordOnChanged: (passwordValue) {
              password = passwordValue;
            },
            onTap: () async {
              if (formKey.currentState!.validate()) {
                setState(() {
                  isLoading = true;
                });
                try {
                  await FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: email!, password: password!);
                  Navigator.pushNamed(context, chatViewRoute,arguments: email);
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'user-not-found') {
                    customSnakBar(context, 'No user found for that email.');
                  } else if (e.code == 'wrong-password') {
                    customSnakBar(
                        context, 'Wrong password provided for that user.');
                  }
                } catch (e) {
                  print(e);
                }
                setState(() {
                  isLoading = false;
                });
              }
            },
            viewName: 'LOGIN',
            conditionName: "Don't have an account?",
            linkName: 'Creat an accoumt',
            onPressed: () {
              Navigator.pushNamed(context, signUpViewRoute);
            },
          ),
        ),
      ),
    );
  }
}
