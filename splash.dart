import 'package:flutter/material.dart';
import 'package:swifty_companion/search.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    double contextWidth = MediaQuery.of(context).size.width;
    double contextheight = MediaQuery.of(context).size.height;
    return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/backgound.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                margin: EdgeInsets.only(bottom: contextheight * 0.15),
                width: contextWidth > contextheight
                    ? contextWidth * 0.35
                    : contextWidth * 0.55,
                height: contextWidth > contextheight
                    ? contextheight * 0.09
                    : contextheight * 0.05,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(

                      //color: Colors.white,
                      ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.white,
                      // padding: const EdgeInsets.all(16.0),
                      primary: const Color(0xff09D178),
                      textStyle: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => Search()),
                        (Route<dynamic> route) => false,
                      );
                    },
                    child: const Text(
                      "Sign In",
                    ),
                  ),
                )),
          ),
        ));
  }
}
