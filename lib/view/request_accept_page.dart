import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:peptask/view/employees_page.dart';
import 'package:peptask/widgets/buttons/button.dart';
import 'package:peptask/widgets/text/text_widgets.dart';

class RequestAcceptPage extends StatelessWidget {
  const RequestAcceptPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Image.asset("assets/images/accept.png"),
          SizedBox(height: 0.1.sh,),
          Text("İzin Talebiniz Başarıyla Gönderildi", style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold, color: Color.fromRGBO(127, 86, 217, 1)),),
        SizedBox(height: 0.2.sh,),
        ElevatedButton(
          onPressed: (){
            Get.to(AdminMainPage());
          },
          child: Container(
              margin: EdgeInsets.symmetric(vertical: 15, horizontal: 105).w,
              child: Text("Ana Sayfaya Dön", style: TextStyle(fontSize: 13.sp),)),
          style: ElevatedButton.styleFrom(
            primary: Color.fromRGBO(127, 86, 217, 1),
            onPrimary: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        ],),
      ),
    );
  }
}
