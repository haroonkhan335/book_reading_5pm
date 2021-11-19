import 'package:book_reading/models/user.dart';
import 'package:book_reading/utils/helper.dart';
import 'package:book_reading/widgets/book_screen_widget/book_summary.dart';
import 'package:flutter/material.dart';

class DetailsOverlay extends StatelessWidget {
  DetailsOverlay({
    Key? key,
    required this.book,
  }) : super(key: key);

  final Book book;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(30),
        bottomRight: Radius.circular(30),
      ),
      child: Container(
        height: screenHeight(context) * 0.45,
        width: screenWidth(context),
        color: Colors.grey.withOpacity(
          0.8,
        ),
        child: Center(
          child: Row(
            children: [
              Expanded(flex: 1, child: SizedBox()),
              Expanded(
                flex: 3,
                child: BookSummary(book: book),
              ),
              Expanded(
                flex: 3,
                child: Image(
                  height: screenHeight(context) * 0.2,
                  image: NetworkImage(
                    book.bookCover,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
