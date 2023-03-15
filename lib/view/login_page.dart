import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:peptask/widgets/buttons/button.dart';
import 'package:peptask/widgets/text/text_widgets.dart';
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

  final AuthViewModel _viewModel = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Color.fromRGBO(246, 246, 246, 1),
          body: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(top: 100.0, left: 18, right: 18),
                child: Center(
                  child: Form(
                    key: _globalKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(height: 0.06.sh),
                        AppLogo(
                          path: "assets/images/logo_icon.png",
                        ),
                        SizedBox(height: 0.02.sh),
                        AppLogo(path: "assets/images/pepteam_logo.png"),
                        SizedBox(height: 0.02.sh),
                        TextWidget(textInput: "İzin Portalı"),
                        SizedBox(height: 0.1.sh),
                        buildTextFormFieldEmail(),
                        SizedBox(height: 0.06.sh),
                        buildTextFormFieldPassword(),
                        SizedBox(height: 0.03.sh),
                        ForgotPasswordButton(nullText: "Şifremi Unuttum"),
                        SizedBox(height: 0.03.sh),
                        PurpleMainButton(
                            text: "Giriş Yap",
                            onPressed: () async {
                              if (_globalKey.currentState!.validate()) {
                                _globalKey.currentState!.save();
                                UserModel userModel =
                                    UserModel(email: email, password: password);
                                await _viewModel.signIn(userModel);
                              }
                            }),
                        SizedBox(height: 0.09.sh),
                        SignUpButton(
                            lightTextSignUp: "Hesabınız yok mu?  ",
                            darkTextSignUp: "Kaydol"),
                      ],
                    ),
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
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
            color: Color.fromRGBO(208, 213, 221, 1),
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
          borderSide:
              BorderSide(color: Color.fromRGBO(208, 213, 221, 1), width: 4),
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromRGBO(208, 213, 221, 1))),
        hintText: "Email Girin",
      ),
    );
  }
}
