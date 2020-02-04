import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_bicycle_app_ui/app/model/model.dart';
import 'package:flutter_bicycle_app_ui/app/pages/product_detail.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/HomePage';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final product = products[0];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            flex: 4,
            child: SizedBox(
              height: 500,
              width: double.infinity,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  double w = constraints.maxWidth;
                  double h = constraints.maxHeight;
                  return Stack(
                    children: <Widget>[
                      // 背景图
                      Align(
                        alignment: Alignment.topRight,
                        child: Hero(
                          tag: "bg",
                          child: Container(
                            width: w * .9,
                            height: h * .75,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                      // 文字
                      Positioned(
                        top: 50,
                        left: 65,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Hero(
                              tag: 'type',
                              child: Text(
                                product.type,
                                style: Theme.of(context).textTheme.title,
                              ),
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Hero(
                              tag: 'name',
                              child: Text(
                                product.name,
                                style: Theme.of(context)
                                    .textTheme
                                    .display2
                                    .copyWith(color: Colors.black),
                              ),
                            )
                          ],
                        ),
                      ),
                      // 自行车图片
                      Positioned(
                        bottom: 0,
                        left: -50,
                        child: Hero(
                          tag: product.name,
                          child: Image.asset(
                            product.imgUrl,
                            width: 370,
                            height: 350,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Amazing Speed.",
                    style: Theme.of(context).textTheme.title,
                  ),
                  SizedBox(height: 6),
                  Text(
                    "Incredible Power.",
                    style: Theme.of(context).textTheme.subtitle,
                  ),
                  SizedBox(height: 20),
                  Text(
                    "The Top Fuel 9.9 XX1 AXS is built for Speed and Capability on Any terrein",
                    style: Theme.of(context).textTheme.subhead,
                  ),
                  SizedBox(height: 16),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: EdgeInsets.only(right: 22),
                      child: Transform.rotate(
                        angle: math.pi / 180 * 180, // 旋转下图标
                        child: IconButton(
                          iconSize: 33,
                          icon: Icon(Icons.keyboard_backspace),
                          onPressed: () {
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                transitionDuration: Duration(milliseconds: 400),
                                pageBuilder: (
                                  BuildContext context,
                                  Animation animation,
                                  Animation secondaryAnimation,
                                ) {
                                  return FadeTransition(
                                    opacity: animation,
                                    child: ProductDetail(
                                      product: product,
                                    ),
                                  );
                                },
                              ),
                            );

                            // Navigator.of(context).push(
                            //   MaterialPageRoute(
                            //     builder: (_) => ProductDetail(
                            //       product: product,
                            //     ),
                            //   ),
                            // );
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
