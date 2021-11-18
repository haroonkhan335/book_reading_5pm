import 'package:book_reading/models/user.dart';
import 'package:flutter/material.dart';

class BookCover extends StatelessWidget {
  const BookCover({
    Key? key,
    required this.book,
    required this.height,
    required this.width,
  }) : super(key: key);

  final Book book;

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
            book.bookCover,
          ),
        ),
      ),
    );
  }
}
