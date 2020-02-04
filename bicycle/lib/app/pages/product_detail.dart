import 'package:flutter/material.dart';
import 'package:flutter_bicycle_app_ui/app/model/model.dart';
import 'package:flutter_bicycle_app_ui/utils/style.dart';

class ProductDetail extends StatelessWidget {
  static const routeName = '/ProductDetail';

  final Product product;

  const ProductDetail({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Hero(
            tag: "bg",
            child: Container(
              width: double.infinity,
              height: double.infinity,
              color: Color(0xFFFFC5C5),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(left: 35),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // 应用栏
                  Padding(
                    padding: EdgeInsets.only(
                        left: 18, right: 18, top: 50, bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Hero(
                          tag: 'type',
                          child: Text(
                            product.type,
                            style: Theme.of(context).textTheme.title,
                          ),
                        ),
                        Container(
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.shopping_cart,
                            // size: 18,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // 产品图片
                  Hero(
                    tag: product.name,
                    child: Image.asset(
                      product.imgUrl,
                      width: 280,
                      height: 250,
                    ),
                  ),
                  SizedBox(height: 50),

                  // 说明
                  Hero(
                    tag: 'name',
                    child: Text(
                      product.name,
                      style: Theme.of(context)
                          .textTheme
                          .display2
                          .copyWith(color: Colors.black),
                    ),
                  ),
                  SizedBox(height: 30),
                  Text(
                    "Top fuel 9.9 XX1 AXS is top tiew full auto"
                    "suspension carbon mountain bike.",
                    style: AppStyle.descStyle,
                  ),
                  SizedBox(height: 30),
                  Text(
                      "It's also spec'd with high—end ROCkShox"
                      "suspension and lots of carbon—including"
                      "the wheels, bars, and shift levers. You'll fly"
                      "through singletrack and rip descents on"
                      "this bike",
                      style: AppStyle.descStyle),
                  SizedBox(height: 40),

                  // 价格
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "\$${product.price}",
                        style: AppStyle.headingStyle,
                      ),
                      FlatButton(
                        child: Text("Add to cart".toUpperCase(),
                            style: AppStyle.flatButtonStyle),
                        onPressed: () {},
                      )
                    ],
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
