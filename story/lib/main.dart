import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_story_app_ui/data.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController controller;
  double currentPage = images.length - 1.0;

  @override
  void initState() {
    super.initState();
    // 初始化为最后一张
    controller = PageController(initialPage: currentPage.toInt())
      ..addListener(() {
        setState(() {
          currentPage = controller.page;
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    // 使用container来设置页面的背景色
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF2d3447),
            Color(0xFF1b1e44),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              // 工具栏
              Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).padding.top,
                  left: 12.0,
                  right: 12.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.menu,
                        color: Colors.white,
                        size: 30.0,
                      ),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.search,
                        color: Colors.white,
                        size: 30.0,
                      ),
                      onPressed: () {},
                    )
                  ],
                ),
              ),
              SizedBox(height: 8.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Trending",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 46.0,
                        fontFamily: "Calibre-Semibold",
                        letterSpacing: 1.0,
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.more_horiz,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFff6e6e),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 6.0),
                          child: Text(
                            'Animated',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      '25+ Stories',
                      style: TextStyle(
                        color: Colors.blueAccent,
                      ),
                    ),
                  ],
                ),
              ),
              Stack(
                children: <Widget>[
                  CardScrollWidget(currentPage),
                  Positioned.fill(
                    child: PageView.builder(
                      itemCount: images.length,
                      controller: controller,
                      reverse: true, // 相反排序
                      itemBuilder: (context, index) {
                        return Container();
                      },
                    ),
                  ),
                ],
              ),

              SizedBox(height: 8.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Favourite",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 46.0,
                        fontFamily: "Calibre-Semibold",
                        letterSpacing: 1.0,
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.more_horiz,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 6.0),
                          child: Text(
                            'Latest',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      '9+ Stories',
                      style: TextStyle(
                        color: Colors.blueAccent,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 18.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Image.asset("assets/image_02.jpg",
                          width: 296.0, height: 222.0),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

double cardAspectRatio = 12.0 / 16.0;
// TODO: 不知道为什么要 * 1.2
double widgetAspectRatio = cardAspectRatio * 1.2;

class CardScrollWidget extends StatelessWidget {
  final double currentPage;
  final double padding = 20.0;
  final double verticalInset = 20.0; // 垂直插图

  const CardScrollWidget(this.currentPage);

  @override
  Widget build(BuildContext context) {
    // AspectRatio: 创建具有特定宽高比的窗口小部件
    return AspectRatio(
      aspectRatio: widgetAspectRatio,
      child: LayoutBuilder(
        builder: (context, contraints) {
          print(contraints);
          // 当前容器的宽高
          double width = contraints.maxWidth;
          double height = contraints.maxHeight;

          // 安全宽高, 减去padding
          double safeWidth = width - (padding * 2);
          double safeHeight = height - (padding * 2);

          // 主卡的宽高
          double heightOfPrimaryCard = safeHeight;
          double widthOfPrimaryCard = heightOfPrimaryCard * cardAspectRatio;

          // 卡片之间的间距
          double primaryCardLeft =
              safeWidth - widthOfPrimaryCard; // 安全宽度减去卡片宽度，得到剩下的空间
          double horizontalInset = primaryCardLeft / 2;

          // 储存卡片列表
          List<Widget> cardList = new List();

          for (var i = 0; i < images.length; i++) {
            // 0-3=-3，1-3=-2，2-3=-1，3-3=0， 这里做了下顺序转换
            double delta = i - currentPage;
            // print('i: $i');
            // print('currentPage: $currentPage');
            // print('delta: $delta');

            // 已经开始滑动
            // 弹出视图外，参数的大小，还会影响速度
            bool isOnRight = delta > 0;
            int onRightOffset = isOnRight ? 20 : 1;

            // left的边距
            double start = padding +
                max(
                  primaryCardLeft - horizontalInset * -delta * onRightOffset,
                  0.0,
                );

            double newPadding = padding + verticalInset * max(-delta, 0.0);
            Widget cardItem = Positioned.directional(
              top: newPadding,
              bottom: newPadding,
              textDirection: TextDirection.rtl, // 注意这个参数
              start: start, // right的边距
              child: Opacity(
                opacity: 1,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          offset: Offset(3.0, 6.0),
                          blurRadius: 10.0,
                        )
                      ],
                    ),
                    child: AspectRatio(
                      aspectRatio: cardAspectRatio,
                      child: Stack(
                        fit: StackFit.expand,
                        children: <Widget>[
                          Image.asset(images[i], fit: BoxFit.cover),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );

            cardList.add(cardItem);
          }

          return Stack(children: cardList);
        },
      ),
    );
  }
}
