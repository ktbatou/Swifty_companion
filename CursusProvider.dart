import 'package:flutter/material.dart';

class CursusProvider extends ChangeNotifier {
  var cursus = 0;
  var cursusId;

  get getCursus => cursus;
  get getCususId => cursusId;

  setCursus(var value) {
    print("im in the setter and this is data : $cursus\n");
    cursus = value;
    notifyListeners();
  }

  setCursusId(var id) {
    print("this is cursus id $id");
    cursusId = id;
    notifyListeners();
  }
}
