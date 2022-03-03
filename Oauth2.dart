import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:oauth2/oauth2.dart' as oauth2;
import 'package:provider/provider.dart';
import 'package:swifty_companion/authCodeProvider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:uni_links/uni_links.dart';

final authorizationEndpoint = Uri.parse(dotenv.env['AUTHENDPOINT']!);
final tokenEndpoint = Uri.parse(dotenv.env['TOKENENDPOINT']!);

final identifier = dotenv.env['UID']!;
final secret = dotenv.env['SECRET']!;

final redirectUrl = Uri.parse('swifty.companion://callback');

final credentialsFile = File('~/.myapp/credentials.json');

Future<void> createClient(BuildContext context) async {
  var grant = oauth2.AuthorizationCodeGrant(
      identifier, authorizationEndpoint, tokenEndpoint,
      secret: secret);

  var authorizationUrl = grant.getAuthorizationUrl(redirectUrl);

  redirect(authorizationUrl);
  Provider.of<AuthCode>(context, listen: false)
      .listener(redirectUrl, grant)
      .onData((data) {
    Future<oauth2.Client> test =
        grant.handleAuthorizationResponse(data.queryParameters);
    test.then((value) => print(value.credentials.toJson()));
  });
}

Future<void> redirect(Uri url) async {
  if (await canLaunch(url.toString())) {
    await launch(url.toString());
  }
}
