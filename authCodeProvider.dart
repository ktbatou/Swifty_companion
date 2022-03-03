import 'dart:async';

import 'package:flutter/material.dart';
import 'package:oauth2/oauth2.dart' as oauth2;
import 'package:oauth2/oauth2.dart';
import 'package:provider/provider.dart';
import 'package:uni_links/uni_links.dart';

class AuthCode extends ChangeNotifier {
  var _sub;

  get getData {
    print("im in the getter\n");
    return _sub;
  }

  StreamSubscription listener(Uri url, var grant) {
    print("im in the listener \n");
    return uriLinkStream.listen(
      (uri) {
        _sub = grant.handleAuthorizationResponse(uri!.queryParameters);
        print("this is code inside =====> $_sub");
      },
    );
  }
}
