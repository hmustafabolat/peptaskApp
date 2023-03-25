import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:peptask/view/permission_request.dart';
import 'package:peptask/widgets/cards/card_widgets.dart';
import 'package:peptask/widgets/icons/icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../viewmodel/auth_viewmodel.dart';

class AdminPermissionController extends StatelessWidget {
  const AdminPermissionController({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(246, 246, 246, 1),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 0.07.sh,
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.only(left: 14.0),
                  child: Row(
                    children: [
                      Image.asset("assets/images/logo icon small.png"),
                      SizedBox(width: 0.02.sw),
                      Image.asset("assets/images/pepteam_logo.png"),
                      SizedBox(width: 0.55.sw,),
                      CircleAvatar(child: IconButton(onPressed: () async {
                        final AuthViewModel _viewModel = Get.find();
                        await _viewModel.signOut();
                      }, icon: Icon(Icons.person),),)
                    ],
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.all(8).w, child: Column(children: [
                CardWidget(allowance: "Onay Bekleyen İzinler", allowanceNum: 4),
                CardWidget(allowance: "Onaylanan İzinler", allowanceNum: 4),
                CardWidget(allowance: "Reddedilen İzinler", allowanceNum: 5),
                CardWidget(allowance: "Bugün İzinli Sayısı", allowanceNum: 43),
                SizedBox(
                  height: 0.02.sh,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8.0).r,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Bekleyen Talepler",
                        style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold, color: Colors.indigo.shade800),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 0.02.sh,
                ),

                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8).w,
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
                      Radius.circular(8).w,
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
                      Radius.circular(8).w,
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
              ],),),

            ],
          ),
        ),
      ),
    );
  }
}
