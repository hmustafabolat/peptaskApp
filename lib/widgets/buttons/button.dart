import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:peptask/model/permission_model.dart';
import 'package:peptask/model/user_model.dart';
import 'package:peptask/service/firestore_service.dart';
import 'package:peptask/service/permission_service.dart';
import 'package:peptask/view/login_page.dart';
import 'package:peptask/view/request_accept_page.dart';
import 'package:peptask/widgets/text-field/text_field_widgets.dart';
import 'package:peptask/widgets/text/text_widgets.dart';

import '../../view/permission_request.dart';
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
      child: Container(
          margin: EdgeInsets.symmetric(vertical: 15).w, child: Text(text)),
      style: ElevatedButton.styleFrom(
        primary: Color.fromRGBO(127, 86, 217, 1),
        onPrimary: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        minimumSize: Size(double.infinity, 40),
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

//Uygulama da geri gelmek için kullanılan butondur.
class BackLogo extends StatelessWidget {
  const BackLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () => Get.back(), icon: Icon(Icons.arrow_back));
  }
}

class RequestSendButton extends StatelessWidget {
  final void Function()? onPressed;
  const RequestSendButton({Key? key, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Container(
          margin: EdgeInsets.symmetric(vertical: 15, horizontal: 115).w,
          child: Text("Talebi Gönder")),
      style: ElevatedButton.styleFrom(
        backgroundColor: Color.fromRGBO(127, 86, 217, 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}

class DottedBorderButton extends StatelessWidget {
  final void Function()? onTap;
  const DottedBorderButton({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(right: 8.0, left: 8).r,
        child: DottedBorder(
          dashPattern: [6, 3, 6, 3],
          borderType: BorderType.RRect,
          radius: Radius.circular(5).w,
          padding: EdgeInsets.all(10).w,
          child: ClipRRect(
            borderRadius: BorderRadius.all(
              Radius.circular(20).w,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.add),
                Text(
                  " Yeni İzin Talebi",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, letterSpacing: 0.2),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
