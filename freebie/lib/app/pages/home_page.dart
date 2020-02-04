import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> _images = ['assets/p-1.png', 'assets/p-2.png'];
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(
      width: 414,
      height: 897,
    )..init(context);
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          // 背景图
          Image.asset(
            'assets/profile-header.png',
            fit: BoxFit.fitWidth,
          ),

          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [
                Color(0xFF41444B).withOpacity(0.32),
                Color(0xFF41444B).withOpacity(0.82),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            )),
          ),

          // header bar
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top,
            ),
            child: Align(
              alignment: Alignment.topCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                    color: Colors.white,
                    icon: Icon(Icons.keyboard_arrow_left),
                    onPressed: () {},
                  ),
                  Text(
                    '@jennyxyz',
                    style: TextStyle(
                      fontSize: 19,
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    color: Colors.white,
                    icon: Icon(Icons.more_vert),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    child: Padding(
                      padding: EdgeInsets.only(
                        right: ScreenUtil.getInstance().setWidth(54),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            'Jennifer',
                            style: TextStyle(
                              fontSize: ScreenUtil.getInstance().setSp(40),
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'Ajax developer',
                            style: TextStyle(
                              fontSize: ScreenUtil.getInstance().setSp(17),
                              color: Color(0xFFDFD8C8),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: ScreenUtil.getInstance().setHeight(40)),
                  // 图片列表
                  Container(
                    height: ScreenUtil.getInstance().setHeight(196),
                    child: Stack(
                      fit: StackFit.expand,
                      alignment: Alignment.centerLeft,
                      children: [
                        ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: _images.length,
                          itemBuilder: (context, int index) {
                            return Padding(
                              padding: EdgeInsets.only(
                                left: ScreenUtil.getInstance().setWidth(
                                  16.0 + (index == 0 ? 77 : 0),
                                ),
                              ),
                              child: Image.asset(
                                _images[index],
                                fit: BoxFit.fill,
                                width: ScreenUtil.getInstance().setHeight(196),
                                height: ScreenUtil.getInstance().setHeight(196),
                              ),
                            );
                          },
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            width: ScreenUtil.getInstance().setWidth(77),
                            height: ScreenUtil.getInstance().setHeight(111),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(12),
                                  bottomRight: Radius.circular(12),
                                )),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0,
                                  vertical: 8.0,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      '36',
                                      style: TextStyle(
                                        fontSize:
                                            ScreenUtil.getInstance().setSp(40),
                                        color: Color(0xFFCABFAB),
                                      ),
                                    ),
                                    Text(
                                      'POSTS',
                                      style: TextStyle(
                                        fontSize:
                                            ScreenUtil.getInstance().setSp(14),
                                        color: Color(0xFFAEB5BC),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 40,
                      bottom: ScreenUtil.getInstance().setHeight(68),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        TextColumn(
                          title: '2041',
                          subtitle: 'FOLLOWING',
                        ),
                        SizedBox(width: ScreenUtil.getInstance().setWidth(42)),
                        TextColumn(
                          title: '302K',
                          subtitle: 'FOLLOWERS',
                        ),
                        SizedBox(width: ScreenUtil.getInstance().setWidth(30)),
                        ConstrainedBox(
                          constraints: BoxConstraints(
                            minWidth: ScreenUtil.getInstance().setWidth(137),
                            minHeight: ScreenUtil.getInstance().setHeight(42),
                          ),
                          child: RaisedButton(
                            color: Color(0xFFDFD8C8),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(26),
                            ),
                            onPressed: () {},
                            child: Text(
                              'FOLLOWING',
                              style: TextStyle(
                                fontSize: ScreenUtil.getInstance().setSp(14),
                                color: Color(0xFF41444B),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Center(
                            child: Image.asset(
                              'assets/DM.png',
                              fit: BoxFit.fill,
                              width: ScreenUtil.getInstance().setWidth(21),
                              height: ScreenUtil.getInstance().setWidth(21),
                            ),
                          ),
                        ),
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

class TextColumn extends StatelessWidget {
  final String title;
  final String subtitle;

  const TextColumn({
    Key key,
    this.title,
    this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(
            fontSize: ScreenUtil.getInstance().setSp(25),
            color: Colors.white,
          ),
        ),
        Text(
          subtitle,
          style: TextStyle(
            fontSize: ScreenUtil.getInstance().setSp(11),
            color: Color(0xFFDFD8C8),
          ),
        ),
      ],
    );
  }
}
