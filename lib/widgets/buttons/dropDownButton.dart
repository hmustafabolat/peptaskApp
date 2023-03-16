import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const List<String> list = <String>[
  'Ücretli İzin',
  'Ücretsiz İzin',
  'Yıllık İzin',
  'Mazeret İzni'
];

class DropdownButtonExample extends StatefulWidget {
  const DropdownButtonExample({super.key});

  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 2, right: 200).w,
      decoration: BoxDecoration(
        border: Border.all(width: 0.003.sw, color: Colors.grey.shade400),
        color: Colors.white,
        borderRadius: BorderRadius.circular(8).w,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          DropdownButton<String>(
            value: dropdownValue,
            icon: Icon(Icons.keyboard_arrow_down),
            style: TextStyle(color: Colors.black),
            underline: Container(
              color: Colors.black,
            ),
            onChanged: (String? value) {
              // This is called when the user selects an item.
              setState(() {
                dropdownValue = value!;
              });
            },
            items: list.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Padding(
                  padding: const EdgeInsets.all(10.0).w,
                  child: Text(value),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
