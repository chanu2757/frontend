import 'package:flutter/material.dart';
import '5_ImagePicker.dart';
import 'appbar.dart';
import 'settings.dart';

void main() {
  runApp(MaterialApp(
    title: "Navigation Basics",
    home: FirstRoute(),
  ));
}

class FirstRoute extends StatelessWidget {
  const FirstRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/main',
      routes: {
        '/main': (context) => DemoPage(),
        '/pick': (context) => Gallery(),
        '/settings': (context) => Settings(),
      },
    );
  }
}


