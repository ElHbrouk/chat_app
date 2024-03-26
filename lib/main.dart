import 'package:chat_app/constants.dart';
import 'package:chat_app/firebase_options.dart';
import 'package:chat_app/routes.dart';
import 'package:chat_app/views/chatting_view.dart';
import 'package:chat_app/views/login_view.dart';
import 'package:chat_app/views/signup_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ScholarChat());
}

class ScholarChat extends StatelessWidget {
  const ScholarChat({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Scholar Chat',
      theme: ThemeData.dark(
        useMaterial3: true,
      ).copyWith(
        scaffoldBackgroundColor: kPrimaryColor,
      ),
      initialRoute: loginViewRoute,
      routes: {
        signUpViewRoute: (context) => const SignUpView(),
        loginViewRoute: (context) => const LoginView(),
        chatViewRoute: (context) => const ChattingView(),
        // "":(context)=>SignUpView(),
      },
    );
  }
}
