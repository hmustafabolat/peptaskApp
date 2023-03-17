import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final List<String> permissionType = [
  'Ücretli İzin',
  'Ücretsiz İzin',
  'Yıllık İzin'
];

String? selectedValue;

final _formKey = GlobalKey<FormState>();

class DropDownButton extends StatefulWidget {
  const DropDownButton({Key? key}) : super(key: key);

  @override
  State<DropDownButton> createState() => _DropDownButtonState();
}

class _DropDownButtonState extends State<DropDownButton> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButtonFormField2(
              decoration: InputDecoration(
                isDense: false,
                contentPadding: EdgeInsets.all(5).w,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8).w,
                ),
              ),
              isExpanded: true,
              hint: Text(
                'İzin Türünüzü Seçiniz',
                style: TextStyle(fontSize: 12.sp,),
              ),

              items: permissionType
                  .map((item) => DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                  style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400,
                  ),
                ),
              ))
                  .toList(),
              validator: (value) {
                if (value == null) {
                  return 'Lütfen İzin Türü Seçiniz';
                }
                return null;
              },
              onChanged: (value) {
              },
              onSaved: (value) {
                selectedValue = value.toString();
              },
              buttonStyleData: ButtonStyleData(
                height: 0.05.sh,
                padding: EdgeInsets.only(right: 10).r,
              ),
              iconStyleData: const IconStyleData(
                icon: Icon(
                  Icons.keyboard_arrow_down_outlined,
                  color: Colors.black45,
                ),
                iconSize: 30,
              ),
              dropdownStyleData: DropdownStyleData(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
