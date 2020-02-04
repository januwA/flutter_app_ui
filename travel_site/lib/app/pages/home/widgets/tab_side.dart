import 'package:flutter/material.dart';

class TabSide extends StatelessWidget {
  final String image;
  final String label;
  final Function onTap;

  const TabSide({
    Key key,
    this.image,
    this.label,
    this.onTap,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        GestureDetector(
          onTap: onTap,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.asset(
              image,
              width: 68,
              height: 68,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 10),
        Text(
          label,
          style: TextStyle(
            fontSize: 11,
            color: Color(0xFF636363),
          ),
        ),
      ],
    );
  }
}
