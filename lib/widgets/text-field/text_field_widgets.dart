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
          hintText: 'Email girin',

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
          hintText: 'Şifre',
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
        validator: (value) {
          if (value == null) {
            return 'Boş değer giremezsiniz.';
          } else if (value.contains(' ')) {
            return 'Boş değer giremezsiniz.';
          } else {
            return null;
          }
        },
        obscureText: true,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Tam adınızı girin',
        ),
      ),
    );
  }
}

