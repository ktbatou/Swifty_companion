import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swifty_companion/authCodeProvider.dart';
import 'package:swifty_companion/httpRequest.dart';
import 'package:swifty_companion/searchResult.dart';
import 'package:swifty_companion/splash.dart';

class SearchInput extends StatefulWidget {
  const SearchInput({Key? key}) : super(key: key);

  @override
  _SearchInputState createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController login = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double contextWidth = MediaQuery.of(context).size.width;
    double contextHeight = MediaQuery.of(context).size.height;
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.only(bottom: contextHeight * 0.05),
            width: contextWidth * 0.75,
            child: TextFormField(
              controller: login,
              style: TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 2.0, horizontal: 10.0),
                //     fillColor: Color(0xffE5E5E5),
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  borderSide: BorderSide(color: Color(0xff09D178), width: 1.0),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  borderSide: BorderSide(width: 1, color: Color(0xff09D178)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  borderSide: BorderSide(width: 1, color: Color(0xff09D178)),
                ),
                labelText: 'Login',
                labelStyle: TextStyle(color: Colors.white),
              ),
              validator: (String? value) {
                if (value!.isEmpty) {
                  return 'Please enter some text';
                }
              },
            ),
          ),
          Container(
              //   margin: EdgeInsets.only(bottom: contextheight * 0.15),
              width: contextWidth > contextHeight
                  ? contextWidth * 0.35
                  : contextWidth * 0.55,
              height: contextWidth > contextHeight
                  ? contextHeight * 0.09
                  : contextHeight * 0.05,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.white,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: const Color(0xffF9FFFC),
                    // padding: const EdgeInsets.all(16.0),
                    primary: const Color(0xff09D178),
                    textStyle: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  onPressed: () async {
                    //TODO: handle errors msgs
                    if (_formKey.currentState!.validate()) {
                      await httpRequest(context, login.text).then((value) {
                        value = Provider.of<AuthCode>(context, listen: false)
                            .getData;
                        if (value.statusCode == 200) {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SearchResult()),
                            (Route<dynamic> route) => false,
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              backgroundColor: Colors.red,
                              content: value.statusCode == 404
                                  ? const Text("User is not found")
                                  : const Text(
                                      "We have a problem with our server. Please try again later.")));
                        }
                      });
                    }
                  },
                  child: const Text(
                    "search",
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
