
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../model/user_model.dart';
import '../viewmodel/auth_viewmodel.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _globalKey = GlobalKey<FormState>();
  String? username, email, password, passwordVerify;

  AuthViewModel _viewModel = AuthViewModel();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Color.fromRGBO(243, 94, 23, 1),
          body: Stack(
            children: [
              Center(
                child: Padding(
                  padding: EdgeInsets.all(10.0).w,
                  child: Container(
                    height: 0.7.sh,
                    width: 5.sw,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)).w,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(.3),
                              blurRadius: 10,
                              spreadRadius: 2)
                        ]),
                    child: _buildSignUpForm(),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 30).r,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () => Get.back(),
                        icon: Icon(
                          Icons.arrow_back_ios_outlined,
                          color: Colors.white,
                          size: 26,
                        ),
                      ),
                      Text(
                        "Kayıt ol",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }

  Padding _buildSignUpForm() {
    return Padding(
      padding: EdgeInsets.all(10).w,
      child: Center(
        child: Form(
          key: _globalKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  onSaved: (value) {
                    username = value;
                  },
                  validator: (value) {
                    if (value == null) {
                      return 'Boş değer giremezsiniz.';
                    } else if (value.contains(' ')) {
                      return 'Boş değer giremezsiniz.';
                    } else {
                      return null;
                    }
                  },
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.black,
                    ),
                    hintText: 'Kullanıcı adı',
                    prefixText: ' ',
                    hintStyle: TextStyle(color: Colors.black),
                    focusColor: Colors.black,
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                        )),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                        )),
                  )),
              SizedBox(
                height: 0.05.sh,
              ),
              TextFormField(
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  onSaved: (value) {
                    email = value;
                  },
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.mail,
                      color: Colors.black,
                    ),
                    hintText: 'E-Mail',
                    prefixText: ' ',
                    hintStyle: TextStyle(color: Colors.black),
                    focusColor: Colors.black,
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                        )),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                        )),
                  )),
              SizedBox(
                height: 0.05.sh,
              ),
              TextFormField(
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  onSaved: (value) {
                    password = value;
                  },
                  cursorColor: Colors.black,
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.vpn_key,
                      color: Colors.black,
                    ),
                    hintText: 'Parola',
                    prefixText: ' ',
                    hintStyle: TextStyle(color: Colors.black),
                    focusColor: Colors.black,
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                        )),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                        )),
                  )),
              SizedBox(
                height: 0.05.sh,
              ),
              TextFormField(
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  onSaved: (value) {
                    passwordVerify = value;
                  },
                  cursorColor: Colors.black,
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.vpn_key,
                      color: Colors.black,
                    ),
                    hintText: 'Parola Tekrar',
                    prefixText: ' ',
                    hintStyle: TextStyle(color: Colors.black),
                    focusColor: Colors.black,
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                        )),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                        )),
                  )),
              SizedBox(
                height: 0.05.sh,
              ),
              _signUpButton(),
            ],
          ),
        ),
      ),
    );
  }

  InkWell _signUpButton() {
    return InkWell(
      onTap: () async {
        if (_globalKey.currentState!.validate()) {
          _globalKey.currentState!.save();

          if (password == passwordVerify) {
            UserModel userModel = UserModel(
              username: username,
              email: email,
              password: password,
              passwordVerify: passwordVerify,
            );

            await _viewModel.signUp(userModel);

            Get.back();
          } else {
            Get.defaultDialog(title: 'Şifren uyuşmuyor');
          }
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5).r,
        decoration: BoxDecoration(
            border: Border.all(
              color: Color.fromRGBO(243, 94, 23, 1),
            ),
            color: Color.fromRGBO(243, 94, 23, 1),

            //color: colorPrimaryShade,
            borderRadius: BorderRadius.all(Radius.circular(30)).w),
        child: Padding(
          padding: EdgeInsets.all(4).w,
          child: Center(
              child: Text(
                "Kayıt Ol",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              )),
        ),
      ),
    );
  }
}