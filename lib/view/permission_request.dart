import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:peptask/widgets/buttons/dropDownButton.dart';
import 'package:peptask/widgets/text/text_widgets.dart';

class PermissionRequestPage extends StatefulWidget {
  const PermissionRequestPage({Key? key}) : super(key: key);

  @override
  State<PermissionRequestPage> createState() => _PermissionRequestPageState();
}

class _PermissionRequestPageState extends State<PermissionRequestPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(246, 246, 246, 1),
        appBar: AppBar(
          leading: BackButton(color: Colors.black,),
          centerTitle: true,
          title: Text("Yeni İzin Talebi",style: TextStyle(color: Colors.black,),),
          backgroundColor: Color.fromRGBO(255, 255, 255, 1),
          elevation: 0.8,
        ),
        body: Padding(
          padding:  EdgeInsets.only(top: 20.0, left: 10, right: 10).w,
          child: Column(children: [
            InfoTextWidget(infoText: "İzin Türü"),
            DropdownButtonExample(),
          ],),
        ),
      ),
    );
  }
}
