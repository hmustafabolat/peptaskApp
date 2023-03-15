import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardWidgetTop extends StatelessWidget {
  final String allowance;
  final int allowanceNum;
  const CardWidgetTop({Key? key, required this.allowance, required this.allowanceNum}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(10).w,
              topLeft: Radius.circular(10).w)),
      elevation: 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(right: 185.0, top: 8,left: 10).r,
            child: Text(
              allowance,
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 185.0, top: 4,left: 10,bottom: 10).r,
            child: Text(allowanceNum.toString(),style: TextStyle(fontSize: 20.sp),),
          ),
        ],
      ),
    );
  }
}

class CardWidgetMid extends StatelessWidget {
  final String allowance;
  final int allowanceNum;
  CardWidgetMid({Key? key, required this.allowance, required this.allowanceNum}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(right: 185.0, top: 8,left: 10).r,
            child: Text(
              allowance,
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 185.0, top: 4,left: 10,bottom: 10).r,
            child: Text(allowanceNum.toString(),style: TextStyle(fontSize: 20.sp),),
          ),
        ],
      ),
    );
  }
}

class CardWidgetMid2 extends StatelessWidget {
  final String allowance;
  final int allowanceNum;
  const CardWidgetMid2({Key? key, required this.allowance, required this.allowanceNum}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(right: 205.0, top: 8,left: 10).r,
            child: Text(
              allowance,
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 205.0, top: 4,left: 10,bottom: 10).r,
            child: Text(allowanceNum.toString(),style: TextStyle(fontSize: 20.sp),),
          ),
        ],
      ),
    );
  }
}

class CardWidgetBottom extends StatelessWidget {
  final String allowance;
  final int allowanceNum;
  const CardWidgetBottom({Key? key, required this.allowance, required this.allowanceNum}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(10).w,
              bottomLeft: Radius.circular(10).w)),
      elevation: 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(right: 207, top: 8,left: 10).r,
            child: Text(
              allowance,
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 207.0, top: 4,left: 10,bottom: 10).r,
            child: Text(allowanceNum.toString(),style: TextStyle(fontSize: 20.sp),),
          ),
        ],
      ),
    );
  }
}
