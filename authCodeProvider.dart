import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:uni_links/uni_links.dart';

class AuthCode extends ChangeNotifier {
  dynamic _token;
  Response? _data;

  get getToken {
    if (_token != null) {
      return _token;
    }
    print("im in the getter");
  }

  get getData => _data;

  setToken(var token) {
    print("im in the setter and this is data : $token\n");
    _token = token;
    notifyListeners();
  }

  setData(Response data) {
    print("im in the setter of data and this is data : $data\n");
    _data = data;
    notifyListeners();
  }

  Future listener(Uri url) {
    final completer = Completer();

    Future(() => uriLinkStream.listen((event) {
          print("im in inside listener");
          completer.complete(event);
        }));

    return completer.future;
  }
}
