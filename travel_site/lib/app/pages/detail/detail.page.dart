import 'package:flutter/material.dart';
import 'package:flutter_travel_site_app_ui/app/pages/info/info.page.dart';

class DetailPage extends StatefulWidget {
  static const routeName = '/DetailPage';
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Hero(
            tag: 'image',
            child: Image.asset(
              'assets/Image.png',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [
                Colors.transparent,
                Colors.transparent,
                Colors.black38,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomCenter,
            )),
          ),
          Positioned(
            left: 0,
            top: MediaQuery.of(context).padding.top,
            child: Row(
              children: <Widget>[
                BackButton(
                  color: Colors.white,
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 6),
                      width: 20,
                      height: 6,
                      decoration: BoxDecoration(
                        color: Color(0xFF025725),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 6),
                      width: 45,
                      height: 6,
                      decoration: BoxDecoration(
                        color: Color(0xFF025725),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 6),
                      width: 20,
                      height: 6,
                      decoration: BoxDecoration(
                        color: Color(0xFF025725),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 40),
                Container(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 80.0),
                          child: Text(
                            'Srilanka',
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Sri Lanka, officially the Democratic Socialist Republic of Sri Lanka, is an island country in South Asia, located in the Indian Ocean to the southwest of the Bay of Bengal and to the southeast of the Arabian Sea. ',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 50),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.keyboard_arrow_up,
                        color: Colors.white,
                        size: 30,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            PageRouteBuilder(
                              transitionDuration: Duration(milliseconds: 300),
                              pageBuilder:
                                  (context, animation, secondaryAnimation) =>
                                      InfoPage(),
                              transitionsBuilder: (context, animation,
                                  secondaryAnimation, child) {
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
                        },
                        child: Text(
                          'Swipe up for more',
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
