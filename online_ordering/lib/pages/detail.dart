import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:online_ordering/model/horizontal-list-Item.dart';

class DetailPage extends StatefulWidget {
  final String imgPaht;
  final String foodName;
  final double price;
  final String heroTag;

  const DetailPage({
    Key key,
    this.imgPaht,
    this.foodName,
    this.price,
    this.heroTag,
  }) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int _num;
  double totalPrice;

  int get num => _num;
  set num(int nv) {
    _num = nv <= 0 ? 1 : nv;
    totalPrice = _num * widget.price;
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);
    totalPrice = widget.price;
    _num = 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // appbar
          _buildAppbar(),

          // title
          _buildTitle(),

          // image view
          _buildImageView(),

          // price and add cart
          _buildAddCart(),

          // featured
          _buildFeatured(),
        ],
      ),
    );
  }

  _buildAppbar() {
    final theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.all(ScreenUtil().setWidth(50.0)),
      child: Row(
        children: <Widget>[
          Icon(Icons.menu, color: Colors.black),
          Spacer(),
          Stack(
            children: [
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: theme.primaryColor,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: theme.primaryColor.withOpacity(0.3),
                        blurRadius: 6.0,
                        spreadRadius: 4.0,
                        offset: Offset(0.0, 3.0),
                      ),
                    ],
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.shopping_cart,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
              Positioned(
                right: 0,
                top: 0,
                child: Container(
                  width: 15,
                  height: 15,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      "1",
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 10,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _buildTitle() {
    return Padding(
      padding: EdgeInsets.only(left: ScreenUtil().setWidth(50.0)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Super",
            style: GoogleFonts.notoSans(
              fontWeight: FontWeight.w800,
              fontSize: ScreenUtil().setSp(60.0),
            ),
          ),
          Text(
            widget.foodName.toUpperCase(),
            style: GoogleFonts.notoSans(
              fontWeight: FontWeight.w800,
              fontSize: ScreenUtil().setSp(60.0),
            ),
          ),
        ],
      ),
    );
  }

  _buildImageView() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Row(
        children: <Widget>[
          SizedBox(width: 20),
          Hero(
            tag: widget.heroTag,
            child: Image.asset(widget.imgPaht),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(right: 38.0),
            child: Column(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color:
                              Theme.of(context).primaryColor.withOpacity(0.3),
                          blurRadius: 12.0,
                          spreadRadius: 2.0,
                          offset: Offset(0.0, 3.0),
                        ),
                      ]),
                  child: IconButton(
                      icon: Icon(
                        Icons.favorite_border,
                        color: Theme.of(context).primaryColor,
                      ),
                      onPressed: () {}),
                ),
                SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Theme.of(context).primaryColor.withOpacity(0.3),
                        blurRadius: 12.0,
                        spreadRadius: 2.0,
                        offset: Offset(0.0, 3.0),
                      ),
                    ],
                  ),
                  child: IconButton(
                      icon: Icon(
                        Icons.share,
                        color: Theme.of(context).primaryColor,
                      ),
                      onPressed: () {}),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _buildAddCart() {
    return Padding(
      padding: EdgeInsets.only(left: ScreenUtil().setWidth(50.0)),
      child: Row(
        children: <Widget>[
          Text(
            "\$$totalPrice",
            style: GoogleFonts.notoSans(
              fontSize: 25,
              fontWeight: FontWeight.w600,
              color: Colors.grey,
            ),
          ),
          SizedBox(width: ScreenUtil().setWidth(50.0)),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  bottomLeft: Radius.circular(8),
                ),
              ),
              padding: EdgeInsets.all(8),
              child: Row(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        IconButton(
                          iconSize: 14,
                          color: Theme.of(context).primaryColor,
                          icon: Icon(Icons.remove),
                          onPressed: () => setState(() {
                            num--;
                          }),
                        ),
                        Text(
                          num.toString(),
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        IconButton(
                          iconSize: 14,
                          color: Theme.of(context).primaryColor,
                          icon: Icon(Icons.add),
                          onPressed: () => setState(() {
                            num++;
                          }),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: FlatButton(
                      onPressed: () {},
                      child: Text(
                        "Add to cart",
                        style: GoogleFonts.notoSans(
                          color: Colors.white,
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

  _buildFeatured() {
    return Padding(
      padding: EdgeInsets.only(left: ScreenUtil().setWidth(50.0)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
              top: ScreenUtil().setHeight(40),
              bottom: ScreenUtil().setHeight(40),
            ),
            child: Text(
              "FEATURED",
              style: GoogleFonts.notoSans(
                fontSize: 16,
              ),
            ),
          ),
          Container(
            height: ScreenUtil().setHeight(300.0),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                FeaturedPage([
                  HorizontalListItem(
                    name: "Sweet cheese",
                    image: "assets/cheese.png",
                    price: 11,
                    bgColor: Color(0xFFFCD7F7),
                  ),
                  HorizontalListItem(
                    name: "Sweet popcorn",
                    image: "assets/popcorn.png",
                    price: 6,
                    bgColor: Color(0xFFFED6CF),
                  ),
                ]),
                FeaturedPage([
                  HorizontalListItem(
                    name: "taco",
                    image: "assets/taco.png",
                    price: 6,
                    bgColor: Color(0xFFC4E2FD),
                  ),
                  HorizontalListItem(
                    name: "sandwich",
                    image: "assets/sandwich.png",
                    price: 6,
                    bgColor: Color(0xFFC5F6C5),
                  ),
                ]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FeaturedPage extends StatelessWidget {
  final List<HorizontalListItem> list;

  const FeaturedPage(this.list, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil.screenWidthDp * 0.6,
      child: Column(
        children: list.map((e) {
          return ListTile(
            leading: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7.0),
                color: e.bgColor,
              ),
              padding: EdgeInsets.all(8),
              child: Image.asset(e.image),
            ),
            title: Text(
              e.name,
              style: GoogleFonts.notoSans(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            subtitle: Text(
              "\$${e.price}",
              style: GoogleFonts.notoSans(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xFFFF8A76),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
