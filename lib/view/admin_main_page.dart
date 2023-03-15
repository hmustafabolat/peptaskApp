import 'package:flutter/material.dart';
import 'package:peptask/widgets/cards/card_widgets.dart';
import 'package:peptask/widgets/icons/icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdminMainPage extends StatelessWidget {
  const AdminMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(246, 246, 246, 1),
      appBar: AppBar(
        title: Text(
          "pepteam",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        elevation: 1,
        leading: AppLogo(path: "assets/images/logo icon small.png"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            CardWidgetTop(allowance: "Onaylanan İzinlerim", allowanceNum: 4),
            SizedBox(
              height: 0.001.sh,
            ),
            CardWidgetMid(allowance: "Reddedilen İzinlerim", allowanceNum: 4),
            SizedBox(
              height: 0.001.sh,
            ),
            CardWidgetMid2(allowance: "Ücretsiz İzinlerim", allowanceNum: 5),
            SizedBox(
              height: 0.001.sh,
            ),
            CardWidgetBottom(allowance: "Yıllık İzin Hakkım", allowanceNum: 43)
          ],
        ),
      ),
    );
  }
}
