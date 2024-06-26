import 'package:admin_panel/constants.dart';
import 'package:admin_panel/widget_tree.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter Demo",
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Constants.purpleDark,
        canvasColor: Constants.purpleLight
      ),
      home: WidgetTree(),
    );
  }
}


