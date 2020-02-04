import 'package:flutetr_cookie_store_app_ui/pages/bottom_bar.dart';
import 'package:flutetr_cookie_store_app_ui/pages/cookie_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData(
        primaryColor: Color(0xFFF17532),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 375, height: 746)..init(context);
    var theme = Theme.of(context);
    TextStyle tabstyle = TextStyle(
      fontFamily: 'Varela',
      fontSize: ScreenUtil.instance.setSp(21.0),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xFF545D68)),
          onPressed: () {},
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
            icon: Icon(Icons.notifications_none, color: theme.primaryColor),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
              left: ScreenUtil.instance.setWidth(20.0),
            ),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: ScreenUtil.instance.setWidth(15.0),
                  ),
                  child: Text(
                    'Categories',
                    style: TextStyle(
                      fontFamily: 'Varela',
                      fontSize: ScreenUtil.instance.setSp(42.0),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                TabBar(
                  controller: _tabController,
                  indicatorColor: Colors.transparent,
                  isScrollable: true,
                  labelPadding: EdgeInsets.only(right: 45.0),
                  labelColor: Color(0xFFC88D67), // active color
                  unselectedLabelColor: Color(0xFFCDCDCD), // unactive color
                  tabs: ['Cookies', 'Cookie cake', 'Ice cream']
                      .map((String text) {
                    return Tab(
                      child: Text(text, style: tabstyle),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                CookiePage(),
                CookiePage(),
                CookiePage(),
              ],
            ),
          ),
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


