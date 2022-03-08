import 'dart:async';

import 'package:flutter/material.dart';
import 'package:uni_links/uni_links.dart';

class AuthCode extends ChangeNotifier {
  dynamic credentials;

  get getData {
    if (credentials != null) {
      print("im in the listener this is credentials $credentials\n");
      return credentials;
    }
    print("im in the getter");
  }

  setData(var data) {
    print("im in the setter and this is data : $data\n");
    credentials = data;
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
