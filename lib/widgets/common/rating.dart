import 'package:book_reading/models/user.dart';
import 'package:flutter/material.dart';

class Rating extends StatelessWidget {
  const Rating({
    Key? key,
    required this.rating,
  }) : super(key: key);

  final double rating;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 30,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            Icons.star,
            color: Colors.amber[600],
            size: 18,
          ),
          Text(
            rating.toString(),
          ),
        ],
      ),
    );
  }
}
