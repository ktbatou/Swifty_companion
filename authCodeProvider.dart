import 'dart:async';

import 'package:flutter/material.dart';
import 'package:oauth2/oauth2.dart' as oauth2;
import 'package:oauth2/oauth2.dart';
import 'package:provider/provider.dart';
import 'package:uni_links/uni_links.dart';

class AuthCode extends ChangeNotifier {
  var credentials;

  get getData {
    if (credentials != null) {
      print("im in the listener this is credentials $credentials\n");
      return credentials;
    }
    print("im in the getter");
  }

  setData(var data) async {
    print("im in the setter \n");
    credentials = await data;

    notifyListeners();
  }

  StreamSubscription listener(Uri url, var grant) {
    print("im in the listener \n");
    return uriLinkStream.listen(
      (uri) {},
    );
  }
}
