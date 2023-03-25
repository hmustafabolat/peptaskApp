import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextWidget extends StatelessWidget {
  final String textInput;

  const TextWidget({Key? key, required this.textInput}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(textInput);
  }
}

class RegisterPageSignUpText extends StatelessWidget {
  const RegisterPageSignUpText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Text(
        "Kayıt ol",
        style: TextStyle(
            fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class InfoTextWidget extends StatelessWidget {
  final String infoText;

  const InfoTextWidget({Key? key, required this.infoText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Text(
        infoText,
        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
      ),
    );
  }
}

class BottomSheetTextWidget extends StatelessWidget {
  final String textInfo;
  final String dateInfo;

  const BottomSheetTextWidget(
      {Key? key, required this.textInfo, required this.dateInfo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          textInfo,
          style: TextStyle(
            color: Color.fromRGBO(102, 112, 133, 1),
          ),
        ),
        Text(
          dateInfo,
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14.sp),
        ),
      ],
    );
  }
}

class BottomSheetDesciription extends StatelessWidget {
  final String description;
  final String descriptionFull;
  const BottomSheetDesciription(
      {Key? key, required this.description, required this.descriptionFull})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          description,
          style: TextStyle(
            color: Color.fromRGBO(102, 112, 133, 1),
            fontSize: 14.sp,
          ),
        ),
        SizedBox(height: 0.03.sh),
        Text(
          descriptionFull,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
        ),
      ],
    );
  }
}
