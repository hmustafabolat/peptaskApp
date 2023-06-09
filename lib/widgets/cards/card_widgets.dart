import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:peptask/model/permission_model.dart';
import 'package:peptask/viewmodel/permission_viewmodel.dart';
import 'package:peptask/widgets/buttons/dropDownButton.dart';

import '../text/text_widgets.dart';

class CardWidget extends StatelessWidget {
  final String allowance;
  final int allowanceNum;
  final bool isOval;

  const CardWidget({
    Key? key,
    required this.allowance,
    required this.allowanceNum,
    this.isOval = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: isOval
            ? BorderRadius.only(
                topRight: Radius.circular(10).w,
                topLeft: Radius.circular(10).w,
              )
            : const BorderRadius.only(),
      ),
      elevation: 0.2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              allowance,
              style: TextStyle(
                fontSize: 15.0.sp,
              ),
            ),
            Text(
              allowanceNum.toString(),
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

class InkwellCard1 extends StatelessWidget {
  final PermissionModel permission;
  final PermissionViewModel _permissionViewModel = Get.find();
  InkwellCard1({Key? key, required this.permission}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return Container(
                height: 60.sh,
                width: 200.sw,
                color: Colors.white,
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(
                            top: 30, right: 20, left: 20, bottom: 10)
                        .r,
                    child: Column(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InfoTextWidget(
                            infoText: "Talep Detayları",
                          ),
                          IconButton(
                            onPressed: () {
                              _closeBottomSheet(context);
                            },
                            icon: Icon(Icons.close),
                          ),
                        ],
                      ),
                      SizedBox(height: 0.04.sh),
                      BottomSheetTextWidget(
                          textInfo: "İzin Türü",
                          dateInfo: permission.permissionType.toString()),
                      SizedBox(height: 0.03.sh),
                      BottomSheetTextWidget(
                          textInfo: "İzne Çıkış",
                          dateInfo: permission.permissionStart
                              .toString()
                              .split(" ")[0]),
                      SizedBox(height: 0.03.sh),
                      BottomSheetTextWidget(
                          textInfo: "İşe Başlama",
                          dateInfo: permission.permissionEnd
                              .toString()
                              .split(" ")[0]),
                      SizedBox(height: 0.03.sh),
                      BottomSheetTextWidget(
                          textInfo: "İzinli Gün Toplamı",
                          dateInfo: "1 iş günü"),
                      SizedBox(height: 0.03.sh),
                      BottomSheetDesciription(
                        description: "Açıklama",
                        descriptionFull: permission.description ?? "",
                      ),
                      SizedBox(height: 0.03.sh),
                      ElevatedButton(
                        onPressed: () {
                          Get.back();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          elevation: 1,
                          side: BorderSide(
                            width: 1,
                            color: Color.fromRGBO(208, 213, 221, 1),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8).r,
                          ),
                        ),
                        child: Container(
                            margin: EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 100)
                                .w,
                            child: Text(
                              "Talebi İptal Et",
                              style: TextStyle(
                                  color: Colors.black, letterSpacing: 0.6),
                            )),
                      ),
                    ]),
                  ),
                ),
              );
            });
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8).w,
          ),
        ),
        elevation: 1.0,
        child: Padding(
          padding: EdgeInsets.only(top: 10.0, left: 10, bottom: 10).r,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Sol üstteki metin
              Text(
                permission.permissionType.toString(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14.0.sp,
                ),
              ),
              SizedBox(
                height: 0.01.sh,
              ),
              Row(
                children: [
                  Text(permission.permissionStart.toString().split(" ")[0]),
                  Text(" - "),
                  Text(permission.permissionEnd.toString().split(" ")[0])
                ],
              ),

              SizedBox(
                height: 0.01.sh,
              ),

              Container(
                decoration: BoxDecoration(
                    color: Color.fromRGBO(237, 245, 255, 1),
                    borderRadius: BorderRadius.all(Radius.circular(20).w)),
                height: 0.04.sh,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    permission.statu == "pending"
                        ? "Bekliyor"
                        : permission.statu == "accepted"
                            ? "Kabul Edildi"
                            : "Red edildi",
                    style: TextStyle(
                        color: Color.fromRGBO(11, 83, 142, 1),
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _closeBottomSheet(BuildContext context) {
    Get.back();
  }
}

class InkwellCard2 extends StatelessWidget {
  final PermissionViewModel _permissionViewModel = Get.find();
  InkwellCard2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _closeBottomSheet(BuildContext context) {
      Navigator.pop(context);
    }

    return InkWell(
      onTap: () {
        showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return SingleChildScrollView(
                child: Container(
                  color: Colors.white,
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 10, right: 20, left: 20).r,
                      child: Column(children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InfoTextWidget(
                              infoText: "Talep Detayları",
                            ),
                            IconButton(
                              onPressed: () {
                                _closeBottomSheet(context);
                              },
                              icon: Icon(Icons.close),
                            ),
                          ],
                        ),
                        Image.asset(
                            "assets/images/accept-circular-button-outline.png"),
                        SizedBox(
                          height: 0.02.sh,
                        ),
                        Text(
                          "Talep Onaylandı",
                          style: TextStyle(
                            color: Color.fromRGBO(21, 158, 82, 1),
                          ),
                        ),
                        SizedBox(height: 0.04.sh),
                        BottomSheetTextWidget(
                            textInfo: "İzin Türü",
                            dateInfo: _permissionViewModel
                                .myPermission!.permissionType
                                .toString()),
                        SizedBox(height: 0.03.sh),
                        BottomSheetTextWidget(
                            textInfo: "İzne Çıkış",
                            dateInfo: _permissionViewModel
                                .myPermission!.permissionEnd
                                .toString()
                                .split(" ")[0]),
                        SizedBox(height: 0.03.sh),
                        BottomSheetTextWidget(
                            textInfo: "İşe Başlama",
                            dateInfo: _permissionViewModel
                                .myPermission!.permissionStart
                                .toString()
                                .split(" ")[0]),
                        SizedBox(height: 0.03.sh),
                        BottomSheetTextWidget(
                            textInfo: "İzinli Gün Toplamı",
                            dateInfo: "1 iş günü"),
                        SizedBox(height: 0.03.sh),
                        BottomSheetDesciription(
                          description: "Açıklama",
                          descriptionFull: _permissionViewModel
                              .myPermission!.description
                              .toString(),
                        ),
                        SizedBox(height: 0.03.sh),
                        ElevatedButton(
                          onPressed: () {
                            Get.back();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            elevation: 1,
                            side: BorderSide(
                              width: 1,
                              color: Color.fromRGBO(208, 213, 221, 1),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8).r,
                            ),
                          ),
                          child: Container(
                              margin: EdgeInsets.symmetric(
                                      vertical: 15, horizontal: 100)
                                  .w,
                              child: Text(
                                "Talebi İptal Et",
                                style: TextStyle(
                                    color: Colors.black, letterSpacing: 0.6),
                              )),
                        ),
                      ]),
                    ),
                  ),
                ),
              );
            });
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8).w,
          ),
        ),
        elevation: 1.0,
        child: Padding(
          padding:
              EdgeInsets.only(top: 10.0, right: 10, left: 10, bottom: 10).r,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Sol üstteki metin
              Text(
                _permissionViewModel.myPermission!.permissionType.toString(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14.0.sp,
                ),
              ),
              SizedBox(
                height: 0.01.sh,
              ),
              Row(
                children: [
                  Text(_permissionViewModel.myPermission!.permissionEnd
                      .toString()
                      .split(" ")[0]),
                  Text(" - "),
                  Text(_permissionViewModel.myPermission!.permissionStart
                      .toString()
                      .split(" ")[0]),
                ],
              ),

              SizedBox(
                height: 0.01.sh,
              ),

              Container(
                decoration: BoxDecoration(
                    color: Color.fromRGBO(232, 253, 220, 1),
                    borderRadius: BorderRadius.all(Radius.circular(20).w)),
                height: 0.04.sh,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Onaylandı",
                    style: TextStyle(
                        color: Color.fromRGBO(44, 131, 86, 1),
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500),
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

class InkwellCard3 extends StatelessWidget {
  final PermissionViewModel _permissionViewModel = Get.find();
  InkwellCard3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _closeBottomSheet(BuildContext context) {
      Get.back();
    }

    return InkWell(
      onTap: () {
        showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return SingleChildScrollView(
                child: Container(
                  color: Colors.white,
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.only(
                              top: 10, right: 20, left: 20, bottom: 10)
                          .r,
                      child: Column(children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InfoTextWidget(
                              infoText: "Talep Detayları",
                            ),
                            IconButton(
                              onPressed: () {
                                _closeBottomSheet(context);
                              },
                              icon: Icon(Icons.close),
                            ),
                          ],
                        ),
                        Image.asset("assets/images/reject.png"),
                        SizedBox(
                          height: 0.02.sh,
                        ),
                        Text(
                          "Talep Onaylanmadı",
                          style: TextStyle(
                            color: Color.fromRGBO(179, 35, 24, 1),
                          ),
                        ),
                        SizedBox(height: 0.04.sh),
                        BottomSheetTextWidget(
                            textInfo: "İzin Türü",
                            dateInfo: _permissionViewModel
                                .myPermission!.permissionType
                                .toString()),
                        SizedBox(height: 0.03.sh),
                        BottomSheetTextWidget(
                            textInfo: "İzne Çıkış",
                            dateInfo: _permissionViewModel
                                .myPermission!.permissionStart
                                .toString()
                                .split(" ")[0]),
                        SizedBox(height: 0.03.sh),
                        BottomSheetTextWidget(
                            textInfo: "İşe Başlama",
                            dateInfo: _permissionViewModel
                                .myPermission!.permissionStart
                                .toString()
                                .split(" ")[0]),
                        SizedBox(height: 0.03.sh),
                        BottomSheetTextWidget(
                            textInfo: "İzinli Gün Toplamı",
                            dateInfo: "1 iş günü"),
                        SizedBox(height: 0.03.sh),
                        BottomSheetDesciription(
                          description: "Açıklama",
                          descriptionFull: _permissionViewModel
                              .myPermission!.description
                              .toString(),
                        ),
                        SizedBox(height: 0.03.sh),
                      ]),
                    ),
                  ),
                ),
              );
            });
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8).w,
          ),
        ),
        elevation: 1.0,
        child: Padding(
          padding:
              EdgeInsets.only(top: 10.0, right: 130, left: 10, bottom: 10).r,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Sol üstteki metin
              Text(
                _permissionViewModel.myPermission!.permissionType.toString(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14.0.sp,
                ),
              ),
              SizedBox(
                height: 0.01.sh,
              ),
              Row(
                children: [
                  Text(_permissionViewModel.myPermission!.permissionEnd
                      .toString()
                      .split(" ")[0]),
                  Text(" - "),
                  Text(_permissionViewModel.myPermission!.permissionStart
                      .toString()
                      .split(" ")[0]),
                ],
              ),

              SizedBox(
                height: 0.01.sh,
              ),

              Container(
                decoration: BoxDecoration(
                    color: Color.fromRGBO(253, 239, 240, 1),
                    borderRadius: BorderRadius.all(Radius.circular(20).w)),
                height: 0.04.sh,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Reddedildi",
                    style: TextStyle(
                        color: Color.fromRGBO(163, 18, 20, 1),
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold),
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
