import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peptask/view/permission_request.dart';
import 'package:peptask/viewmodel/permission_viewmodel.dart';
import 'package:peptask/widgets/buttons/button.dart';
import 'package:peptask/widgets/cards/card_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../viewmodel/auth_viewmodel.dart';

class UserMainPage extends StatelessWidget {
  UserMainPage({Key? key}) : super(key: key);

  final PermissionViewModel _permissionViewModel = Get.find();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _permissionViewModel.getAllPermission(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasData) {
          _permissionViewModel.getAllPermission();
          return SafeArea(
            child: Scaffold(
              backgroundColor: Color.fromRGBO(246, 246, 246, 1),
              body: _buildBody(),
            ),
          );
        } else {
          return Container(
              width: 200,
              height: 200,
              child: Center(child: const CircularProgressIndicator()));
        }
      },
    );
  }

  _buildBody() {
    return SingleChildScrollView(
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
                  SizedBox(
                    width: 0.55.sw,
                  ),
                  CircleAvatar(
                    child: IconButton(
                      onPressed: () async {
                        final AuthViewModel _viewModel = Get.find();
                        await _viewModel.signOut();
                      },
                      icon: Icon(Icons.person),
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.max,
              children: [
                CardWidget(
                    allowance: "Onaylanan İzinlerim",
                    allowanceNum: 4,
                    isOval: true),
                CardWidget(allowance: "Reddedilen İzinlerim", allowanceNum: 4),
                CardWidget(allowance: "Ücretsiz İzinlerim", allowanceNum: 5),
                CardWidget(allowance: "Yıllık İzin Hakkım", allowanceNum: 43),
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
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.indigo.shade800),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 0.02.sh,
                ),
                DottedBorderButton(
                  onTap: () {
                    Get.to(() => PermissionRequestPage());
                  },
                ),
                SizedBox(
                  height: 0.02.sh,
                ),
                //Listview builder tek kart liste boyutu kadar
                Container(
                  height: 400,
                  child: ListView.builder(
                      itemCount: _permissionViewModel.allPermissions.length,
                      itemBuilder: (context, index) {
                        //   String key = widget.editTask.customPhotosMap.keys.elementAt(index);
                        return InkwellCard1(
                            permission:
                                _permissionViewModel.allPermissions[index]);
                      }),
                ), // InkwellCard1(), // ya tek permisson modeli yollanacak lsite içinden indexe göre yada index yollanacak listeyi içerde kontro ledeceksin
                // InkwellCard2(),
                // InkwellCard3(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
