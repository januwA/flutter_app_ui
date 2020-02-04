import 'package:flutter/material.dart';
import 'package:flutter_travel_site_app_ui/app/pages/info/widgets/tab_button.dart';

class InfoPage extends StatefulWidget {
  static const routeName = '/InfoPage';
  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Align(
            alignment: Alignment.topLeft,
            child: Hero(
              tag: 'image',
              child: Image.asset(
                'assets/Image.png',
                height: 300,
                fit: BoxFit.cover,
              ),
            ),
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
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 250,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(33),
                    topRight: Radius.circular(33),
                  )),
              child: Stack(
                overflow: Overflow.visible,
                children: <Widget>[
                  Positioned(
                    right: 50,
                    top: 0,
                    child: FractionalTranslation(
                      translation: Offset(0, -0.5),
                      child: FloatingActionButton(
                        backgroundColor: Colors.white,
                        onPressed: () {},
                        child: Image.asset('assets/favorite-heart-button.png'),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 33,
                      right: 33,
                      top: 50,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Srilanka',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF4E4E4E),
                          ),
                        ),
                        SizedBox(height: 30),
                        Text(
                          'Package included',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF333232),
                          ),
                        ),
                        SizedBox(height: 30),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              TabButton(
                                image: 'assets/fork.png',
                                label: 'Food',
                                onTap: () {},
                              ),
                              TabButton(
                                image: 'assets/video-camera.png',
                                label: 'Food',
                                onTap: () {},
                              ),
                              TabButton(
                                image: 'assets/surface1.png',
                                label: 'Food',
                                onTap: () {},
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 60),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 2.0),
                          child: Text(
                            'Sri Lanka, officially the Democratic Socialist Republic of Sri Lanka, is an island country in South Asia, located in the Indian Ocean to the southwest of the Bay of Bengal and to the southeast of the Arabian Sea. ',
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFF333232),
                            ),
                          ),
                        ),
                        Spacer(),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: MaterialButton(
                            onPressed: () {},
                            minWidth: 305,
                            height: 57,
                            color: Color(0xFF19C563),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(17)),
                            child: Text(
                              'Book Now',
                              style: TextStyle(
                                  fontSize: 21,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
