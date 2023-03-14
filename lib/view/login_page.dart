import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:peptask/view/register_page.dart';
import 'package:peptask/widgets/buttons/button.dart';
import '../model/user_model.dart';
import '../viewmodel/auth_viewmodel.dart';
import '../widgets/icons/icons.dart';

class UserLoginPage extends StatefulWidget {
  const UserLoginPage({Key? key}) : super(key: key);

  @override
  State<UserLoginPage> createState() => _UserLoginPageState();
}

class _UserLoginPageState extends State<UserLoginPage> {
  final _globalKey = GlobalKey<FormState>();
  String? email, password;

  final AuthViewModel _viewModel = AuthViewModel();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Color.fromRGBO(246, 246, 246, 1),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: Form(
                  key: _globalKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      LogoWidget(
                        path: "assets/images/logo_icon.png",
                      ),
                      LogoWidget(path: "assets/images/pepteam_logo.png"),
                      Text("İzin Portalı"),
                      buildTextFormFieldEmail(),
                      buildTextFormFieldPassword(),
                      ForgotPassword(nullText: "Şifremi Unuttum"),
                      MainButtonPurple(text: "Giriş Yap", onPressed: () {
                        () async {
                          if (_globalKey.currentState!.validate()) {
                            _globalKey.currentState!.save();

                            UserModel userModel =
                            UserModel(email: email, password: password);

                            await _viewModel.signIn(userModel);
                          }
                        };
                      },),
                      SignUpButton(lightText: "Hesabınız yok mu?  ", darkText: "Kaydol"),

                    ],
                  ),
                ),
              ),
            ),
          )),
    );
  }

  TextFormField buildTextFormFieldPassword() {
    return TextFormField(
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        onSaved: (value) {
                          password = value;
                        },
                        cursorColor: Colors.black,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromRGBO(208, 213, 221, 1),
                            ),
                          ),
                          hintText: 'Parola',
                          focusColor: Colors.black,
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                            color: Colors.black,
                          )),
                        ));
  }

  TextFormField buildTextFormFieldEmail() {
    return TextFormField(
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      onSaved: (value) {
                        email = value;
                      },
                      cursorColor: Colors.black,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromRGBO(208, 213, 221, 1),
                              width: 4),
                        ),
                        hintText: "Email Girin",
                      ),
                    );
  }
}
