import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:peptask/view/permission_request.dart';
import 'package:peptask/widgets/cards/card_widgets.dart';
import 'package:peptask/widgets/icons/icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdminMainPage extends StatelessWidget {
  const AdminMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
              crossAxisAlignment: CrossAxisAlignment.start,
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
                  style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold, color: Colors.indigo.shade800),
                ),
                SizedBox(
                  height: 0.02.sh,
                ),
                InkWell(
                  onTap: (){
                    Get.to(PermissionRequestPage());
                  },
                  child: DottedBorder(
                    dashPattern: [6, 3, 6, 3],
                    borderType: BorderType.RRect,
                    radius: Radius.circular(5).w,
                    padding: EdgeInsets.all(10).w,
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20).w,
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
                                fontWeight: FontWeight.w500
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
                          'Ücretsiz İzin Talebi',
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
                              color: Color.fromRGBO(232, 253, 220, 1),
                              borderRadius: BorderRadius.all(Radius.circular(20).w)
                          ),

                          height: 0.04.sh,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Onaylandı",
                              style: TextStyle(
                                  color: Color.fromRGBO(44, 131, 86, 1),
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500
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
                          'Ücretsiz İzin Talebi',
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
                              color: Color.fromRGBO(253, 239, 240, 1),
                              borderRadius: BorderRadius.all(Radius.circular(20).w)
                          ),

                          height: 0.04.sh,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Reddedildi",
                              style: TextStyle(
                                  color: Color.fromRGBO(163, 18, 20, 1),
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
      ),
    );
  }
}
