import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String textInput;

  const TextWidget({Key? key, required this.textInput}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(textInput);
  }
}

class RegisterPageSignUpText extends StatelessWidget {
  const RegisterPageSignUpText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Text(
        "Kayıt ol",
        style: TextStyle(
            fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class InfoTextWidget extends StatelessWidget {
  final String infoText;
  const InfoTextWidget({Key? key, required this.infoText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Text(
        infoText,
        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
      ),
    );
  }
}
