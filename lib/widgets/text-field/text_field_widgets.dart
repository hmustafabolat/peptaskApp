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
        onSaved: (value) {
          email = value;
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
        onSaved: (value) {
          password = value;
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
        onSaved: (value) {
          password = value;
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

DateTime inputDateStart = DateTime.now();

class TextFieldDateStart extends StatefulWidget {
  const TextFieldDateStart({Key? key}) : super(key: key);

  @override
  State<TextFieldDateStart> createState() => _TextFieldDateStartState();
}

class _TextFieldDateStartState extends State<TextFieldDateStart> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        inputDateStart = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime.now(),
            lastDate: DateTime.now().add(Duration(days: 365))) as DateTime;
        setState(() {});
      },
      child: Container(
        alignment: Alignment.centerLeft,
        height: 0.06.sh,
        margin: EdgeInsets.only(top: 10, bottom: 10).r,
        padding: EdgeInsets.all(2).w,
        decoration: BoxDecoration(
          border: Border.all(width: 0.003.sw, color: Colors.grey.shade400),
          color: Colors.white,
          borderRadius: BorderRadius.circular(8).w,
        ),
        child: Text(inputDateStart.toString().split(" ")[0]),
      ),
    );
  }
}

String inputDateEnd = DateTime.now().toString();

class TextFieldDateEnd extends StatelessWidget {
  const TextFieldDateEnd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        inputDateStart = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime.now(),
            lastDate: DateTime.now().add(Duration(days: 365))) as DateTime;
      },
      child: Container(
        alignment: Alignment.centerLeft,
        height: 0.06.sh,
        margin: EdgeInsets.only(top: 10, bottom: 10).r,
        padding: EdgeInsets.all(2).w,
        decoration: BoxDecoration(
          border: Border.all(width: 0.003.sw, color: Colors.grey.shade400),
          color: Colors.white,
          borderRadius: BorderRadius.circular(8).w,
        ),
        child: Text(inputDateEnd.toString().split(" ")[0]),
      ),
    );
  }
}

String description = "";

class TextFieldExplanation extends StatelessWidget {
  final String hintText;
  const TextFieldExplanation({Key? key, required this.hintText})
      : super(key: key);

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
        onChanged: (value) {
          description = value;
        },
      ),
    );
  }
}
