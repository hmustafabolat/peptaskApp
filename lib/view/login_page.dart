import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:peptask/view/register_page.dart';

import '../model/user_model.dart';
import '../viewmodel/auth_viewmodel.dart';

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
                      _emailTextField(),
                      _passwordTextField(),
                      _signInButton(),
                      _goRegisterPageButton(),
                      SizedBox(
                        height: 0.01.sh,
                      ),

                    ],
                  ),
                ),
              ),
            ),
          )),
    );
  }

  InkWell _goRegisterPageButton() {
    return InkWell(
      onTap: () {
        Get.to(() => RegisterPage());
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 0.002.sh,
            width: 0.2.sw,
            color: Colors.black,
          ),
          Text(
            "Kayıt ol",
            style: TextStyle(color: Colors.black),
          ),
          Container(
            height: 0.002.sh,
            width: 0.2.sw,
            color: Colors.black,
          ),
        ],
      ),
    );
  }

  InkWell _signInButton() {
    return InkWell(
      onTap: () async {
        if (_globalKey.currentState!.validate()) {
          _globalKey.currentState!.save();

          UserModel userModel = UserModel(email: email, password: password);

          await _viewModel.signIn(userModel);
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
            color: Color.fromRGBO(127, 86, 217, 1),
            //color: colorPrimaryShade,
            borderRadius: BorderRadius.all(Radius.circular(8))),
        child: Center(
            child: Text(
          "Giriş yap",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        )),
      ),
    );
  }

  TextFormField _passwordTextField() {
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
          prefixIcon: Icon(
            Icons.vpn_key,
            color: Colors.black,
          ),
          hintText: 'Parola',
          prefixText: ' ',
          hintStyle: TextStyle(
            color: Colors.black,
          ),
          focusColor: Colors.black,
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
            color: Colors.black,
          )),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
            color: Colors.black,
          )),
        ));
  }

  TextFormField _emailTextField() {
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
          prefixIcon: Icon(
            Icons.mail,
            color: Colors.black,
          ),
          hintText: 'E-Mail',
          prefixText: ' ',
          hintStyle: TextStyle(color: Colors.black, letterSpacing: 1),
          focusColor: Colors.black,
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
            color: Colors.black,
          )),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
            color: Colors.black,
          )),
        ));
  }
}
