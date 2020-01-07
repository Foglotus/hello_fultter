import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hello_flutter/rxdart/demo.dart';
import 'stream/demo.dart';
import 'bloc/demo.dart';
import 'package:hello_flutter/http/http_demo.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {'/': (context) => Home()},
      theme: ThemeData(
          primarySwatch: Colors.yellow,
          highlightColor: Color.fromRGBO(255, 255, 255, 0.5),
          splashColor: Colors.white70,
          accentColor: Color.fromRGBO(3, 54, 255, 1.0)),
    ));

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HttpDemo();
  }
}


