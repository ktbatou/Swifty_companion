import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ImageGetter extends StatefulWidget {
  var img;
  ImageGetter({required this.img});
  @override
  _ImageGetterState createState() => _ImageGetterState();
}

class _ImageGetterState extends State<ImageGetter> {
  Future imageChecker(var img) async {
    var response;
    var completer = Completer();
    if (img != null) {
      await http.get(Uri.parse(img)).then((value) {
        if (value.statusCode == 200) {
          print("object");
          response = 1;
        }
        completer.complete(response);
      });
      return completer.future;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: imageChecker(widget.img),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(50)),
              color: Colors.grey,
              image:
                  //chack image with a FutureBuilder that return either true of false
                  //show img or a user png
                  DecorationImage(
                      image: NetworkImage(widget.img), fit: BoxFit.fitHeight),
            ),
          );
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }
        return Container(
          width: 40,
          height: 40,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(50)),
            color: Colors.grey,
            image:
                //chack image with a FutureBuilder that return either true of false
                //show img or a user png
                DecorationImage(
                    image: NetworkImage(
                        "https://freesvg.org/img/abstract-user-flat-4.png"),
                    fit: BoxFit.fitHeight),
          ),
        );
      },
    );
  }
}
