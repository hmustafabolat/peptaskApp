import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../view/register_page.dart';
class PurpleMainButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const PurpleMainButton({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 37),
        child: Text(text),
      ),
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

class ForgotPasswordButton extends StatelessWidget {
  final String nullText;
  const ForgotPasswordButton({Key? key, required this.nullText}) : super(key: key);

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

class SignInButton extends StatelessWidget {
  final String lightText;
  final String darkText;
  const SignInButton({Key? key, required this.lightText, required this.darkText}) : super(key: key);

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

class BackButton extends StatelessWidget {
  const BackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => Get.back(),
      icon: Icon(
        Icons.arrow_back_ios_outlined,
        color: Colors.white,
        size: 26,
      ),
    );
  }
}

