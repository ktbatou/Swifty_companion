import 'dart:convert';

import 'package:provider/provider.dart';
import 'package:swifty_companion/authCodeProvider.dart';
import 'package:http/http.dart' as http;

Future httpRequest(var context, var user) async {
  String token = Provider.of<AuthCode>(context, listen: false).getToken;
  Uri url = Uri.parse("https://api.intra.42.fr/v2/users/$user");
  final response = await http.get(url, headers: {
    "Content-Type": "application/json",
    'Accept': 'application/json',
    'Authorization': 'Bearer $token',
  }).then((value) {
    if (value.statusCode == 200) {
      print(json.decode(value.body)["usual_full_name"]);
      Provider.of<AuthCode>(context, listen: false).setData(value);
    }
  });
}
