import 'package:flutter/material.dart';

class IzinDropdown extends StatefulWidget {
  @override
  _IzinDropdownState createState() => _IzinDropdownState();
}

class _IzinDropdownState extends State<IzinDropdown> {
  String dropdownValue = 'Ücretli İzin';

  @override
  Widget build(BuildContext context) {
    final double phoneWidth = MediaQuery.of(context).size.width;
    final double phoneHeight = MediaQuery.of(context).size.height;

    final double paddingVertical = phoneHeight * 0.015;
    final double paddingHorizontal = phoneWidth * 0.34;

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: paddingVertical,
        horizontal: paddingHorizontal,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(5),
      ),
      child: DropdownButton<String>(
        value: dropdownValue,

        icon: const Icon(Icons.keyboard_arrow_down_outlined),
        iconSize: 24,
        elevation: 16,
        style: const TextStyle(color: Colors.black),

        onChanged: (String? newValue) {
          setState(() {
            dropdownValue = newValue!;
          });
        },
        items: <String>['Ücretli İzin', 'Ücretsiz İzin', 'Yıllık İzin', 'Mazeret İzni']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
