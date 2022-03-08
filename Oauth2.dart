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
  print("click");
  var grant = oauth2.AuthorizationCodeGrant(
      identifier, authorizationEndpoint, tokenEndpoint,
      secret: secret);

  var authorizationUrl = grant.getAuthorizationUrl(redirectUrl);

  await redirect(authorizationUrl);
  Provider.of<AuthCode>(context, listen: false)
      .listener(redirectUrl)
      .then((value) => print(value));

  //     .then((value) async {
  //   await grant
  //       .handleAuthorizationResponse(value.queryParameters)
  //       .then((value) {
  //     print(value.credentials.toJson());
  //   });
  // }));

  // .then((value) => {
  //   value.onData((data) {
  //     print("<<<<<<<<<data ${data}");
  //     grant
  //         .handleAuthorizationResponse(data!.queryParameters)
  //         .then((value) {
  //       print(value.credentials.toJson());
  //       Provider.of<AuthCode>(context, listen: false)
  //           .setData(value.credentials);
  //     });
  //     //function call user infos
  //   })
  // });

  // var code = Provider.of<AuthCode>(context, listen: false).getData;
  // await grant
  //       .handleAuthorizationResponse(code!.queryParameters)
  //       .then((value) {
  //     print(value.credentials.toJson());
  //     Provider.of<AuthCode>(context, listen: false)
  //         .setData(value.credentials);
  //   });

  // //   .then((data) {
  // // print("this is data  ${data.toString()}");
  // // await grant.handleAuthorizationResponse(data.queryParameters).then((value) {
  // //   print(value.credentials.toJson());
  // //   Provider.of<AuthCode>(context, listen: false).setData(value.credentials);
  // // });
  // // data.onData((data1) async {
  // //   await grant
  // //       .handleAuthorizationResponse(data1!.queryParameters)
  // //       .then((value) {
  // //     print(value.credentials.toJson());
  // //     Provider.of<AuthCode>(context, listen: false)
  // //         .setData(value.credentials);
  // //   });
  // // });
  // // });
  // //Future.delayed(const Duration(seconds: 5), () {});
}

Future<void> redirect(Uri url) async {
  if (await canLaunch(url.toString())) {
    await launch(url.toString());
  }
}
