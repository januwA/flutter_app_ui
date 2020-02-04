import 'package:flutetr_cookie_store_app_ui/pages/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CookieDetail extends StatelessWidget {
  final String cookiePic;
  final String cookieprice;
  final String cookiename;

  const CookieDetail({
    Key key,
    this.cookiePic,
    this.cookieprice,
    this.cookiename,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFcFaF8),
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xFF545D68)),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'Pickup',
          style: TextStyle(
            fontFamily: 'Varela',
            fontSize: ScreenUtil.instance.setSp(20.0),
            color: Color(0xFF545D68),
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.notifications_none,
              color: theme.primaryColor,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Container(
            color: Color(0xFFFcFaF8),
            child: Padding(
              padding: EdgeInsets.only(
                left: ScreenUtil.instance.setWidth(20.0),
                top: ScreenUtil.instance.setWidth(15.0),
                bottom: ScreenUtil.instance.setWidth(15.0),
              ),
              child: Text(
                'Cookie',
                style: TextStyle(
                  fontFamily: 'Varela',
                  fontSize: ScreenUtil.instance.setSp(42.0),
                  fontWeight: FontWeight.bold,
                  color: theme.primaryColor,
                ),
              ),
            ),
          ),
          Container(
            color: Colors.white,
            child: Column(
              children: <Widget>[
                Hero(
                  tag: cookiePic,
                  child: Image.asset(
                    cookiePic,
                    height: ScreenUtil.instance.setHeight(150.0),
                    width: ScreenUtil.instance.setWidth(100.0),
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: ScreenUtil.instance.setHeight(20.0)),
                Center(
                  child: Text(
                    cookieprice,
                    style: TextStyle(
                      fontFamily: 'Varela',
                      fontSize: ScreenUtil.instance.setSp(22.0),
                      fontWeight: FontWeight.bold,
                      color: theme.primaryColor,
                    ),
                  ),
                ),
                SizedBox(height: ScreenUtil.instance.setHeight(10.0)),
                Center(
                  child: Text(
                    cookiename,
                    style: TextStyle(
                      color: Color(0xFF575E67),
                      fontFamily: 'Varela',
                      fontSize: ScreenUtil.instance.setSp(24.0),
                    ),
                  ),
                ),
                SizedBox(height: ScreenUtil.instance.setHeight(20.0)),
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width - 50.0,
                    child: Text(
                        'Cold, creamy ice cream sandwiched between delicious deluxe cookies. Pick your favorite deluxe cookies and ice cream flavor.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'Varela',
                            fontSize: 16.0,
                            color: Color(0xFFB4B8B9))),
                  ),
                ),
                SizedBox(height: ScreenUtil.instance.setHeight(20.0)),
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width - 50.0,
                    height: ScreenUtil.instance.setHeight(50.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.0),
                      color: theme.primaryColor,
                    ),
                    child: Center(
                      child: Text(
                        'Add to cart',
                        style: TextStyle(
                          fontFamily: 'Varela',
                          fontSize: ScreenUtil.instance.setSp(14.0),
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: theme.primaryColor,
        child: Icon(Icons.fastfood),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomBar(),
    );
  }
}
