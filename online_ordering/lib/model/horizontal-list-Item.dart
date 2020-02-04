import 'package:flutter/material.dart';

class HorizontalListItem {
  final String name;
  final Color bgColor;
  final Color textColor;
  final String image;
  final double price;

  const HorizontalListItem({
    this.name,
    this.bgColor,
    this.image,
    this.price,
    this.textColor,
  });
}

const horizontalListItems = [
  HorizontalListItem(
    name: "Hamburg",
    image: "assets/burger.png",
    price: 21,
    bgColor: Color(0xFFFFEAC5),
    textColor: Color(0xFFEDC087),
  ),
  HorizontalListItem(
    name: "Chips",
    image: "assets/fries.png",
    price: 15,
    bgColor: Color(0xFFC3E3FF),
    textColor: Color(0xFF698CAC),
  ),
  HorizontalListItem(
    name: "Doughnut",
    image: "assets/doughnut.png",
    price: 15,
    bgColor: Color(0xFFD7FBD9),
    textColor: Color(0xFF89E1A1),
  ),
];
