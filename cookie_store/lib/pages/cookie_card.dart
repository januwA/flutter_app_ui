import 'package:flutetr_cookie_store_app_ui/data/coockie.dart';
import 'package:flutetr_cookie_store_app_ui/pages/cookie_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CookieCard extends StatefulWidget {
  final Cookie cookie;

  const CookieCard({Key key, this.cookie}) : super(key: key);
  @override
  _CookieCardState createState() => _CookieCardState();
}

class _CookieCardState extends State<CookieCard> {
  int _cound = 1;
  @override
  Widget build(BuildContext context) {
    double bottomFontSize = ScreenUtil.instance.setSp(14.0);
    double imageSize = ScreenUtil.instance.setHeight(75.0);
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => CookieDetail(
                cookiePic: widget.cookie.image,
                cookieprice: widget.cookie.price,
                cookiename: widget.cookie.name,
              ),
            ),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius:
                BorderRadius.circular(ScreenUtil.instance.setSp(15.0)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 3.0,
                blurRadius: 5.0,
              )
            ],
            color: Colors.white,
          ),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.all(5.0),
                  child: widget.cookie.isFavorite
                      ? Icon(Icons.favorite, color: Color(0xFFEF7532))
                      : Icon(Icons.favorite_border, color: Color(0xFFEF7532)),
                ),
              ),
              Expanded(
                child: Hero(
                  tag: widget.cookie.image,
                  child: Container(
                    height: imageSize,
                    width: imageSize,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(widget.cookie.image),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: ScreenUtil.instance.setHeight(7.0)),
              Text(
                widget.cookie.price,
                style: TextStyle(
                    color: Color(0xFFCC8053),
                    fontFamily: 'Varela',
                    fontSize: ScreenUtil.instance.setSp(14.0)),
              ),
              Text(
                widget.cookie.name,
                style: TextStyle(
                  color: Color(0xFF575E67),
                  fontFamily: 'Varela',
                  fontSize: ScreenUtil.instance.setSp(15.0),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(ScreenUtil.instance.setWidth(8.0)),
                child: Container(color: Color(0xFFEBEBEB), height: 1.0),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: ScreenUtil.instance.setWidth(5.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (!widget.cookie.added) ...[
                      IconButton(
                        onPressed: () {},
                        iconSize: 20,
                        icon: Icon(
                          Icons.shopping_basket,
                          color: Color(0xFFD17E50),
                        ),
                      ),
                      Text(
                        'Add to cart',
                        style: TextStyle(
                          fontFamily: 'Varela',
                          color: Color(0xFFD17E50),
                          fontSize: bottomFontSize,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ] else ...[
                      IconButton(
                        iconSize: 20,
                        icon: Icon(
                          Icons.remove_circle_outline,
                          color: Color(0xFFD17E50),
                        ),
                        onPressed: () {
                          setState(() {
                            _cound -= 1;
                          });
                        },
                      ),
                      Text(
                        _cound.toString(),
                        style: TextStyle(
                          fontFamily: 'Varela',
                          color: Color(0xFFD17E50),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        iconSize: 20,
                        icon: Icon(
                          Icons.add_circle_outline,
                          color: Color(0xFFD17E50),
                        ),
                        onPressed: () {
                          setState(() {
                            _cound += 1;
                          });
                        },
                      ),
                    ]
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
