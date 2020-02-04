import 'package:flutter/material.dart';
import 'package:flutter_adidas_shoes_ecommerce_app_ui/data.dart';
import 'package:flutter_adidas_shoes_ecommerce_app_ui/utils.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: TextTheme(
          title: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
            fontFamily: "Montserrat-Bold",
          ),
          body1: TextStyle(
            color: Color(0xFF949598),
            fontSize: 10.0,
            fontFamily: "Montserrat-SemiBold",
          ),
        ),
        appBarTheme: AppBarTheme(
          textTheme: TextTheme(
            title: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
              fontFamily: "Montserrat-Bold",
            ),
          ),
        ),
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF696D77),
            Color(0xFF292C36),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              size: screenAwareSize(20.0, context),
            ),
            onPressed: () {},
          ),
          title: Text('Energy Cloud'),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.favorite_border,
                size: screenAwareSize(20.0, context),
                color: Colors.white,
              ),
              onPressed: () {},
            )
          ],
        ),
        body: ListView(
          children: <Widget>[
            ProductScreenTopPart(),
            ProductScreenBottomPart(),
          ],
        ),
      ),
    );
  }
}

class ProductScreenTopPart extends StatefulWidget {
  @override
  _ProductScreenTopPartState createState() => _ProductScreenTopPartState();
}

class _ProductScreenTopPartState extends State<ProductScreenTopPart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: screenAwareSize(235, context),
      child: Stack(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                child: Image.asset("assets/adidas.png",
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 60.0, right: 35.0),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    width: screenAwareSize(50.0, context),
                    height: screenAwareSize(50.0, context),
                    child: Image.asset("assets/360.png"),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            left: screenAwareSize(18.0, context),
            bottom: screenAwareSize(15.0, context),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Rating"),
                SizedBox(height: screenAwareSize(8.0, context)),
                Row(
                  children: <Widget>[
                    SizedBox(width: 8.0),
                    Icon(Icons.star, color: Color(0xFFFFE600)),
                    SizedBox(width: screenAwareSize(5.0, context)),
                    Text(
                      "4.5",
                      style: TextStyle(
                        color: Color(0xFFFFE600),
                      ),
                    ),
                    SizedBox(width: screenAwareSize(5.0, context)),
                    Text(
                      "(378 People)",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.0,
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ProductScreenBottomPart extends StatefulWidget {
  @override
  _ProductScreenBottomPartState createState() =>
      _ProductScreenBottomPartState();
}

class _ProductScreenBottomPartState extends State<ProductScreenBottomPart> {
  bool isExpanded = false;
  int currentSizeIndex = 0;
  int currentColorIndex = 0;
  int _counter = 0;

  void _expand() {
    setState(() {
      isExpanded ? isExpanded = false : isExpanded = true;
    });
  }

  void _increase() {
    setState(() {
      _counter++;
    });
  }

  void _decrease() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // 详情
          Padding(
            padding: EdgeInsets.only(left: screenAwareSize(18.0, context)),
            child: Text("Product Description"),
          ),
          SizedBox(height: screenAwareSize(8.0, context)),

          Padding(
            padding: EdgeInsets.only(
              left: screenAwareSize(26.0, context),
              right: screenAwareSize(18.0, context),
            ),
            child: AnimatedCrossFade(
              firstChild: Text(
                desc,
                maxLines: 2,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: screenAwareSize(10.0, context),
                  fontFamily: "Montserrat-Medium",
                ),
              ),
              secondChild: Text(
                desc,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: screenAwareSize(10.0, context),
                  fontFamily: "Montserrat-Medium",
                ),
              ),
              crossFadeState: isExpanded
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              duration: kThemeAnimationDuration,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: screenAwareSize(26.0, context),
              right: screenAwareSize(18.0, context),
            ),
            child: GestureDetector(
              onTap: _expand,
              child: Text(
                isExpanded ? "less" : "more..",
                style: TextStyle(
                  color: Color(0xFFFB382F),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          SizedBox(height: screenAwareSize(12.0, context)),

          // 大小和数量
          Padding(
            padding: EdgeInsets.only(
              left: screenAwareSize(15.0, context),
              right: screenAwareSize(75.0, context),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Size"),
                Text("Quantity"),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: screenAwareSize(20.0, context),
              right: screenAwareSize(10.0, context),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                // 大小
                Container(
                  height: screenAwareSize(38.0, context),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: sizeNumlist.map((item) {
                      var index = sizeNumlist.indexOf(item);
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            currentSizeIndex = index;
                          });
                        },
                        child:
                            sizeItem(item, index == currentSizeIndex, context),
                      );
                    }).toList(),
                  ),
                ),
                // 数量
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    width: screenAwareSize(100.0, context),
                    height: screenAwareSize(30.0, context),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Flexible(
                          flex: 3,
                          child: GestureDetector(
                            onTap: _decrease,
                            child: Container(
                              height: double.infinity,
                              child: Center(
                                child: Text(
                                  "-",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.0,
                                      fontFamily: "Montserrat-Bold"),
                                ),
                              ),
                            ),
                          ),
                        ),
                        divider(),
                        Flexible(
                          flex: 3,
                          child: Container(
                            height: double.infinity,
                            child: Center(
                              child: Text(
                                '$_counter',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.0,
                                    fontFamily: "Montserrat-Bold"),
                              ),
                            ),
                          ),
                        ),
                        divider(),
                        Flexible(
                          flex: 3,
                          child: GestureDetector(
                            onTap: _increase,
                            child: Container(
                              height: double.infinity,
                              child: Center(
                                child: Text("+",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20.0,
                                        fontFamily: "Montserrat-Bold")),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // 颜色选择
          SizedBox(height: 8.0),
          Padding(
            padding: EdgeInsets.only(left: screenAwareSize(18.0, context)),
            child: Text("Select Color"),
          ),
          SizedBox(height: screenAwareSize(8.0, context)),
          // 颜色旋转列表
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(left: screenAwareSize(20.0, context)),
            height: screenAwareSize(34.0, context),
            child: Row(
              children: colorSelector(),
            ),
          ),
          SizedBox(height: screenAwareSize(8.0, context)),

          // 价格
          Padding(
            padding: EdgeInsets.only(left: screenAwareSize(20.0, context)),
            child: Text("Price"),
          ),

          Container(
            width: double.infinity,
            height: screenAwareSize(120.0, context),
            child: Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: screenAwareSize(22.0, context)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // 显示价格
                      Padding(
                        padding: EdgeInsets.only(
                            left: screenAwareSize(18.0, context)),
                        child: Row(
                          children: <Widget>[
                            Text("\$",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: screenAwareSize(26.0, context),
                                    fontFamily: "Montserrat-Medium")),
                            SizedBox(width: screenAwareSize(2.0, context)),
                            Text("80",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: screenAwareSize(33.0, context),
                                    fontFamily: "Montserrat-Medium"))
                          ],
                        ),
                      ),
                      SizedBox(height: screenAwareSize(10.0, context)),
                      // 加入购物车按钮
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: MaterialButton(
                          color: Color(0xFFFB382F),
                          padding: EdgeInsets.symmetric(
                            vertical: screenAwareSize(14.0, context),
                          ),
                          onPressed: () {},
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: screenAwareSize(35.0, context),
                              ),
                              child: Text(
                                "Add To Cart",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: screenAwareSize(15.0, context)),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  right: -40.0,
                  bottom: -60.0,
                  child: Image.asset("assets/cart.png",
                      width: screenAwareSize(190.0, context),
                      height: screenAwareSize(155.0, context),
                      fit: BoxFit.cover),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  sizeItem(String size, bool isSelected, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0),
      child: Container(
        width: screenAwareSize(30.0, context),
        height: screenAwareSize(30.0, context),
        decoration: BoxDecoration(
          color: isSelected ? Color(0xFFFC3930) : Color(0xFF525663),
          borderRadius: BorderRadius.circular(5.0),
          boxShadow: [
            BoxShadow(
              color:
                  isSelected ? Colors.black.withOpacity(0.5) : Colors.black12,
              offset: Offset(0.0, 10.0),
              blurRadius: 10.0,
            )
          ],
        ),
        child: Center(
          child: Text(
            size,
            style:
                TextStyle(color: Colors.white, fontFamily: "Montserrat-Bold"),
          ),
        ),
      ),
    );
  }

  divider() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
      child: Container(
        width: 0.8,
        color: Colors.black,
      ),
    );
  }

  List<Widget> colorSelector() {
    List<Widget> colorItemList = new List();

    for (var i = 0; i < colors.length; i++) {
      colorItemList.add(
        colorItem(
          colors[i],
          i == currentColorIndex,
          context,
          () {
            setState(() {
              currentColorIndex = i;
            });
          },
        ),
      );
    }

    return colorItemList;
  }

  Widget colorItem(
      Color color, bool isSelected, BuildContext context, VoidCallback _ontab) {
    return GestureDetector(
      onTap: _ontab,
      child: Padding(
        padding: EdgeInsets.only(left: screenAwareSize(10.0, context)),
        child: Container(
          width: screenAwareSize(30.0, context),
          height: screenAwareSize(30.0, context),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(5.0),
            boxShadow: isSelected
                ? [
                    BoxShadow(
                        color: Colors.black.withOpacity(.8),
                        blurRadius: 10.0,
                        offset: Offset(0.0, 10.0))
                  ]
                : [],
          ),
          child: ClipPath(
            clipper: MClipper(),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              color: color,
            ),
          ),
        ),
      ),
    );
  }
}

class MClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double h = size.height;
    double w = size.width;
    double offset = 0.3;
    Path path = Path()
      ..lineTo(0.0, h)
      ..lineTo(w * offset, h)
      ..lineTo(w, h * offset)
      ..lineTo(w, 0.0)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
