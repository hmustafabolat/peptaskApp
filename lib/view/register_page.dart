
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:peptask/widgets/buttons/button.dart';

import '../model/user_model.dart';
import '../viewmodel/auth_viewmodel.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _globalKey = GlobalKey<FormState>();
  String? name, email, password;

  AuthViewModel _viewModel = AuthViewModel();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Color.fromRGBO(246,246,246,1),
          body: Stack(
            children: [
              Padding(
                padding: EdgeInsets.all(18).w,
                child: Center(
                  child: Form(
                    key: _globalKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        buildTextFormFieldName(),
                        SizedBox(
                          height: 0.05.sh,
                        ),
                        buildTextFormFieldEmail(),
                        SizedBox(
                          height: 0.05.sh,
                        ),
                        buildTextFormFieldPassword(),
                        SizedBox(
                          height: 0.05.sh,
                        ),
                        PurpleMainButton(text: "Kayıt Ol", onPressed: () async {
                          if (_globalKey.currentState!.validate()) {
                            _globalKey.currentState!.save();
                          }
                        },),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 30, left: 15 ).r,
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Kayıt ol",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
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
                            hintText: 'Şifre Oluştur',
                            focusColor: Color.fromRGBO(208, 213, 221, 1),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromRGBO(208, 213, 221, 1),
                                )),
                          ));
  }

  TextFormField buildTextFormFieldName() {
    return TextFormField(
                          style: TextStyle(
                            color: Colors.black,
                          ),
                          onSaved: (value) {
                            name = value;
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
                    obscureText: false,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromRGBO(208, 213, 221, 1),
                        ),
                      ),
                      hintText: 'Tam Adınızı Giriniz',
                      focusColor: Color.fromRGBO(208, 213, 221, 1),
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
                          obscureText: false,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromRGBO(208, 213, 221, 1),
                              ),
                            ),
                            hintText: 'Email',
                            focusColor: Color.fromRGBO(208, 213, 221, 1),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromRGBO(208, 213, 221, 1),
                                )),
                          ));
  }
}