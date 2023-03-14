import 'package:flutter/material.dart';


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
