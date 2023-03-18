import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:peptask/model/user_model.dart';
import 'package:peptask/view/login_page.dart';
import 'package:peptask/widgets/text/text_widgets.dart';

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
          margin: EdgeInsets
              .symmetric(vertical: 15, horizontal: 125)
              .w,
          child: Text(text)),
      style: ElevatedButton.styleFrom(
        primary: Color.fromRGBO(127, 86, 217, 1),
        onPrimary: Colors.white,
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

class RequestSendButton extends StatelessWidget {
  const RequestSendButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return Container(
                height: 60.sh,
                width: 200.sw,
                color: Colors.white,
                child: Center(
                  child: Padding(
                    padding: EdgeInsets
                        .only(top: 30, right: 20, left: 20)
                        .r,
                    child: Column(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InfoTextWidget(infoText: "Talep Detayları",),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.close),
                          ),
                        ],
                      ),
                      SizedBox(height: 0.04.sh),
                      BottomSheetTextWidget(
                          textInfo: "İzin Türü", dateInfo: "18.03.2023"),
                      SizedBox(height: 0.03.sh),
                      BottomSheetTextWidget(
                          textInfo: "İzne Çıkış", dateInfo: "23.04.2023"),
                      SizedBox(height: 0.03.sh),
                      BottomSheetTextWidget(
                          textInfo: "İşe Başlama", dateInfo: "10.02.2022"),
                      SizedBox(height: 0.03.sh),
                      BottomSheetTextWidget(
                          textInfo: "İzinli Gün Toplamı",
                          dateInfo: "1 iş günü"),
                      SizedBox(height: 0.03.sh),
                      BottomSheetDesciription(
                        description: "Açıklama",
                        descriptionFull: "Mattis elit et nulla nec sed feugiat ut blandit tellus condimentum.",),
                      SizedBox(height: 0.03.sh),
                      ElevatedButton(onPressed: (){}, child: Text("Talebi İptal Et"),),
                    ]),
                  ),
                ),
              );
            });
      },
      child: Container(
          margin: EdgeInsets
              .symmetric(vertical: 15, horizontal: 115)
              .w,
          child: Text("Talebi Gönder")),
      style: ElevatedButton.styleFrom(
        primary: Color.fromRGBO(127, 86, 217, 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
