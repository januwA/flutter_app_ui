import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_travel_site_app_ui/app/pages/home/widgets/tab_side.dart';
import 'package:flutter_travel_site_app_ui/app/pages/slect_trips/slect_trips.page.dart';
import 'package:flutter_travel_site_app_ui/app/shared/widgets/avatar.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/HomePage';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xFF0E0D2E),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 116.0),
              child: Stack(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Image.asset('assets/undraw_campfire_s6y4.png'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: FractionalTranslation(
                        translation: Offset(0.0, -0.5),
                        child: Text(
                          'Camp Planner',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ClipPath(
                clipper: ClipperSky(),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(color: Colors.white),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 60,
                          right: 20,
                          top: 20,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Hero(tag: 'avatar', child: Avatar()),
                            Hero(
                              tag: 'camping-tent',
                              child: Image.asset(
                                'assets/camping-tent.png',
                                fit: BoxFit.fill,
                                width: 86,
                                height: 86,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 51.0),
                        child: Text(
                          'Select your Category',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            TabSide(
                              image: 'assets/home_tab1.png',
                              label: 'Sea side',
                              onTap: _fadeInSlectTripsPage,
                            ),
                            TabSide(
                              image: 'assets/home_tab2.png',
                              label: 'Mountain',
                              onTap: _fadeInSlectTripsPage,
                            ),
                            TabSide(
                              image: 'assets/home_tab3.png',
                              label: 'River side',
                              onTap: _fadeInSlectTripsPage,
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: RaisedButton(
                          onPressed: _slideSlectTripsPage,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          elevation: 6,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 50,
                            vertical: 10,
                          ),
                          color: Color(0xFF19C563),
                          child: Text(
                            'Start camping',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _fadeInSlectTripsPage() {
    Navigator.of(context).push(
      PageRouteBuilder(
        transitionDuration: Duration(milliseconds: 400),
        pageBuilder: (context, animation, secondaryAnimation) =>
            SlectTripsPage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var curve = Curves.ease;
          var tween = Tween<double>(begin: 0.0, end: 1.0);
          var curvedAnimation = CurvedAnimation(
            parent: animation,
            curve: curve,
          );
          return FadeTransition(
            opacity: tween.animate(curvedAnimation),
            child: child,
          );
        },
      ),
    );
  }

  void _slideSlectTripsPage() {
    Navigator.of(context).push(
      PageRouteBuilder(
        transitionDuration: Duration(milliseconds: 500),
        pageBuilder: (context, animation, secondaryAnimation) =>
            SlectTripsPage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var begin = Offset(0.0, 1.0);
          var end = Offset.zero;
          var curve = Curves.easeOut;

          var tween = Tween(begin: begin, end: end);
          var curvedAnimation = CurvedAnimation(
            parent: animation,
            curve: curve,
          );
          return SlideTransition(
            position: tween.animate(curvedAnimation),
            child: child,
          );
        },
      ),
    );
  }
}

class ClipperSky extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;

    return Path()
      ..lineTo(0, h)
      ..lineTo(w, h)
      ..lineTo(w, 10)
      ..quadraticBezierTo(w, 0, w - 10, 0)
      ..lineTo(50, 20)
      ..quadraticBezierTo(0, 26, 0, 55)
      ..close();
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
