import 'package:chat_app/helper/custom_snack_bar.dart';
import 'package:chat_app/routes.dart';
import 'package:chat_app/widgets/login_and_signup_body.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  String? email, password;
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
                  await signupUser();
                  Navigator.pushNamed(context, chatViewRoute,arguments: email);
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'weak-password') {
                    customSnakBar(
                        context, 'The password provided is too weak.');
                  } else if (e.code == 'email-already-in-use') {
                    customSnakBar(
                        context, 'The account already exists for that email.');
                  }
                } catch (e) {
                  print(e);
                }
                setState(() {
                  isLoading = false;
                });
              }
            },
            viewName: 'SignUp',
            conditionName: "Do you have an account?",
            linkName: 'login',
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
    );
  }

  Future<void> signupUser() async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email!,
      password: password!,
    );
  }
}
