import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  final String? hintText;
  final void Function(String?)? onSaved;
  CustomTextField({Key? key, required this.hintText, required this.onSaved})
      : super(key: key);

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
        onSaved: onSaved,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
        ),
      ),
    );
  }
}
