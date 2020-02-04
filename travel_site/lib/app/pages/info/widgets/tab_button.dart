import 'package:flutter/material.dart';

class TabButton extends StatelessWidget {
  final String image;
  final String label;
  final Function onTap;

  const TabButton({Key key, this.image, this.label, this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        GestureDetector(
          onTap: onTap,
          child: Opacity(
            opacity: 0.58,
            child: Container(
              width: 68,
              height: 68,
              decoration: BoxDecoration(
                color: Color(0xFF19C563),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
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
