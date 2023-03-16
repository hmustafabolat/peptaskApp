import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:peptask/widgets/buttons/button.dart';
import 'package:peptask/widgets/text-field/text_field_widgets.dart';
import 'package:peptask/widgets/text/text_widgets.dart';
import '../model/user_model.dart';
import '../viewmodel/auth_viewmodel.dart';
import '../widgets/icons/icons.dart';

class UserLoginPage extends StatefulWidget {
  const UserLoginPage({Key? key}) : super(key: key);

  @override
  State<UserLoginPage> createState() => _UserLoginPageState();
}

class _UserLoginPageState extends State<UserLoginPage> {
  final _globalKey = GlobalKey<FormState>();
  String? email, password;

  final AuthViewModel _viewModel = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.grey.shade200,
          body: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(top: 100.0, left: 18, right: 18),
                child: Center(
                  child: Form(
                    key: _globalKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        AppLogo(
                          path: "assets/images/logo_icon.png",
                        ),
                        SizedBox(height: 0.02.sh),
                        AppLogo(path: "assets/images/pepteam_logo.png"),
                        SizedBox(height: 0.02.sh),
                        TextWidget(textInput: "İzin Portalı"),
                        SizedBox(height: 0.09.sh),
                        InfoTextWidget(infoText: "Email"),
                        TextFieldEmail(),
                        SizedBox(height: 0.02.sh),
                        InfoTextWidget(infoText: "Şifre"),
                        TextFieldPassword(),
                        SizedBox(height: 0.03.sh),
                        ForgotPasswordButton(nullText: "Şifremi Unuttum"),
                        SizedBox(height: 0.03.sh),
                        PurpleMainButton(
                            text: "Giriş Yap",
                            onPressed: () async {
                              if (_globalKey.currentState!.validate()) {
                                _globalKey.currentState!.save();
                                UserModel userModel =
                                    UserModel(email: email, password: password);
                                await _viewModel.signIn(userModel);
                              }
                            }),
                        SizedBox(height: 0.09.sh),
                        SignUpButton(
                            lightTextSignUp: "Hesabınız yok mu?  ",
                            darkTextSignUp: "Kaydol"),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )),
    );
  }


}
