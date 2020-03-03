import 'package:flutter/material.dart';
import 'package:flutter_headphone_app_store_ui/app/models/products.model.dart';
import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/HomePage';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex;
  @override
  void initState() {
    super.initState();
    _currentIndex = 0;
  }

  void changeCurrentIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFf3f6fb),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // header bar
            Padding(
              padding: EdgeInsets.only(
                left: 16.0,
                right: 16.0,
                top: MediaQuery.of(context).padding.top,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.sort),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.add_shopping_cart),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: Text(
                'Shop',
                style: Theme.of(context).textTheme.title,
              ),
            ),
            SizedBox(height: 20),

            // search input
            Container(
              width: double.infinity,
              height: 60,
              margin: EdgeInsets.symmetric(horizontal: 22),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    offset: Offset(0, 10),
                    blurRadius: 30,
                  )
                ],
              ),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(left: 18.0, right: 12.0),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Seearch...',
                      // hintStyle:
                      suffixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: EdgeInsets.only(left: 25),
              child: Text(
                'Headphones',
                style: Theme.of(context).textTheme.title,
              ),
            ),
            SizedBox(height: 10),

            // 头戴耳机列表
            Container(
              height: 220,
              child: ListView.builder(
                itemCount: products.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, int index) {
                  HeadPhone p = products[index];
                  return ProductCard(product: p);
                },
              ),
            ),
            SizedBox(height: 10),
            // 音箱
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 22),
              child: Stack(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 8),
                        child: Text(
                          'Speakers',
                          style: Theme.of(context).textTheme.title,
                        ),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 10.0,
                          right: 10.0,
                          bottom: 10.0,
                        ),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                offset: Offset(0, 6),
                                blurRadius: 6,
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 8.0,
                              top: 24.0,
                              bottom: 24.0,
                            ),
                            child: LayoutBuilder(
                              builder: (context, constraints) => Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  width: constraints.minWidth * 0.6,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'Rålis',
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle,
                                      ),
                                      Text(
                                        'haute red, slate blue, Mist Grey',
                                        style: Theme.of(context)
                                            .textTheme
                                            .caption,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Image.asset(
                      'assets/images/2.png',
                      fit: BoxFit.cover,
                      width: 150,
                      height: 160,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(),
        child: BubbleBottomBar(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          currentIndex: _currentIndex,
          onTap: changeCurrentIndex,
          opacity: 1,
          items: <BubbleBottomBarItem>[
            BubbleBottomBarItem(
              backgroundColor: Colors.black,
              icon: Icon(
                Icons.home,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.home,
                color: Colors.white,
              ),
              title: Text(
                "Home",
                style: TextStyle(color: Colors.white),
              ),
            ),
            BubbleBottomBarItem(
              backgroundColor: Colors.black,
              icon: Icon(
                Icons.dashboard,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.dashboard,
                color: Colors.white,
              ),
              title: Text(
                "Shop",
                style: TextStyle(color: Colors.white),
              ),
            ),
            BubbleBottomBarItem(
              backgroundColor: Colors.black,
              icon: Icon(
                Icons.favorite_border,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.favorite_border,
                color: Colors.white,
              ),
              title: Text(
                "Favorite",
                style: TextStyle(color: Colors.white),
              ),
            ),
            BubbleBottomBarItem(
              backgroundColor: Colors.black,
              icon: Icon(
                Icons.person_outline,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.person_outline,
                color: Colors.white,
              ),
              title: Text(
                "Pro file",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final HeadPhone product;

  const ProductCard({Key key, this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0),
      // item 盒子
      child: Container(
        width: 165,
        height: 240,
        // color: Colors.red,
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            // 白色部分
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(left: 5, right: 5, bottom: 25),
                child: Container(
                  width: 140,
                  height: 170,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        offset: Offset(0, 10),
                        blurRadius: 12,
                      )
                    ],
                  ),
                  child: Padding(
                    // 产品叙述
                    padding: const EdgeInsets.only(left: 18.0, bottom: 18.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          product.title,
                          style: Theme.of(context).textTheme.subtitle,
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          '${product.color} colors',
                          style: Theme.of(context).textTheme.caption,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),

            // 产品图片
            Positioned(
              right: -30,
              top: -10,
              child: Image.asset(
                product.image,
                width: 170,
                height: 150,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
