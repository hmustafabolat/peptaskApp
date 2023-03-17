import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../viewmodel/auth_viewmodel.dart';

final _globalKey = GlobalKey<FormState>();
String? email, password, name;

final AuthViewModel _viewModel = Get.find();

class TextFieldEmail extends StatelessWidget {
  TextFieldEmail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 10).r,
      padding: EdgeInsets.all(2).w,
      decoration: BoxDecoration(
        border: Border.all(width: 0.003.sw, color: Colors.grey.shade400),
        color: Colors.white,
        borderRadius: BorderRadius.circular(8).w,
      ),
      child: TextFormField(
        onSaved: (value){
          email=value;
        },
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: '  Email girin',

        ),
      ),
    );
  }
}

class TextFieldPassword extends StatelessWidget {
  const TextFieldPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 10).r,
      padding: EdgeInsets.all(2).w,
      decoration: BoxDecoration(
        border: Border.all(width: 0.003.sw, color: Colors.grey.shade400),
        color: Colors.white,
        borderRadius: BorderRadius.circular(8).w,
      ),
      child: TextFormField(
        onSaved: (value){
          password=value;
        },
        obscureText: true,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: '  Şifre',
        ),
      ),
    );
  }
}

class TextFieldName extends StatelessWidget {
  const TextFieldName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 10).r,
      padding: EdgeInsets.all(2).w,
      decoration: BoxDecoration(
        border: Border.all(width: 0.003.sw, color: Colors.grey.shade400),
        color: Colors.white,
        borderRadius: BorderRadius.circular(8).w,
      ),
      child: TextFormField(
        onSaved: (value){
          password=value;
        },


        obscureText: false,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Tam adınızı girin',
        ),
      ),
    );
  }
}

class TextFieldDate extends StatelessWidget {
  final String hintText;
  const TextFieldDate({Key? key, required this.hintText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 10).r,
      padding: EdgeInsets.all(2).w,
      decoration: BoxDecoration(
        border: Border.all(width: 0.003.sw, color: Colors.grey.shade400),
        color: Colors.white,
        borderRadius: BorderRadius.circular(8).w,
      ),
      child: TextFormField(
        obscureText: false,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
        ),
      ),
    );
  }
}

class TextFieldExplanation extends StatelessWidget {
  final String hintText;
  const TextFieldExplanation({Key? key, required this.hintText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 10).r,
      padding: EdgeInsets.only(top: 2, left: 2, bottom: 80).w,
      decoration: BoxDecoration(
        border: Border.all(width: 0.003.sw, color: Colors.grey.shade400),
        color: Colors.white,
        borderRadius: BorderRadius.circular(8).w,
      ),
      child: TextFormField(
        obscureText: false,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
        ),
      ),
    );
  }
}




