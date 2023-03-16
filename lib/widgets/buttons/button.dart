import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:peptask/model/user_model.dart';
import 'package:peptask/view/login_page.dart';

import '../../view/register_page.dart';
import '../../viewmodel/auth_viewmodel.dart';

//Uygulama Login ve Register sayfalarında kullanılan "Mor" renkli büyük butonlar.
class PurpleMainButton extends StatelessWidget {
  final _globalKey = GlobalKey<FormState>();
  String? email, password;

  final AuthViewModel _viewModel = Get.find();

  final String text;
  final VoidCallback onPressed;

  PurpleMainButton({required this.text, required this.onPressed});

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

//Şifremi unuttum butonu fonksiyon eklenmedi!!!
class ForgotPasswordButton extends StatelessWidget {
  final String nullText;

  const ForgotPasswordButton({Key? key, required this.nullText})
      : super(key: key);

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

//Login sayfasında ki "Kaydol" butonu.
class SignUpButton extends StatelessWidget {
  final String lightTextSignUp;
  final String darkTextSignUp;

  const SignUpButton(
      {Key? key, required this.lightTextSignUp, required this.darkTextSignUp})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(TextSpan(
      text: lightTextSignUp,
      style: const TextStyle(
          color: Color.fromRGBO(102, 112, 133, 1), fontSize: 16),
      children: <TextSpan>[
        TextSpan(
            text: darkTextSignUp,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(127, 86, 217, 1),
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Get.to(RegisterPage());
              }),
      ],
    ));
  }
}

//Register sayfasında ki "Giriş Yap" butonu.
class SignInButton extends StatelessWidget {
  final String lightTextSignIn;
  final String dartTextSignIn;

  SignInButton(
      {Key? key, required this.lightTextSignIn, required this.dartTextSignIn})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(TextSpan(
      text: lightTextSignIn,
      style: const TextStyle(
          color: Color.fromRGBO(102, 112, 133, 1), fontSize: 16),
      children: <TextSpan>[
        TextSpan(
            text: dartTextSignIn,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(127, 86, 217, 1),
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Get.to(UserLoginPage());
              })
      ],
    ));
  }
}

//Uygulama içerisinde kullanılacak "Back Icon" butonudur.
class BackButton extends StatelessWidget {
  final Color colorPick;
  const BackButton({Key? key, required this.colorPick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => Get.back(),
      icon: Icon(
        Icons.arrow_back_ios_outlined,
        color: colorPick,
        size: 26,
      ),
    );
  }
}

class BackLogo extends StatelessWidget {
  const BackLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () => Get.back(), icon: Icon(Icons.arrow_back));
  }
}
