import 'dart:convert';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swifty_companion/CursusProvider.dart';
import 'package:swifty_companion/authCodeProvider.dart';

class CursusList extends StatefulWidget {
  const CursusList({Key? key}) : super(key: key);

  @override
  _CursusListState createState() => _CursusListState();
}

class _CursusListState extends State<CursusList> {
  List<String> CursusList(var context) {
    List<String> items = [];
    final res = Provider.of<AuthCode>(context, listen: false).getData;
    var user = json.decode(res.body);

    int i = 0;
    while (i < user["cursus_users"].length) {
      items.add(user["cursus_users"][i]["cursus"]["name"]);
      i++;
    }
    return items;
  }

  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    List<String> items = CursusList(context);
    String value = "Cursus";
    final res = Provider.of<AuthCode>(context, listen: false).getData;
    var user = json.decode(res.body);
    return DropdownButtonHideUnderline(
        child: DropdownButton2(
      isExpanded: true,
      buttonHeight: 30,
      buttonWidth: 150,
      buttonDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            width: 0.5,
            //color: const Color(0xff09D178),
          ),
          color: Colors.grey.shade600),
      hint: Container(
          padding: const EdgeInsets.only(left: 10),
          child: const Text(
            "Cursus",
            style: TextStyle(color: Colors.black, fontSize: 12),
          )),
      items: items
          .map((item) => DropdownMenuItem<String>(
                value: item,
                child: Container(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      item,
                      style: const TextStyle(color: Colors.black, fontSize: 12),
                    )),
              ))
          .toList(),
      value: selectedValue,
      onChanged: (value) {
        setState(() {
          var a = items.indexWhere((e) => e == value);
          int id = user["cursus_users"][a]["cursus"]["id"];
          Provider.of<CursusProvider>(context, listen: false).setCursus(a);
          Provider.of<CursusProvider>(context, listen: false).setCursusId(id);

          print(value);
          selectedValue = value.toString();
        });
      },
    ));
  }
}
