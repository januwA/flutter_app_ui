import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_ordering/pages/detail.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import '../model/horizontal-list-Item.dart';
import '../model/food-Item.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);
    _tabController = TabController(vsync: this, length: 4);
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // app bar
          _buildAppBar(),

          // header
          _buildHeader(),

          // search
          _buildSearch(),

          // Horizontal list
          _buildHorizontalList(),

          // tabs
          _buildTabView(),
        ],
      ),
    );
  }

  _buildAppBar() {
    return Padding(
      padding: EdgeInsets.all(ScreenUtil().setWidth(50.0)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Icon(Icons.menu, color: Colors.black),
          Container(
            width: ScreenUtil().setWidth(70),
            height: ScreenUtil().setWidth(70),
            decoration: BoxDecoration(
              color: Color(0xFFC7E7FF),
              image: DecorationImage(
                image: AssetImage("assets/tuxedo.png"),
                fit: BoxFit.contain,
              ),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  blurRadius: 6.0,
                  spreadRadius: 4.0,
                  offset: Offset(0.0, 3.0),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _buildHeader() {
    return Padding(
      padding: EdgeInsets.only(left: ScreenUtil().setWidth(50.0)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "SEARCH FOR",
            style: GoogleFonts.notoSans(
              fontWeight: FontWeight.w800,
              fontSize: ScreenUtil().setSp(50.0),
            ),
          ),
          Text(
            "PECIPES",
            style: GoogleFonts.notoSans(
              fontWeight: FontWeight.w800,
              fontSize: ScreenUtil().setSp(50.0),
            ),
          ),
        ],
      ),
    );
  }

  _buildSearch() {
    return Padding(
      padding: EdgeInsets.only(
        top: ScreenUtil().setWidth(40.0),
        left: ScreenUtil().setWidth(50.0),
        right: ScreenUtil().setWidth(50.0),
      ),
      child: Container(
        padding: EdgeInsets.only(left: 5),
        decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.1),
            borderRadius: BorderRadius.circular(16.0)),
        child: TextField(
          decoration: InputDecoration(
            hintText: "Search",
            hintStyle: GoogleFonts.notoSans(fontSize: 14.0),
            border: InputBorder.none,
            fillColor: Colors.grey.withOpacity(0.5),
            prefixIcon: Icon(Icons.search),
          ),
        ),
      ),
    );
  }

  _buildHorizontalList() {
    return Padding(
      padding: EdgeInsets.only(
        left: ScreenUtil().setWidth(50.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 20.0),
          Text(
            "Recommended",
            style: GoogleFonts.notoSans(
              fontWeight: FontWeight.w800,
              fontSize: ScreenUtil().setSp(40.0),
            ),
          ),
          SizedBox(height: 20.0),
          Container(
            height: 200,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: horizontalListItems.map((e) {
                return Padding(
                  padding: EdgeInsets.only(
                    left: ScreenUtil().setWidth(15.0),
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => DetailPage(
                            imgPaht: e.image,
                            foodName: e.name,
                            price: e.price,
                            heroTag: e.name,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      height: 175.0,
                      width: ScreenUtil.screenWidthDp / 2.8,
                      padding: EdgeInsets.only(
                        top: 30.0,
                        bottom: 20.0,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: e.bgColor,
                      ),
                      child: Column(
                        children: <Widget>[
                          Hero(
                            tag: e.name,
                            child: Container(
                              width: 75.0,
                              height: 75.0,
                              padding: EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: Image.asset(e.image),
                            ),
                          ),
                          Spacer(),
                          Text(
                            e.name,
                            style: GoogleFonts.notoSans(
                              fontSize: 17.0,
                              color: e.textColor,
                            ),
                          ),
                          Text(
                            "\$${e.price}",
                            style: GoogleFonts.notoSans(
                              fontSize: 15.0,
                              color: e.textColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  _buildTabView() {
    return Padding(
      padding: EdgeInsets.only(left: ScreenUtil().setWidth(30)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 10.0),
          TabBar(
            controller: _tabController,
            isScrollable: true, // tabs 是否可滚动
            indicatorColor: Colors.transparent, // 下划线的颜色
            labelColor: Colors.black, // 选中时的颜色
            unselectedLabelColor: Colors.grey.withOpacity(0.5), // 未选中时的颜色
            labelStyle: GoogleFonts.notoSans(
              fontSize: 16.0,
              fontWeight: FontWeight.w700,
            ), // 选中时的字体样式
            unselectedLabelStyle: GoogleFonts.notoSans(
              fontSize: 12.0,
              fontWeight: FontWeight.w500,
            ), // 未选中时的字体样式
            tabs: [
              Tab(child: Text("FEATURED")),
              Tab(child: Text("COMBOS")),
              Tab(child: Text("FAVORITES")),
              Tab(child: Text("RECOMMENDED")),
            ],
          ),
          Container(
            height: ScreenUtil().setHeight(320.0),
            padding: EdgeInsets.only(left: ScreenUtil().setWidth(30)),
            child: TabBarView(
              controller: _tabController,
              children: [
                FoodListItem(),
                FoodListItem(),
                FoodListItem(),
                FoodListItem(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FoodListItem extends StatefulWidget {
  @override
  _FoodListItemState createState() => _FoodListItemState();
}

class _FoodListItemState extends State<FoodListItem> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: foodItems.map(
        (e) {
          return Padding(
            padding: EdgeInsets.only(top: 15.0),
            child: Row(
              children: <Widget>[
                Container(
                  width: 75,
                  height: 75,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7.0),
                    color: Color(0xFFFFE4E0),
                  ),
                  child: Center(
                    child: Image.asset(
                      e.image,
                      height: 50,
                      width: 50,
                    ),
                  ),
                ),
                SizedBox(width: 18),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        e.name,
                        style: GoogleFonts.notoSans(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SmoothStarRating(
                        allowHalfRating: false,
                        onRatingChanged: (v) {},
                        starCount: e.star.ceil(),
                        rating: e.star,
                        color: Color(0xFFFFD427),
                        borderColor: Color(0xFFFFD427),
                        size: 15,
                        spacing: 0,
                      ),
                      SizedBox(height: 6),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            "\$${e.price}",
                            style: GoogleFonts.notoSans(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFFFF8A76),
                            ),
                          ),
                          SizedBox(width: 8),
                          Text(
                            "\$${e.originalPrice}",
                            style: GoogleFonts.notoSans(
                              decoration: TextDecoration.lineThrough,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey.withOpacity(0.3),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                FloatingActionButton(
                  heroTag: e.name,
                  mini: true,
                  backgroundColor: Color(0xFFFF8A76),
                  onPressed: () {},
                  child: Icon(Icons.add),
                ),
                SizedBox(width: 20),
              ],
            ),
          );
        },
      ).toList(),
    );
  }
}
