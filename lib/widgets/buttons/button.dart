import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../view/register_page.dart';
class MainButtonPurple extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const MainButtonPurple({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(text),
      style: ElevatedButton.styleFrom( 
        primary: Color.fromRGBO(127, 86, 217, 1),
        onPrimary: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 120, vertical: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}

class ForgotPassword extends StatelessWidget {
  final String nullText;
  const ForgotPassword({Key? key, required this.nullText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          nullText,
          style: TextStyle(
              color: Color.fromRGBO(127, 86, 217, 1),
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class SignUpButton extends StatelessWidget {
  final String lightText;
  final String darkText;
  const SignUpButton({Key? key, required this.lightText, required this.darkText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(TextSpan(
      text: lightText,
      style: const TextStyle(
          color: Color.fromRGBO(102, 112, 133, 1),
          fontSize: 16),
      children: <TextSpan>[
        TextSpan(
            text: darkText,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(127, 86, 217, 1),
                decoration: TextDecoration.underline),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => RegisterPage()));
              }),
      ],
    ));
  }
}


