import 'package:flutetr_cookie_store_app_ui/data/coockie.dart';
import 'package:flutetr_cookie_store_app_ui/pages/cookie_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CookiePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFFCFAF8),
      child: GridView.count(
        padding: EdgeInsets.all(ScreenUtil.instance.setWidth(15)),
        crossAxisCount: 2,
        primary: false,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
        childAspectRatio: 0.8,
        children: <Widget>[
          for (var cookie in cookies) CookieCard(cookie: cookie)
        ],
      ),
    );
  }
}
