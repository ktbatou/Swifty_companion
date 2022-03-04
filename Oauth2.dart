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

Future<dynamic> createClient(BuildContext context) async {
  var grant = oauth2.AuthorizationCodeGrant(
      identifier, authorizationEndpoint, tokenEndpoint,
      secret: secret);

  var authorizationUrl = await grant.getAuthorizationUrl(redirectUrl);

  await redirect(authorizationUrl);
  Provider.of<AuthCode>(context, listen: false)
      .listener(redirectUrl, grant)
      .onData((data) async {
    Future<oauth2.Client> test =
        grant.handleAuthorizationResponse(data.queryParameters);
    print(
        "=====================================================================================");
    await test.then((value) {
      print(value.credentials.toJson());
      Provider.of<AuthCode>(context, listen: false).setData(value.credentials);
    });
  });
  Future.delayed(const Duration(seconds: 5), () {});
  //var test1 = await Provider.of<AuthCode>(context, listen: false).getData;
  return Provider.of<AuthCode>(context, listen: false).getData;
}

Future<void> redirect(Uri url) async {
  if (await canLaunch(url.toString())) {
    await launch(url.toString());
  }
}
