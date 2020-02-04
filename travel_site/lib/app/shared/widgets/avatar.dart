import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF19C563),
        shape: BoxShape.circle,
        border: Border.all(
          color: Color(0xFF707070),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset('assets/avatar.png'),
      ),
    );
  }
}
