import 'package:dotted_border/dotted_border.dart';
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              CardWidgetTop(allowance: "Onaylanan İzinlerim", allowanceNum: 4),
              CardWidgetMid(allowance: "Reddedilen İzinlerim", allowanceNum: 4),
              CardWidgetMid2(allowance: "Ücretsiz İzinlerim", allowanceNum: 5),
              CardWidgetBottom(allowance: "Yıllık İzin Hakkım", allowanceNum: 43),
              SizedBox(
                height: 0.02.sh,
              ),
              Text(
                "Bekleyen Talepler",
                style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 0.02.sh,
              ),
              DottedBorder(
                dashPattern: [6, 3, 6, 3],
                borderType: BorderType.RRect,
                radius: Radius.circular(5),
                padding: EdgeInsets.all(10),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.add),
                      Text(" Yeni İzin Talebi"),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 0.02.sh,
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                elevation: 1.0,
                child: Padding(
                  padding:
                      EdgeInsets.only(top: 10.0, right: 130, left: 10, bottom: 10)
                          .r,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Sol üstteki metin
                      Text(
                        'Yıllık İzin',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14.0.sp,
                        ),
                      ),
                      SizedBox(
                        height: 0.01.sh,
                      ),
                      Text("18.02.2022 - 19.02.2022 (1 İş Günü)"),

                      SizedBox(
                        height: 0.01.sh,
                      ),

                      Container(
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(237, 245, 255, 1),
                          borderRadius: BorderRadius.all(Radius.circular(20).w)
                        ),

                        height: 0.04.sh,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Bekliyor",
                            style: TextStyle(
                              color: Color.fromRGBO(11, 83, 142, 1),
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                elevation: 1.0,
                child: Padding(
                  padding:
                  EdgeInsets.only(top: 10.0, right: 130, left: 10, bottom: 10)
                      .r,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Sol üstteki metin
                      Text(
                        'Yıllık İzin',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14.0.sp,
                        ),
                      ),
                      SizedBox(
                        height: 0.01.sh,
                      ),
                      Text("18.02.2022 - 19.02.2022 (1 İş Günü)"),

                      SizedBox(
                        height: 0.01.sh,
                      ),

                      Container(
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(237, 245, 255, 1),
                            borderRadius: BorderRadius.all(Radius.circular(20).w)
                        ),

                        height: 0.04.sh,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Bekliyor",
                            style: TextStyle(
                                color: Color.fromRGBO(11, 83, 142, 1),
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                elevation: 1.0,
                child: Padding(
                  padding:
                  EdgeInsets.only(top: 10.0, right: 130, left: 10, bottom: 10)
                      .r,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Sol üstteki metin
                      Text(
                        'Yıllık İzin',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14.0.sp,
                        ),
                      ),
                      SizedBox(
                        height: 0.01.sh,
                      ),
                      Text("18.02.2022 - 19.02.2022 (1 İş Günü)"),

                      SizedBox(
                        height: 0.01.sh,
                      ),

                      Container(
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(237, 245, 255, 1),
                            borderRadius: BorderRadius.all(Radius.circular(20).w)
                        ),

                        height: 0.04.sh,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Bekliyor",
                            style: TextStyle(
                                color: Color.fromRGBO(11, 83, 142, 1),
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
