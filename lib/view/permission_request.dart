import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:peptask/model/permission_model.dart';
import 'package:peptask/viewmodel/permission_viewmodel.dart';
import 'package:peptask/widgets/buttons/button.dart';
import 'package:peptask/widgets/buttons/dropDownButton.dart';
import 'package:peptask/widgets/text-field/text_field_widgets.dart';
import 'package:peptask/widgets/text/text_widgets.dart';

final List<String> permissionType = [
  'Ücretli İzin',
  'Ücretsiz İzin',
  'Yıllık İzin'
];

String? selectedValue;

final _formKey = GlobalKey<FormState>();

class PermissionRequestPage extends StatefulWidget {
  final PermissionViewModel _permissionViewModel = PermissionViewModel();

  final _descriptionController = TextEditingController();
  final _permissionStartController = TextEditingController();
  final _permissionEndController = TextEditingController();
  final _permissionTypeController = TextEditingController();
  final _statusController = TextEditingController();
  final _userIDController = TextEditingController();
  PermissionRequestPage({Key? key}) : super(key: key);

  @override
  State<PermissionRequestPage> createState() => _PermissionRequestPageState();
}

class _PermissionRequestPageState extends State<PermissionRequestPage> {
  var permissionModel = Permission(
      description: "",
      permissionStart: DateTime.now(),
      permissionEnd: DateTime.now(),
      statu: "",
      permissionType: "",
      userID: "");
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
            child: Column(
              children: [
                InfoTextWidget(infoText: "İzin Türü"),
                SizedBox(height: 0.015.sh),
                DropDownButton(),
                SizedBox(
                  height: 0.015.sh,
                ),
                InfoTextWidget(infoText: "Çıkış Tarihi"),
                TextFieldDateStart(),
                SizedBox(
                  height: 0.015.sh,
                ),
                InfoTextWidget(infoText: "Başlama Tarihi"),
                TextFieldDateEnd(),
                SizedBox(
                  height: 0.015.sh,
                ),
                InfoTextWidget(infoText: "Açıklama (Opsiyonel)"),
                TextFieldExplanation(hintText: "    Açıklama girebilirsiniz."),
                SizedBox(
                  height: 0.15.sh,
                ),
                RequestSendButton(),
                SizedBox(
                  height: 0.05.sh,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
