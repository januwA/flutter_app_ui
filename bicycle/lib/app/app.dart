import 'package:flutter/material.dart';
import 'package:flutter_bicycle_app_ui/app/pages/home_page.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor:  Color(0xFFFFC5C5),
      ),
      home: HomePage(),
    );
  }
}
