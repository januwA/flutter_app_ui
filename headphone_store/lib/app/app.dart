import 'package:flutter/material.dart';
import 'package:flutter_headphone_app_store_ui/app/pages/home/home.page.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}