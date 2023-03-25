import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:peptask/widgets/buttons/button.dart';
import 'package:peptask/widgets/text-field/custom_text_field.dart';
import 'package:peptask/widgets/text/text_widgets.dart';
import '../viewmodel/auth_viewmodel.dart';
import '../widgets/icons/icons.dart';

class UserLoginPage extends StatefulWidget {
  const UserLoginPage({Key? key}) : super(key: key);

  @override
  State<UserLoginPage> createState() => _UserLoginPageState();
}

class _UserLoginPageState extends State<UserLoginPage> {
  final AuthViewModel _viewModel = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: _buildBody(),
      ),
    );
  }

  SingleChildScrollView _buildBody() {
    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: EdgeInsets.only(top: 100.0, left: 18, right: 18),
          child: Center(
            child: Form(
              key: _viewModel.signInFormGlobalKey,
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
                  CustomTextField(
                    hintText: "Email",
                    onSaved: (value) {
                      _viewModel.email = value;
                    },
                  ),
                  SizedBox(height: 0.02.sh),
                  InfoTextWidget(infoText: "Şifre"),
                  CustomTextField(
                    hintText: "Şifre",
                    onSaved: (value) {
                      _viewModel.password = value;
                    },
                  ),
                  SizedBox(height: 0.03.sh),
                  ForgotPasswordButton(nullText: "Şifremi Unuttum"),
                  SizedBox(height: 0.03.sh),
                  PurpleMainButton(
                    text: "Giriş Yap",
                    onPressed: _viewModel.signIn,
                  ),
                  SizedBox(height: 0.09.sh),
                  SignUpButton(
                    lightTextSignUp: "Hesabınız yok mu?  ",
                    darkTextSignUp: "Kaydol",
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
