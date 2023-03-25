import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:peptask/model/permission_model.dart';
import 'package:peptask/viewmodel/permission_viewmodel.dart';
import 'package:peptask/widgets/buttons/button.dart';
import 'package:peptask/widgets/buttons/dropDownButton.dart';
import 'package:peptask/widgets/text-field/custom_text_field.dart';
import 'package:peptask/widgets/text-field/text_field_widgets.dart';
import 'package:peptask/widgets/text/text_widgets.dart';

final List<String> permissionType = [
  'Ücretli İzin',
  'Ücretsiz İzin',
  'Yıllık İzin'
];

class PermissionRequestPage extends StatefulWidget {
  PermissionRequestPage({Key? key}) : super(key: key);

  @override
  State<PermissionRequestPage> createState() => _PermissionRequestPageState();
}

class _PermissionRequestPageState extends State<PermissionRequestPage> {
  final PermissionViewModel _permissionViewModel = PermissionViewModel();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(246, 246, 246, 1),
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          centerTitle: true,
          title: Text(
            "Yeni İzin Talebi",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          backgroundColor: Color.fromRGBO(255, 255, 255, 1),
          elevation: 0.8,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 20.0, left: 10, right: 10).w,
            child: Form(
              key: _permissionViewModel.permissionFormGlobalKey,
              child: Column(
                children: [
                  InfoTextWidget(infoText: "İzin Türü"),
                  SizedBox(height: 0.015.sh),
                  DropDownButton(),
                  SizedBox(
                    height: 0.015.sh,
                  ),
                  InfoTextWidget(infoText: "Çıkış Tarihi"),
                  CustomDateTimeSelectWidget(
                    onTap: () async {
                      DateTime selectedDateTime = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime.now(),
                              lastDate: DateTime.now().add(Duration(days: 365)))
                          as DateTime;

                      _permissionViewModel.permissionStart = selectedDateTime;

                      setState(() {});
                    },
                    dateTime: _permissionViewModel.permissionStart,
                  ),
                  SizedBox(
                    height: 0.015.sh,
                  ),
                  InfoTextWidget(infoText: "Başlama Tarihi"),
                  CustomDateTimeSelectWidget(
                    onTap: () async {
                      DateTime selectedDateTime = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime.now(),
                              lastDate: DateTime.now().add(Duration(days: 365)))
                          as DateTime;

                      _permissionViewModel.permissionEnd = selectedDateTime;

                      setState(() {});
                    },
                    dateTime: _permissionViewModel.permissionEnd,
                  ),
                  SizedBox(
                    height: 0.015.sh,
                  ),
                  InfoTextWidget(infoText: "Açıklama (Opsiyonel)"),
                  CustomTextField(
                    hintText: "    Açıklama girebilirsiniz.",
                    onSaved: (value) {
                      _permissionViewModel.description = value;
                    },
                  ),
                  SizedBox(
                    height: 0.15.sh,
                  ),
                  RequestSendButton(
                    onPressed: _permissionViewModel.addPermission,
                  ),
                  SizedBox(
                    height: 0.05.sh,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
