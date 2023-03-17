import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:peptask/model/user_model.dart';
import 'package:peptask/widgets/buttons/button.dart';

import 'package:peptask/widgets/text-field/text_field_widgets.dart';
import 'package:peptask/widgets/text/text_widgets.dart';

import '../viewmodel/auth_viewmodel.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _globalKey = GlobalKey<FormState>();

  AuthViewModel _viewModel = AuthViewModel();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Color.fromRGBO(246, 246, 246, 1),
          body: SingleChildScrollView(
            child: Stack(
              children: [
                BackLogo(),
                Padding(
                  padding: EdgeInsets.only(top: 50, left: 15).r,
                  child: RegisterPageSignUpText(),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 90, left: 17, right: 17).r,
                  child: Center(
                    child: Form(
                      key: _globalKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 0.03.sh,),
                          InfoTextWidget(infoText: "Tam Adınız"),
                          TextFieldName(),
                          SizedBox(
                            height: 0.03.sh,
                          ),
                          InfoTextWidget(infoText: "Email"),
                          TextFieldEmail(),
                          SizedBox(
                            height: 0.03.sh,
                          ),
                          InfoTextWidget(infoText: "Şifre"),
                          TextFieldPassword(),
                          SizedBox(
                            height: 0.05.sh,
                          ),
                          PurpleMainButton(
                            text: "Kayıt Ol",
                            onPressed: () async {
                              if (_globalKey.currentState!.validate()) {
                                _globalKey.currentState!.save();
                                _viewModel.signUp(UserModel(email: email,password: password,name: name));
                                Get.back();
                              }
                            },
                          ),
                          SizedBox(
                            height: 0.09.sh,
                          ),
                          SignInButton(lightTextSignIn: "Hesabınız var mı? ", dartTextSignIn: "Giriş Yap")
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }}
