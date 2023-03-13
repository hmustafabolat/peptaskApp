import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  final String path;
  const LogoWidget({
    super.key, required this.path,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Image.asset(path),
    );
  }
}
