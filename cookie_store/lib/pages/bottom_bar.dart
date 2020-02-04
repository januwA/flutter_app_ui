import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 页面底部导航栏
class BottomBar extends StatelessWidget {
  static double height = 60.0;
  @override
  Widget build(BuildContext context) {
    double _height = ScreenUtil.instance.setHeight(height);
    double _width = MediaQuery.of(context).size.width / 2 -
        ScreenUtil.instance.setWidth(40.0);
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      notchMargin: 6.0, // [FloatingActionButton]和[BottomAppBar]的缺口之间的边距。
      color: Colors.transparent,
      elevation: 9.0,
      clipBehavior: Clip.antiAlias,
      child: Container(
        height: _height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25.0),
            topRight: Radius.circular(25.0),
          ),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              height: _height,
              width: _width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.home, color: Color(0xFFEF7532)),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.person_outline, color: Color(0xFF676E79)),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            Container(
              height: _height,
              width: _width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.search, color: Color(0xFF676E79)),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.shopping_basket, color: Color(0xFF676E79)),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
