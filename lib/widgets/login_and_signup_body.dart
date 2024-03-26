import 'package:chat_app/constants.dart';
import 'package:chat_app/widgets/custom_button.dart';
import 'package:chat_app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginAndSignUpBody extends StatefulWidget {
  const LoginAndSignUpBody({
    super.key,
    this.onPressed,
    required this.viewName,
    required this.conditionName,
    required this.linkName,
    this.onTap,
    this.emailController,
    this.passwordController,
    this.emailOnChanged,
    this.passwordOnChanged,
  });
  final void Function()? onPressed, onTap;
  final String viewName, conditionName, linkName;
  final TextEditingController? emailController, passwordController;
  final void Function(String)? emailOnChanged;
  final void Function(String)? passwordOnChanged;

  @override
  State<LoginAndSignUpBody> createState() => _LoginAndSignUpBodyState();
}

class _LoginAndSignUpBodyState extends State<LoginAndSignUpBody> {
  @override
  void dispose() {
    widget.emailController?.dispose();
    widget.passwordController?.dispose();
    super.dispose();
  }

  bool obsecureText = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Image.asset(kLogo),
            const Text(
              'Scholar Chat',
              style: TextStyle(
                fontSize: 28,
                fontFamily: 'Pacifico',
              ),
            ),
            const Spacer(
              flex: 2,
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                widget.viewName,
                style: const TextStyle(
                  fontSize: 20,
                  fontFamily: 'Pacifico',
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextField(
              validator: (value) {
                if (value!.isEmpty) {
                  return 'please enter your email';
                } else if (!value.contains('@')) {
                  return 'your email must contains "@" ';
                } else if (!value.contains('com')) {
                  return 'your email must contains "com"';
                } else {
                  return null;
                }
              },
              onChanged: widget.emailOnChanged,
              controller: widget.emailController,
              hint: 'Email',
              obsecureText: false,
            ),
            CustomTextField(
              suffixIcon: IconButton(
                icon: obsecureText
                    ? const Icon(FontAwesomeIcons.eye)
                    : const Icon(
                        FontAwesomeIcons.eyeSlash,
                      ),
                onPressed: () {
                  setState(() {
                    obsecureText = !obsecureText;
                  });
                },
              ),
              validator: (value) {
                RegExp regex = RegExp(
                    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                if (value!.isEmpty) {
                  return 'Please enter password';
                } else {
                  if (!regex.hasMatch(value)) {
                    return 'Enter valid password';
                  } else {
                    return null;
                  }
                }
              },
              onChanged: widget.passwordOnChanged,
              controller: widget.passwordController,
              hint: 'Password',
              obsecureText: obsecureText,
            ),
            const SizedBox(
              height: 10,
            ),
            CustomButton(
              onTap: widget.onTap,
              buttonName: widget.viewName,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(widget.conditionName),
                TextButton(
                    onPressed: widget.onPressed, child: Text(widget.linkName))
              ],
            ),
            const Spacer(
              flex: 3,
            ),
          ],
        ),
      ),
    );
  }
}

// Function to validate the password
bool validatePassword(String password) {
  // Reset error message
  String? errorMessage = '';
  // Password length greater than 6
  if (password.length < 6) {
    errorMessage += 'Password must be longer than 6 characters.\n';
  }
  // Contains at least one uppercase letter
  if (!password.contains(RegExp(r'[A-Z]'))) {
    errorMessage += '• Uppercase letter is missing.\n';
  }
  // Contains at least one lowercase letter
  if (!password.contains(RegExp(r'[a-z]'))) {
    errorMessage += '• Lowercase letter is missing.\n';
  }
  // Contains at least one digit
  if (!password.contains(RegExp(r'[0-9]'))) {
    errorMessage += '• Digit is missing.\n';
  }
  // Contains at least one special character
  if (!password.contains(RegExp(r'[!@#%^&*(),.?":{}|<>]'))) {
    errorMessage += '• Special character is missing.\n';
  }
  // If there are no error messages, the password is valid
  return errorMessage.isEmpty;
}
