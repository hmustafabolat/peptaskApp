import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


class AppLogo extends StatelessWidget {
  final String path;
  const AppLogo({
    super.key, required this.path,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Image.asset(path),
    );
  }
}

class BackLogo extends StatelessWidget {
  const BackLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: () => Get.back(), icon: Icon(Icons.arrow_back));
  }
}

