import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDateTimeSelectWidget extends StatelessWidget {
  final void Function()? onTap;
  DateTime dateTime;
  CustomDateTimeSelectWidget({
    Key? key,
    required this.dateTime,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
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
        child: Text(dateTime.toString().split(" ")[0]),
      ),
    );
  }
}
