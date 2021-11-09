import 'package:flutter/material.dart';

class CircleShape extends StatelessWidget {
  const CircleShape({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment(2.5, -1.5),
      child: Container(
        height: 250,
        width: 250,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Color(
            0xFFE9B0A3,
          ),
        ),
      ),
    );
  }
}
