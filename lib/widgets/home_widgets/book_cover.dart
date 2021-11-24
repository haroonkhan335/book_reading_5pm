import 'package:book_reading/models/user.dart';
import 'package:flutter/material.dart';

class BookCover extends StatelessWidget {
  const BookCover({
    Key? key,
    required this.bookCover,
    required this.height,
    required this.width,
  }) : super(key: key);

  final String bookCover;

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            bookCover,
          ),
        ),
      ),
    );
  }
}
