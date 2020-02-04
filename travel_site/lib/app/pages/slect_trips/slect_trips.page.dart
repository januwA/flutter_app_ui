import 'package:flutter/material.dart';
import 'package:flutter_travel_site_app_ui/app/pages/detail/detail.page.dart';
import 'package:flutter_travel_site_app_ui/app/pages/slect_trips/widgets/slect_trips_list_item.dart';
import 'package:flutter_travel_site_app_ui/app/shared/widgets/avatar.dart';

class SlectTripsPage extends StatefulWidget {
  static const routeName = '/SlectTripsPage';
  @override
  _SlectTripsPageState createState() => _SlectTripsPageState();
}

class _SlectTripsPageState extends State<SlectTripsPage> {
  _toDetail() {
    Navigator.of(context).push(
      PageRouteBuilder(
        transitionDuration: Duration(milliseconds: 300),
        pageBuilder: (context, animation, secondaryAnimation) => DetailPage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var begin = Offset(1.0, 0.0);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            right: -80,
            top: -100,
            child: Opacity(
              opacity: 0.76,
              child: Hero(
                tag: 'camping-tent',
                child: Image.asset(
                  'assets/camping-tent-1.png',
                  width: 346,
                  height: 346,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).padding.top + 10,
                ),

                // 头像
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Hero(
                    tag: 'avatar',
                    child: Avatar(),
                  ),
                ),

                // 导航
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      IconButton(
                        iconSize: 40,
                        color: Color(0xFF848383),
                        icon: Icon(
                          Icons.keyboard_arrow_left,
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      Text(
                        'Sea side',
                        style: TextStyle(
                          fontSize: 27,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF6E6E6E),
                        ),
                      ),
                    ],
                  ),
                ),

                SlectTripsListItem(
                  onTap: _toDetail,
                  title: 'Arugam bay',
                  image: 'assets/sunbed.png',
                ),
                SlectTripsListItem(
                  onTap: _toDetail,
                  title: 'Passikudah',
                  image: 'assets/palm-tree.png',
                ),
                SlectTripsListItem(
                  onTap: _toDetail,
                  title: 'Srilanka',
                  image: 'assets/trailer.png',
                ),
                SlectTripsListItem(
                  onTap: _toDetail,
                  title: 'Mabel beach',
                  image: 'assets/sunrise.png',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
